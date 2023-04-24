import 'package:denis_profile/components/AppDrawer.dart';
import 'package:denis_profile/controllers/PagesState.dart';
import 'package:denis_profile/pages/Page1.dart';
import 'package:denis_profile/pages/page0.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageState>(
        id: "PageState",
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                onPressed: () {
                  AppDrawer.of(context).toggle();
                },
                backgroundColor: Colors.black.withOpacity(0.4),
                child: Icon(
                  (controller.expanded) ? Icons.menu : Icons.aspect_ratio,
                  size: 35,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            body: PageView(
              onPageChanged: (index){
                controller.changeIndexPage(index);
              } ,
              pageSnapping: true ,
                scrollDirection: Axis.vertical,
                controller: controller.pageController,
                children: const [Page0(), Page1()]),
                
          );
        });
  }
}

