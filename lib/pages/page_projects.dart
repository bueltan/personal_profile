import 'package:carousel_slider/carousel_slider.dart';
import 'package:denis_profile/components/timeline.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/controllers/projects_controller.dart';
import 'package:denis_profile/models/timeline_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class PageProjects extends StatefulWidget {
  const PageProjects({
    super.key,
  });

  @override
  State<PageProjects> createState() => _PageProjectsState();
}

class _PageProjectsState extends State<PageProjects>
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
                        "assets/images/background_space_cupola.jpg"),
                    fit: BoxFit.cover,
                    opacity: (controller.expanded) ? 8 : 0.5,
                  ),
                ),
              ),
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: (controller.expanded)
                      ? Colors.deepPurple.withOpacity(0.4)
                      : Colors.transparent,
                ),
                duration: const Duration(milliseconds: 1500),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: (controller.expanded) ? 0 : 325,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16))),
                  padding: const EdgeInsets.all(25),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '_projects'.tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 35,
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
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25, bottom: 25),
                              child: CaruselProjects(carouselController: carouselController),
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

class CaruselProjects extends StatelessWidget {
  const CaruselProjects({
    super.key,
    required this.carouselController,
  });

  final CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CaruselProjectsControl>(
      id:"CaruselProjectsControl",
      builder: (controller) {
        return CarouselSlider(
            carouselController: carouselController,
            items: [
              GestureDetector(
                  onTap: () {
                    carouselController.animateToPage(0);
                  
                  },
                  child: Image.asset("images/1.png")),
              GestureDetector(
                  onTap: () {
                    carouselController.animateToPage(1);
                    
                  },
                  child: Image.asset("images/2.png")),
              GestureDetector(
                  onTap: () {
                    carouselController.animateToPage(2);
                   
                  },
                  child: Image.asset("images/3.png")),
              GestureDetector(
                
                  onTap: () {
                    carouselController.animateToPage(3);
                     
                  },
                  child: Image.asset("images/4.png"))
            ],
            options: CarouselOptions(
              height: 300,
              aspectRatio: 16 / 9,
              viewportFraction: 0.4,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: controller.autoPlay,
              autoPlayInterval:
                  const Duration(seconds: 2),
              autoPlayAnimationDuration:
                  const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.4,
              onPageChanged: (a, f) {},
              scrollDirection: Axis.horizontal,
            ));
      }
    );
  }
}


