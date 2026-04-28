
import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:denis_profile/controllers/projects_controller.dart';
import 'package:denis_profile/models/item_page.dart';
import 'package:denis_profile/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/app_drawer.dart';
import 'controllers/chart_controller.dart';
import 'components/translation.dart';
import 'controllers/page_controller.dart';
import 'dart:js_interop';
 
@JS('getInitialPage')
external JSNumber? _getInitialPage();
 
int _readInitialPage() {
  if (!kIsWeb) return 0;
  try {
    final JSNumber? result = _getInitialPage();
    return result?.toDartInt ?? 0;
  } catch (_) {
    return 0;
  }
}
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    final atomCtrl    = Get.put(AtomController());
    final pageCtrl    = Get.put(PageStateController());
    Get.put(ChartControl());
    Get.put(CarouselProjectsControl());
 
    // Jump to the deep-linked page once the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final int targetPage = _readInitialPage();
      if (targetPage > 0) {
        pageCtrl.jumpToPage(
          pageItem: PageItem.values.firstWhere(
            (p) => p.indexPage == targetPage,
            orElse: () => PageItem.values.first,
          ),
          animate: false,
        );
      }
    });
 
    return Builder(builder: (context) {
      return GetMaterialApp(
        translations: Dictionary(),
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en', 'US'),
        title: 'Denis Germán Giménez',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AppDrawer(
          child: Home(),
        ),
      );
    });
  }
}
 
