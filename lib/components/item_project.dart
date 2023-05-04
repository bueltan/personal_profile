import 'package:carousel_slider/carousel_slider.dart';
import 'package:denis_profile/controllers/projects_controller.dart';
import 'package:denis_profile/models/item_projects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class WidgetItemProject extends StatefulWidget {
  const WidgetItemProject({
    super.key,
    required this.carouselController,
    required this.projectItem, 
    required this.scrollController,
  });

  final CarouselController carouselController;
  final ProjectItem projectItem;
  final ScrollController scrollController;

  @override
  State<WidgetItemProject> createState() => _WidgetItemProjectState();
}

class _WidgetItemProjectState extends State<WidgetItemProject> {
  late ScrollController scrollController;
  bool isDisposed = false;

  @override
  void initState() {
    super.initState();
    isDisposed = false;
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    isDisposed = true;
    scrollController.dispose();
   

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CaruselProjectsControl controller = Get.find<CaruselProjectsControl>();
    return GestureDetector(
        onTap: () {
          widget.carouselController.animateToPage(widget.projectItem.index);
          controller.setAutoPlayOff();
        },
        child: GetBuilder<CaruselProjectsControl>(
            id: "CaruselProjectsControlIndexChange",
            builder: (context) {
              return Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        border: Border.all(
                            color: Colors.deepPurpleAccent.withOpacity(0.5)),
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 75),
                        child: AnimatedOpacity(
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 500),
                          opacity: (controller.currentProjectItem !=
                                  widget.projectItem)
                              ? 0.2
                              : 1,
                          child: RawScrollbar(
                              controller: scrollController,
                              mainAxisMargin: 30,
                              crossAxisMargin: 10,
                              radius: const Radius.circular(4),
                              thumbColor:
                                  Colors.deepPurpleAccent.withOpacity(0.5),
                              thumbVisibility: (controller.currentProjectItem ==
                                  widget.projectItem),
                              child: SingleChildScrollView(
                                controller: scrollController,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 25),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 25),
                                        child: Text(
                                          widget.projectItem.title.tr,
                                          style: const TextStyle(
                                              color: Colors.greenAccent,
                                              fontSize: 25,
                                              fontFamily: "UbuntuMono",
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2),
                                                color: Colors.white),
                                            child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(18)),
                                                child: Image.asset(
                                                  widget
                                                      .projectItem.imageAssets,
                                                ))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 25, top: 25),
                                        child: Text(
                                          widget.projectItem.subtitle.tr,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                              fontFamily: "UbuntuMono",
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      ReadMoreText(
                                        
                                        widget.projectItem.text.tr,
                                        trimLines: 2,
                                        colorClickableText:
                                            Colors.greenAccent,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: ' Show more',
                                        trimExpandedText: ' Show less',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Colors.white.withOpacity(0.8),
                                          fontSize: 16,
                                          fontFamily: "UbuntuMono",
                                        ),
                                        moreStyle: const TextStyle(
                                          color: Colors.deepPurpleAccent,
                                          fontSize: 16,
                                          fontFamily: "UbuntuMono",
                                        ),
                                        lessStyle: const TextStyle(
                                          color: Colors.deepPurpleAccent,
                                          fontSize: 16,
                                          fontFamily: "UbuntuMono",
                                        ),
                                        
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      )),
                  if (controller.currentProjectItem ==
                                  widget.projectItem && widget.projectItem.link1.keys.first.tr != "")Positioned(
                    bottom: 25,
                    left: 25,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.greenAccent.withOpacity(0.7),
                              backgroundColor: Colors.deepPurpleAccent
                                  .withOpacity(0.4), // Background Color
                            ),
                            onPressed: () {
                            controller.openUrl(widget.projectItem.link1.values.first);

                            },
                            child: Text(
                              widget.projectItem.link1.keys.first.tr,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "UbuntuMono",
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        if (controller.currentProjectItem ==
                                  widget.projectItem && widget.projectItem.link2.keys.first.tr != "")Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.greenAccent.withOpacity(0.7),
                              backgroundColor: Colors.deepPurpleAccent
                                  .withOpacity(0.4), // Background Color
                            ),
                            onPressed: () {
                              controller.openUrl(widget.projectItem.link2.values.first);
                            },
                            child: Text(
                              widget.projectItem.link2.keys.first.tr,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "UbuntuMono",
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}