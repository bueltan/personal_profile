enum ItemAtom {
  programming, electronic, sysadmin, softskills, fullstack, none
}

extension ItemAtomExtension on ItemAtom{
  String get keyName {
    switch (this) {
    
   
      case ItemAtom.programming:
        return "programming";
      case ItemAtom.electronic:
        return "electronic";
      case ItemAtom.sysadmin:
        return "sysadmin";
      case ItemAtom.softskills:
        return "soft_skills";
      case ItemAtom.fullstack:
        return "full_stack_developer";
      case ItemAtom.none:
        return "";
    }
  }
    String get resource {
    switch (this) {
    
   
      case ItemAtom.programming:
        return "/assets/icons/programming_icon.svg";
      case ItemAtom.electronic:
        return "/assets/icons/electronics_icon.svg";
      case ItemAtom.sysadmin:
        return "/assets/icons/sysadmin_icon.svg";
      case ItemAtom.softskills:
        return "/assets/icons/soft_skills_icon.svg";
      case ItemAtom.fullstack:
        return "/assets/icons/sysadmin_icon.svg";
      case ItemAtom.none:
        return "";
    }
  }
}