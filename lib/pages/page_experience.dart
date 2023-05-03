import 'package:denis_profile/components/app_drawer.dart';
import 'package:denis_profile/components/timeline.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/controllers/timeline_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class PageExperience extends StatefulWidget {
  const PageExperience({
    super.key,
  });

  @override
  State<PageExperience> createState() => _PageExperienceState();
}

class _PageExperienceState extends State<PageExperience>
    with TickerProviderStateMixin {
  late Animation<double> animationBtn;
  late AnimationController animationControllerBtn;
  late Animation<double> animationText;
  late AnimationController animationControllerText;
  late ScrollController scrollController;
  bool btnHover = false;
  bool isDisposed = false;
  @override
  void initState() {
    super.initState();
    isDisposed = false;
    scrollController = ScrollController();
    animationControllerBtn = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    animationControllerText = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    animationBtn =
        CurvedAnimation(parent: animationControllerBtn, curve: Curves.easeIn);

    animationText =
        CurvedAnimation(parent: animationControllerText, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    animationControllerBtn.dispose();
    animationControllerText.dispose();
    scrollController.dispose();
    isDisposed = true;
    super.dispose();
  }

  void onHover() async {
    setState(() {
      btnHover = true;
    });
    Future.delayed(const Duration(milliseconds: 800)).then((value) {
      if (isDisposed == false) {
        setState(() {
          btnHover = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    animationControllerBtn.forward();
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
                        "assets/images/background_nasa_control.png"),
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
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
                  padding: const EdgeInsets.all(25),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '_experience'.tr,
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
                        child: RawScrollbar(
                          controller: scrollController,
                          mainAxisMargin: 30,
                          crossAxisMargin: 10,
                          radius: const Radius.circular(4),
                          thumbColor: Colors.deepPurpleAccent.withOpacity(0.5),
                          thumbVisibility: true,
                          child: ListView.builder(
                            controller: scrollController,
                            shrinkWrap: true,
                            itemCount: TimeLineItem.values.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                delay: const Duration(milliseconds: 200),
                                duration: const Duration(milliseconds: 2000),
                                child: SlideAnimation(
                                  verticalOffset: 500.0,
                                  child: FadeInAnimation(
                                    child: ItemTimeLineWork(
                                      timeLineItem: TimeLineItem.values
                                          .firstWhere(
                                              (item) => item.index == index),
                                      index: index,
                                    ),
                                  ),
                                ),
                              );
                            },
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
