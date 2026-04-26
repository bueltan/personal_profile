import 'package:denis_profile/components/app_drawer.dart';
import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:denis_profile/models/item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'dart:io' show Platform;
// import 'send_message/sent_messages.dart';
import 'package:web/web.dart' as html;
import 'dart:js_interop';
import 'package:intl/intl.dart';
import 'send_message/client.dart';

class PageStateController extends GetxController {
  late AnimationController controllerDrawer;

  bool expanded = true;
  final AtomController atomController = Get.find<AtomController>();

  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  String? ipv4;
  String? hostname;

  @override
  void onInit() {
    super.onInit();

    _initVisitorTracking();
    _registerBeforeUnloadHandler();
  }

  void _initVisitorTracking() {
    () async {
      hostname = await _safeGetHostname();
      ipv4 = await _safeGetIpv4();

      final message = _buildLogMessage(
        prefix: 'new visitor',
        ipv4: ipv4,
        hostname: hostname,
      );

      _safeSendLog(message);
    }();
  }

  late final html.EventListener _beforeUnloadListener;

  void _registerBeforeUnloadHandler() {
    _beforeUnloadListener = ((html.Event e) {
      final message = _buildLogMessage(
        prefix: 'beforeunload',
        ipv4: ipv4,
        hostname: hostname,
      );

      _safeSendLog(message);

      final event = e as html.BeforeUnloadEvent;
      event.preventDefault();
      event.returnValue = '';
    }).toJS;

    html.window.addEventListener('beforeunload', _beforeUnloadListener);
  }

  @override
  void onClose() {
    html.window.removeEventListener('beforeunload', _beforeUnloadListener);
    pageController.dispose();
    super.onClose();
  }

  Future<String?> _safeGetHostname() async {
    try {
      return _getHostnameForCurrentPlatform();
    } catch (_) {
      return null;
    }
  }

  Future<String?> _safeGetIpv4() async {
    try {
      return await Ipify.ipv4();
    } catch (_) {
      return null;
    }
  }

  String _getHostnameForCurrentPlatform() {
    // Platform.localHostname is not supported on Flutter Web/WASM.
    // Replace this with a web-safe alternative if you want a "hostname",
    // e.g. html.window.location.hostname (site host) or omit it.
    return html.window.location.hostname;
  }

  String _buildLogMessage({
    required String prefix,
    required String? ipv4,
    required String? hostname,
  }) {
    final formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    return '$prefix ipv4: ${ipv4 ?? ""}, hostname: ${hostname ?? ""}, date: $formattedDate';
  }

  void _safeSendLog(String message) {
    try {
      sendGoogleFormLog(message);
    } catch (_) {}
  }

  void jumpToPage(
      {PageItem? pageItem,
      Duration distanceTime = const Duration(milliseconds: 500),
      animate = true}) async {
    try {
      String message = "change page to ${pageItem?.keyName} ";
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      message =
          "$message ipv4: ${ipv4 ?? ""}, hostname: ${hostname ?? ""}, date: $formattedDate";
      sendGoogleFormLog(message);
    } catch (e) {
      print(e);
    }
    if (animate) {
      pageController.animateToPage(pageItem?.indexPage ?? 0,
          duration: distanceTime, curve: Curves.ease);
    } else {
      pageController.jumpToPage(pageItem?.indexPage ?? 0);
    }
  }

  void expandPage() {
    expanded = true;
    atomController.setExpand();
    update(["PageState"]);
  }

  void shrinkPage() {
    expanded = false;
    atomController.setShrink();
    update(["PageState"]);
  }

  void changeIndexPage(int index) {
    currentPageIndex = index;
    update(["pageIndex"]);
  }
}
