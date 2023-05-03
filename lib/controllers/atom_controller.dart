import 'package:get/get.dart';
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
}
class AtomController extends GetxController  {
  bool expanded = false;
  ItemAtom  currentItemAtom = ItemAtom.none ;

  setExpand() {
    expanded = true;
    update(["AtomController"]);

  } 
  setShrink(){
    expanded = false;
    update(["AtomController"]);

  } 

  setCurrentItemAtom(ItemAtom itemAtom){
    currentItemAtom = itemAtom;
    update(["AtomController"]);

  }


}