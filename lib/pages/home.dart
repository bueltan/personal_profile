import 'package:denis_profile/components/app_drawer.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/pages/page_about_me.dart';
import 'package:denis_profile/pages/page_contact.dart';
import 'package:denis_profile/pages/page_experience.dart';
import 'package:denis_profile/pages/page_projects.dart';
import 'package:denis_profile/pages/page_welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page_knowledge.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageStateController>(
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
                backgroundColor: Colors.black.withOpacity(0.7),
                child: Icon(
                  (controller.expanded) ? Icons.menu : Icons.aspect_ratio,
                  size: 35,
                  color: Colors.greenAccent,
                ),
              ),
            ),
            body: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16)),
                child: PageView(
                    onPageChanged: (index) {
                      controller.changeIndexPage(index);
                    },
                    allowImplicitScrolling: false,
                    pageSnapping: true,
                    scrollDirection: Axis.vertical,
                    controller: controller.pageController,
                    children: const [
                      PageWelcome(),
                      PageAboutMe(),
                      PageKnowledge(),
                      PageExperience(),
                      PageProjects(),
                      PageContact()
                    ])),
          );
        });
  }
}
