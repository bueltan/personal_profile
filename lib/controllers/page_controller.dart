import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:denis_profile/models/item_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'dart:io' show Platform;
// import 'send_message/sent_messages.dart';
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'send_message/client.dart';

class PageStateController extends GetxController {
  bool expanded = false;
  final AtomController atomController = Get.find<AtomController>();

  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  String? ipv4;
  String? hostname;

  @override
  void onInit() async {
    try {
      hostname = Platform.localHostname;
    } catch (e) {
      print(e);
    }
    try {
      ipv4 = await Ipify.ipv4();
    } catch (e) {
      print(e);
    }

    try {
      String message = "new visitor";
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      message = "$message ipv4: ${ipv4??""}, hostname: ${hostname??""}, date: $formattedDate" ; 
     sendGoogleFormLog(message);
    } catch (e) {
      print(e);
    }



    html.window.onBeforeUnload.listen((event) async{
    String message = event.toString();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    message = "$message ipv4: ${ipv4??""}, hostname: ${hostname??""}, date: $formattedDate" ; 
     sendGoogleFormLog(message);

    });
    super.onInit();
  }

  void jumpToPage(
      {PageItem? pageItem,
      Duration distanceTime = const Duration(milliseconds: 500),
      animate = true}) async {
    try {
      String message = "change page to ${pageItem?.keyName} ";
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
      message = "$message ipv4: ${ipv4??""}, hostname: ${hostname??""}, date: $formattedDate" ; 
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
