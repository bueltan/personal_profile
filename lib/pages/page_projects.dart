import 'package:carousel_slider/carousel_slider.dart';
import 'package:denis_profile/components/item_project.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/controllers/projects_controller.dart';
import 'package:denis_profile/models/item_projects.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  late CarouselSliderController carouselController;
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
    carouselController = CarouselSliderController();
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
                        "/images/background_space_cupola.webp"),
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
                            '_projects'.tr,
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
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0.0, right: 0, bottom: 25),
                              child: ClProjects(
                                carouselController: carouselController,
                                scrollController: scrollController,
                              ),
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

class ClProjects extends StatelessWidget {
  const ClProjects({
    super.key,
    required this.carouselController,
    required this.scrollController,
  });

  final CarouselSliderController carouselController;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarouselProjectsControl>(
        id: "CaruselProjectsControl",
        builder: (controller) {
          return CarouselProjects(
            carouselController: carouselController,
            scrollController: scrollController,
          );
        });
  }
}

class CarouselProjects extends StatefulWidget {
  const CarouselProjects({
    super.key,
    required this.carouselController,
    required this.scrollController,
  });

  final CarouselSliderController carouselController;
  final ScrollController scrollController;

  @override
  State<CarouselProjects> createState() => _CarouselProjectsState();
}

class _CarouselProjectsState extends State<CarouselProjects> {
  CarouselProjectsControl controller = Get.find<CarouselProjectsControl>();
  final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

  @override
  void dispose() {
    super.dispose();
    controller.changeCurrentItem(0);
    controller.autoPlay = true;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      
      builder: (context, constraints) {
        double viewFract = 0.4;
        if (constraints.maxWidth < 700 || isWebMobile){
          viewFract = 1;
        }
        
        return CarouselSlider(
            carouselController: widget.carouselController,
            items: ProjectItem.values
                .map((e) => WidgetItemProject(
                      carouselController: widget.carouselController,
                      projectItem: e,
                      scrollController: widget.scrollController,
                    ))
                .toList(),
            options: CarouselOptions(
              height: 600,
              aspectRatio: 16 / 9,
              viewportFraction: viewFract,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: controller.autoPlay,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.4,
              onPageChanged: (a, f) {
                controller.changeCurrentItem(a);
              },
              scrollDirection: Axis.horizontal,
            ));
      }
    );
  }
}
