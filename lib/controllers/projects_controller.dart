import 'package:denis_profile/models/item_projects.dart';
import 'package:get/get.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;


class CaruselProjectsControl extends GetxController {
  bool autoPlay = true;
  ProjectItem currentProjectItem = ProjectItem.cncCad;

  changeCurrentItem(int index){
    currentProjectItem = ProjectItem.values.firstWhere((element) => element.index == index);
    update(["CaruselProjectsControlIndexChange"]);

  }   
  setAutoPlayOff(){
    autoPlay = false;
    update(["CaruselProjectsControl"]);
  }

  setAutoPlayOn(){
    autoPlay = true;
    update(["CaruselProjectsControl"]);
  }
   openUrl(String textWithUrl) {
    String? url;
    if (textWithUrl.contains("http") ) {
      url = textWithUrl.replaceAll(' ', '');
    }
    if (url != null) {
      html.window.open(url, "_blank");
    }
  }
}
