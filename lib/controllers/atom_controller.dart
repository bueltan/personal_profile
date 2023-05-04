import 'package:denis_profile/models/item_atom.dart';
import 'package:get/get.dart';

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