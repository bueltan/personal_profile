import 'package:denis_profile/models/item_projects.dart';
import 'package:get/get.dart';


class CaruselProjectsControl extends GetxController {
  bool autoPlay = true;

  setAutoPlayOff(){
    autoPlay = false;
    update(["CaruselProjectsControl"]);
  }

  setAutoPlayOn(){
    autoPlay = true;
    update(["CaruselProjectsControl"]);
  }
}
