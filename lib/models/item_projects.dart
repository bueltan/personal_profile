enum ProjectItem {
  cncCad, quickCamerea, nordesteApi, guazuApp, myResume
}

extension ProjectItemExtension on ProjectItem{
  String get title {
    switch (this) {
    
      case ProjectItem.cncCad:
        return "cnc_cad_title";
      case ProjectItem.quickCamerea:
        return "quick_camerea_title";
      case ProjectItem.nordesteApi:
        return "nordeste_api_title";
      case ProjectItem.guazuApp:
        return "guazuApp_title";
      case ProjectItem.myResume:
        return "myResume_title";
    }
  }
  String get subtitle {
    switch (this) {
    
      case ProjectItem.cncCad:
        return "cnc_cad_subtitle";
      case ProjectItem.quickCamerea:
        return "quick_camerea_subtitle";
      case ProjectItem.nordesteApi:
        return "nordeste_api_subtitle";
      case ProjectItem.guazuApp:
        return "guazuApp_subtitle";
      case ProjectItem.myResume:
        return "myResume_subtitle";
    }
  }
  String get text {
    switch (this) {
    
      case ProjectItem.cncCad:
        return "cnc_cad_text";
      case ProjectItem.quickCamerea:
        return "quick_camerea_text";
      case ProjectItem.nordesteApi:
        return "nordeste_api_text";
      case ProjectItem.guazuApp:
        return "guazuApp_text";
      case ProjectItem.myResume:
        return "myResume_text";
    }
  }
  String get imageAssets {
    switch (this) {
    
      case ProjectItem.cncCad:
        return "assets/images/cncad.jpeg";
      case ProjectItem.quickCamerea:
        return "assets/images/quick_camera.jpg";
      case ProjectItem.nordesteApi:
        return "assets/images/nordeste_api_white.jpg";
      case ProjectItem.guazuApp:
        return "assets/images/guazuapp.jpg";
      case ProjectItem.myResume:
        return "assets/images/my_resume.jpg";
    }
  }
    Map<String,String> get link1 {
    switch (this) {
      case ProjectItem.cncCad:
        return {"cnc_cad_name_link1":"https://cnc-project-study.github.io/"};
      case ProjectItem.quickCamerea:
        return {"quick_camerea_name_link1":"https://github.com/bueltan/camera-switch-quick-access"};
      case ProjectItem.nordesteApi:
        return {"nordeste_api_name_link1":"https://github.com/bueltan/nordeste-server-api-graphql"};
      case ProjectItem.guazuApp:
        return {"guazuApp_name_link1":"https://app.guazuapp.com"};
      case ProjectItem.myResume:
        return {"myResume_name_link1":"https://github.com/bueltan/personal_profile/tree/master"};
    }
  }
     Map<String,String> get link2 {
    switch (this) {
      case ProjectItem.cncCad:
        return {"cnc_cad_name_link2":"https://github.com/bueltan/cnc-cad-study-project/tree/main"};
      case ProjectItem.quickCamerea:
        return {"quick_camerea_name_link2":"quick_camerea_link2"};
      case ProjectItem.nordesteApi:
        return {"nordeste_api_name_link2":"nordeste_api_link2"};
      case ProjectItem.guazuApp:
        return {"guazuApp_name_link2":"https://play.google.com/store/apps/details?id=ar.guazuapp.guazuapp"};
      case ProjectItem.myResume:
        return {"myResume_name_link2":"myResume_link2"};
    }
  }

}