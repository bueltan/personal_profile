import 'package:denis_profile/components/app_drawer.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/pages/page_about_me.dart';
import 'package:denis_profile/pages/page_contact.dart';
import 'package:denis_profile/pages/page_experience.dart';
import 'package:denis_profile/pages/page_projects.dart';
import 'package:denis_profile/pages/page_welcome.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import 'page_knowledge.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageStateController>(
        id: "PageState",
        builder: (controller) {
          double screenWidth = MediaQuery.of(context).size.width;
          bool isWebOnMobile = (kIsWeb &&
              (defaultTargetPlatform == TargetPlatform.iOS ||
                  defaultTargetPlatform == TargetPlatform.android));

          final bool hidePage =
              (isWebOnMobile || screenWidth < 600) && !controller.expanded;

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
                borderRadius: BorderRadius.only(
                    topLeft: (controller.expanded)
                        ? Radius.zero
                        : const Radius.circular(16),
                    bottomLeft: (controller.expanded)
                        ? Radius.zero
                        : const Radius.circular(16)),
                child: PageView(
                    onPageChanged: (index) {
                      controller.changeIndexPage(index);
                    },
                    allowImplicitScrolling: false,
                    pageSnapping: true,
                    scrollDirection: Axis.vertical,
                    controller: controller.pageController,
                    children: [
                      (hidePage)
                          ? Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "/images/background_welcome.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : const PageWelcome(),
                      (hidePage)
                          ? Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "/images/about_me_background.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : const PageAboutMe(),
                      (hidePage)
                          ? Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "/images/background_apollo_control.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : const PageKnowledge(),
                      (hidePage)
                          ? Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "/images/background_nasa_control.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : const PageExperience(),
                      (hidePage)
                          ? Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "/images/background_space_cupola.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : const PageProjects(),
                      (hidePage)
                          ? Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "/images/background_space_cupula_soyus.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : const PageContact()
                    ])),
          );
        });
  }
}
