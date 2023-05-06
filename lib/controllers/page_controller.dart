
import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:denis_profile/models/item_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageStateController extends GetxController  {
  bool expanded = false;
  final AtomController atomController = Get.find<AtomController>();
  
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  void jumpToPage({PageItem ? pageItem, Duration distanceTime = const Duration(milliseconds: 500), animate = true}){
    if (animate){
    pageController.animateToPage(pageItem?.indexPage??0, duration:  distanceTime, curve: Curves.ease);

    }else{
      pageController.jumpToPage(pageItem?.indexPage??0);
    }
  }
  void expandPage(){
      expanded = true;
      atomController.setExpand();
      update(["PageState"]);
  }
  void shrinkPage(){
      expanded = false;
      atomController.setShrink();
      update(["PageState"]);
  }
  void changeIndexPage(int index){
    currentPageIndex = index;
    update(["pageIndex"]);
  }


}