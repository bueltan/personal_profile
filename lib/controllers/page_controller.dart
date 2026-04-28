import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:denis_profile/models/item_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:js_interop';

const Map<int, String> _indexToPath = {
  0: '/',
  1: '/about',
  2: '/knowledge',
  3: '/experience',
  4: '/projects',
  5: '/contact',
};

@JS('history.pushState')
external void _pushState(JSAny? data, String title, String url);

class PageStateController extends GetxController {
  bool expanded = true;

  final AtomController atomController = Get.find<AtomController>();

  final PageController pageController = PageController(initialPage: 0);

  int currentPageIndex = 0;

  @override
  void onInit() {
    super.onInit();
    if (kIsWeb) {
      pageController.addListener(_syncUrl);
    }
  }

  void _syncUrl() {
    final int page = pageController.page?.round() ?? 0;
    final String path = _indexToPath[page] ?? '/';
    try {
      _pushState(null, '', path);
    } catch (_) {}
  }

  void jumpToPage({
    PageItem? pageItem,
    Duration distanceTime = const Duration(milliseconds: 500),
    bool animate = true,
  }) {
    final int targetPage = pageItem?.indexPage ?? 0;

    if (animate) {
      pageController.animateToPage(
        targetPage,
        duration: distanceTime,
        curve: Curves.ease,
      );
    } else {
      pageController.jumpToPage(targetPage);
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

  @override
  void onClose() {
    pageController.removeListener(_syncUrl);
    pageController.dispose();
    super.onClose();
  }
}