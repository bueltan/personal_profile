import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:denis_profile/controllers/projects_controller.dart';
import 'package:denis_profile/pages/home.dart';
import 'package:denis_profile/pages/page_projects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/app_drawer.dart';
import 'controllers/chart_controller.dart';
import 'components/translation.dart';
import 'controllers/page_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AtomController());
    Get.put(PageStateController());
    Get.put(ChartControl());
    Get.put(CaruselProjectsControl());

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

