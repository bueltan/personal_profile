import 'package:carousel_slider/carousel_slider.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageContact extends StatefulWidget {
  const PageContact({
    super.key,
  });

  @override
  State<PageContact> createState() => _PageContactState();
}

class _PageContactState extends State<PageContact>
    with TickerProviderStateMixin {
  late Animation<double> animationProjects;
  late AnimationController animationControllerProjects;
  late Animation<double> animationText;
  late AnimationController animationControllerText;
  late ScrollController scrollController;
  late CarouselController carouselController;
  bool isDisposed = false;
  @override
  void initState() {
    super.initState();
    isDisposed = false;
    scrollController = ScrollController();
    animationControllerProjects = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    animationControllerText = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    carouselController = CarouselController();
    animationProjects = CurvedAnimation(
        parent: animationControllerProjects, curve: Curves.easeIn);

    animationText =
        CurvedAnimation(parent: animationControllerText, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    animationControllerProjects.dispose();
    animationControllerText.dispose();
    scrollController.dispose();
    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationControllerProjects.forward();
    animationControllerText.forward();

    return GetBuilder<PageStateController>(
        id: "PageState",
        builder: (controller) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(
                        "assets/images/background_space_cupula_soyus.png"),
                    fit: BoxFit.cover,
                    opacity: (controller.expanded) ? 0.7 : 0.5,
                  ),
                ),
              ),
            
              Padding(
                padding: EdgeInsets.only(
                  right: (controller.expanded) ? 0 : 325,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16))),
                  padding: const EdgeInsets.all(25),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom:25.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '_contact'.tr,
                            style: const TextStyle(
                                shadows: [
                                  Shadow(color: Colors.black, blurRadius: 5)
                                ],
                                color: Colors.greenAccent,
                                fontSize: 40,
                                fontFamily: "UbuntuMono",
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70.0),
                        child: FadeTransition(
                          opacity: animationProjects,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25, bottom: 25),
                              child:Text("")
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}