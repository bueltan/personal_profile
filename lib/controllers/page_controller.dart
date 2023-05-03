
import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
enum PageItem {aboutMe, knowledge ,experience, projects, contact}

extension ExtensionPageItem on PageItem {

    String get keyName {
    switch (this) {
     
      case PageItem.aboutMe:
        return "_about_me";
      case PageItem.knowledge:
        return "_knowledge";
      case PageItem.experience:
       return "_experience";
      case PageItem.projects:
        return "_projects";
      case PageItem.contact:
       return "_contact";
    }
  }
   int get indexPage {
    switch (this) {
      case PageItem.aboutMe:
        return 1;
      case PageItem.knowledge:
        return 2;
      case PageItem.experience:
        return 3;
      case PageItem.projects:
        return 4;
      case PageItem.contact:
        return 5;
    }
  }
   String get getRouteAssest {
    switch (this) {
      case PageItem.aboutMe:
        return "images/about_me.svg";
      case PageItem.knowledge:
        return "images/knowledge.svg";
      case PageItem.experience:
        return "images/experience.svg";
      case PageItem.projects:
        return "images/projects.svg";
      case PageItem.contact:
        return "images/contact.svg";
    }
  }
} 
class PageStateController extends GetxController  {
  bool expanded = false;
  final AtomController atomController = Get.find<AtomController>();

  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  void jumpToPage({PageItem ? pageItem, Duration distanceTime = const Duration(milliseconds: 500)}){

    pageController.animateToPage(pageItem?.indexPage??0, duration:  distanceTime, curve: Curves.ease);
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