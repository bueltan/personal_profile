import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AtomController extends GetxController  {
  bool expanded = false;
  final String textUpperCircle = "programming";
  final String textLowerCircle = "electronics";
  final String textLeftCircle =  "sysadmin";
  final String textRightCircle = "soft_skills";

  setExpand() => expanded = true;
  setShrink() => expanded = false;



}