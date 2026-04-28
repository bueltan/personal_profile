import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:denis_profile/models/item_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageStateController extends GetxController {
  bool expanded = true;

  final AtomController atomController = Get.find<AtomController>();

  final PageController pageController = PageController(initialPage: 0);

  int currentPageIndex = 0;

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
    pageController.dispose();
    super.onClose();
  }
}