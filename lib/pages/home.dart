import 'package:denis_profile/components/app_drawer.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/pages/page_about_me.dart';
import 'package:denis_profile/pages/page_contact.dart';
import 'package:denis_profile/pages/page_experience.dart';
import 'package:denis_profile/pages/page_knowledge.dart';
import 'package:denis_profile/pages/page_projects.dart';
import 'package:denis_profile/pages/page_welcome.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3)),
              onPressed: () => AppDrawer.of(context).toggle(),
              backgroundColor: Colors.black.withOpacity(0.7),
              child: Icon(
                controller.expanded ? Icons.menu : Icons.aspect_ratio,
                size: 35,
                color: Colors.greenAccent,
              ),
            ),
          ),
          body: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: controller.expanded ? Radius.zero : const Radius.circular(16),
              bottomLeft: controller.expanded ? Radius.zero : const Radius.circular(16),
            ),
            child: RepaintBoundary(   // ← Forzar repaint
              child: Stack(
                children: [
                  // ==================== PageView ====================
                  PageView(
                    onPageChanged: (index) => controller.changeIndexPage(index),
                    allowImplicitScrolling: false,
                    pageSnapping: true,
                    scrollDirection: Axis.vertical,
                    controller: controller.pageController,
                    children: [
                      (hidePage) ? const SizedBox() : const PageWelcome(),
                      (hidePage) ? const SizedBox() : const PageAboutMe(),
                      (hidePage) ? const SizedBox() : const PageKnowledge(),
                      (hidePage) ? const SizedBox() : const PageExperience(),
                      (hidePage) ? const SizedBox() : const PageProjects(),
                      (hidePage) ? const SizedBox() : const PageContact(),
                    ],
                  ),

                  // ==================== TÍTULO (versión ultra segura) ====================
                  GetBuilder<PageStateController>(
                    id: "pageIndex",
                    builder: (pageIndexController) {
                      final bool shouldShowTitle =
                          pageIndexController.currentPageIndex == 0 && controller.expanded;
                      return Offstage(
                        offstage: !shouldShowTitle,
                        child: RepaintBoundary(
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 250),
                            opacity: shouldShowTitle ? 1.0 : 0.0,
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 60),
                                child: Text(
                                  'Denis Germán Gimenez',
                                  style: TextStyle(
                                    color: Colors.white,
                                    shadows: [Shadow(color: Colors.black, blurRadius: 5)],
                                    fontSize: 40,
                                    fontFamily: "NeueMetana",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}