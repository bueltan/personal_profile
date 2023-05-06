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
        return "assets/images/about_me.svg";
      case PageItem.knowledge:
        return "assets/images/knowledge.svg";
      case PageItem.experience:
        return "assets/images/experience.svg";
      case PageItem.projects:
        return "assets/images/projects.svg";
      case PageItem.contact:
        return "assets/images/contact.svg";
    }
  }
} 