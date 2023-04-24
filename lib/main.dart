
 

import 'package:denis_profile/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/AppDrawer.dart';
import 'controllers/PagesState.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(PageState());

    return MaterialApp(
      
      title: 'Denis Germán Giménez',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  AppDrawer(
        child: Home(),
        
      ),
      
    );
  }
}