enum ProjectItem { 
  cncCad, quickCamerea, entityApi, guazuApp, myResume, foxy
}

extension ProjectItemExtension on ProjectItem{
  String get title {
    switch (this) {
    
      case ProjectItem.cncCad:
        return "cnc_cad_title";
      case ProjectItem.quickCamerea:
        return "quick_camerea_title";
      case ProjectItem.entityApi:
        return "entity_api_title";
      case ProjectItem.guazuApp:
        return "guazuApp_title";
      case ProjectItem.myResume:
        return "myResume_title";
      case ProjectItem.foxy:
        return "foxy_title";
    }
  }
  String get subtitle {
    switch (this) {
    
      case ProjectItem.cncCad:
        return "cnc_cad_subtitle";
      case ProjectItem.quickCamerea:
        return "quick_camerea_subtitle";
      case ProjectItem.entityApi:
        return "entity_api_subtitle";
      case ProjectItem.guazuApp:
        return "guazuApp_subtitle";
      case ProjectItem.myResume:
        return "myResume_subtitle";
      case ProjectItem.foxy:
        return "foxy_subtitle";
    }
  }
  String get text {
    switch (this) {
    
      case ProjectItem.cncCad:
        return "cnc_cad_text";
      case ProjectItem.quickCamerea:
        return "quick_camerea_text";
      case ProjectItem.entityApi:
        return "entity_api_text";
      case ProjectItem.guazuApp:
        return "guazuApp_text";
      case ProjectItem.myResume:
        return "myResume_text";
      case ProjectItem.foxy:
        return "foxy_text";
    }
  }
  String get imageAssets {
    switch (this) {
    
      case ProjectItem.cncCad:
        return "images/cncad.webp";
      case ProjectItem.quickCamerea:
        return "images/quick_camera.webp";
      case ProjectItem.entityApi:
        return "images/entity_api_white.webp";
      case ProjectItem.guazuApp:
        return "images/guazuapp.webp";
      case ProjectItem.myResume:
        return "images/my_resume.webp";
      case ProjectItem.foxy:
        return "images/foxy.webp";
    }
  }
    Map<String,String> get link1 {
    switch (this) {
      case ProjectItem.cncCad:
        return {"cnc_cad_name_link1":"https://cnc-project-study.github.io/"};
      case ProjectItem.quickCamerea:
        return {"quick_camerea_name_link1":"https://github.com/bueltan/camera-switch-quick-access"};
      case ProjectItem.entityApi:
        return {"entity_api_name_link1":"https://github.com/startup-entity-development/Entity.git"};
      case ProjectItem.guazuApp:
        return {"guazuApp_name_link1":"%DOWN  https://app.guazuapp.com"};
      case ProjectItem.myResume:
        return {"myResume_name_link1":"https://github.com/bueltan/personal_profile/tree/master"};
    case ProjectItem.foxy:
        return {"foxy_name_link1":"https://foxysoftware.github.io/"};
    
    }
  }
     Map<String,String> get link2 {
    switch (this) {
      case ProjectItem.cncCad:
        return {"cnc_cad_name_link2":"https://github.com/bueltan/cnc-cad-study-project/tree/main"};
      case ProjectItem.quickCamerea:
        return {"quick_camerea_name_link2":"quick_camerea_link2"};
      case ProjectItem.entityApi:
        return {"entity_api_name_link2":"entity_api_link2"};
      case ProjectItem.guazuApp:
        return {"guazuApp_name_link2":"%DOWN  https://play.google.com/store/apps/details?id=ar.guazuapp.guazuapp"};
      case ProjectItem.myResume:
        return {"myResume_name_link2":"myResume_link2"};
      case ProjectItem.foxy:
        return {"foxy_name_link2":"https://github.com/FoxySoftware/Foxy"};
    }
  }

}