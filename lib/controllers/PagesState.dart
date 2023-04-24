
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageState extends GetxController {
  bool expanded = false;
  List<String> listItemsText = ["About Me", "Knowledge" ,"Experience", "Projects", "Hobbies", "Contact"];
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  void jumpToPage({int nextIndex = 0}){
    pageController.animateToPage(nextIndex, duration:  const Duration(milliseconds: 500), curve: Curves.ease);
  }
  void expandPage(){
      expanded = true;
      update(["PageState"]);
  }
  void shrinkPage(){
      expanded = false;
      update(["PageState"]);
  }
  void changeIndexPage(int index){
    currentPageIndex = index;
    update(["pageIndex"]);
  }
}