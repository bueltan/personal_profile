
 

import 'package:denis_profile/components/AtomController.dart';
import 'package:denis_profile/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/AppDrawer.dart';
import 'components/translation.dart';
import 'controllers/PagesState.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AtomController());
    Get.put(PageStateController());

    return GetMaterialApp(
      translations: Dictionary(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('es', 'AR'),
      title: 'Denis Germán Giménez',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const AppDrawer(
        child: Home(),
      ),
      
    );
  }
}