import 'package:denis_profile/components/timeline.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/models/item_experience.dart';
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
                    opacity: (controller.expanded) ? 0.4 : 0.5,
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
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
                  padding: const EdgeInsets.only(left:0, top: 25, bottom: 25),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom:25.0,),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            '_experience'.tr,
                            style: const TextStyle(
                                shadows:  [Shadow(color: Colors.black, blurRadius: 5)],

                                color: Colors.greenAccent,
                                fontSize: 40,
                                fontFamily: "UbuntuMono",
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
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
