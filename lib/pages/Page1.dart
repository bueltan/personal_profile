import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:denis_profile/controllers/PagesState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageStateController>(
        id: "PageState",
        builder: (controller) {
          return Stack(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 1500),
                opacity: (controller.expanded) ? 1 : 0.7,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/about_me_background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Content(
                controller: controller,
              )
            ],
          );
        });
  }
}

class Content extends StatefulWidget {
  final PageStateController controller;
  const Content({
    super.key,
    required this.controller,
  });

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> with TickerProviderStateMixin {
  late Animation<double> animationImage;
  late AnimationController animationControllerImage;
  late Animation<double> animationTitleAboutMe;
  late AnimationController animationControllerText;

  bool isDisposed = false;
  @override
  void initState() {
    super.initState();
    isDisposed = false;

    animationControllerText = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    animationControllerImage = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    animationImage =
        CurvedAnimation(parent: animationControllerImage, curve: Curves.easeIn);

    animationTitleAboutMe =
        CurvedAnimation(parent: animationControllerText, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    animationControllerImage.dispose();
    animationControllerText.dispose();
    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationControllerText.forward();
    animationControllerImage.forward();

    return LayoutBuilder(builder: (context, constrains) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: (widget.controller.expanded)
                    ? constrains.maxWidth
                    : constrains.maxWidth - 365,
                child: TitleAboutMe(
                    animationTitleAboutMe: animationTitleAboutMe,
                    widget: widget)),
            SizedBox(
              width: (widget.controller.expanded)
                  ? constrains.maxWidth
                  : constrains.maxWidth - 365,
              child: Wrap(
                children: [
                  ImageAboutMe(
                      animationControllerImage: animationControllerImage,
                      widget: widget),
                  PersonalInfo(controller: widget.controller)
                ],
              ),
            ),
            SizedBox(
                width: (widget.controller.expanded)
                    ? constrains.maxWidth
                    : constrains.maxWidth - 365,
                child: const TextAboutMe()),
          ],
        ),
      );
    });
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
    required this.controller,
  });
  final PageStateController controller;
  @override
  Widget build(BuildContext context) {
    List<String> listBeforeInfoItems = [
      "_age".tr,
      "_profession".tr,
      "_nationality".tr,
      "_current_residence".tr
    ];

    List<String> listInfoItems = [
      "age".tr,
      "profession".tr,
      "nationality".tr,
      "current_residence".tr
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0, right: 25),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 650),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listInfoItems.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 2500),
              child: SlideAnimation(
                horizontalOffset: 250.0,
                child: FadeInAnimation(
                  child: ItemPersonalInfo(
                    beforeText: listBeforeInfoItems[index],
                    text: listInfoItems[index],
                    controller: controller,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemPersonalInfo extends StatelessWidget {
  final String text;
  final String beforeText;
  final PageStateController controller;

  const ItemPersonalInfo({
    super.key,
    required this.text,
    required this.beforeText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 25),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
            color: (controller.expanded)
                ? Colors.black.withOpacity(0.7)
                : Colors.black.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text(
                  beforeText,
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 19,
                    fontFamily: "NeueMetana",
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontFamily: "NeueMetana",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextAboutMe extends StatelessWidget {
  const TextAboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 25, bottom: 25, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerTextAboutMe(),
        ],
      ),
    );
  }
}

class ImageAboutMe extends StatelessWidget {
  const ImageAboutMe({
    super.key,
    required this.animationControllerImage,
    required this.widget,
  });

  final AnimationController animationControllerImage;
  final Content widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25, bottom: 25),
      child: FadeTransition(
        opacity: animationControllerImage,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 450, maxHeight: 235),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(width: 10, color: Colors.white.withOpacity(0.8)),
            image: DecorationImage(
              image: const AssetImage("images/denis_profile.png"),
              fit: BoxFit.cover,
              opacity: (widget.controller.expanded) ? 1 : 0.9,
            ),
          ),
        ),
      ),
    );
  }
}

class TitleAboutMe extends StatelessWidget {
  const TitleAboutMe({
    super.key,
    required this.animationTitleAboutMe,
    required this.widget,
  });

  final Animation<double> animationTitleAboutMe;
  final Content widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 25.0, bottom: 100, left: 25, right: 25),
        child: FadeTransition(
          opacity: animationTitleAboutMe,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1500),
            width: 900,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
                color: (widget.controller.expanded)
                    ? Colors.black.withOpacity(0.8)
                    : Colors.black.withOpacity(0.6),
                    
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    'about'.tr,
                    style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 35,
                        fontFamily: "NeueMetana",
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'about_me_title'.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: "NeueMetana",
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerTextAboutMe extends StatefulWidget {
  const ContainerTextAboutMe({
    super.key,
  });

  @override
  State<ContainerTextAboutMe> createState() => _ContainerTextAboutMeState();
}

class _ContainerTextAboutMeState extends State<ContainerTextAboutMe>
    with TickerProviderStateMixin {
  late Animation<double> animationBtn;
  late AnimationController animationControllerBtn;
  bool showEmptyWidget = true;
  bool btnHover = false;
  bool isDisposed = false;

  @override
  void initState() {
    super.initState();
    isDisposed = false;
    animationControllerBtn = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    animationBtn =
        CurvedAnimation(parent: animationControllerBtn, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
    animationControllerBtn.dispose();
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

  final PageStateController pageState = Get.find<PageStateController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          color: Colors.black.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      padding: const EdgeInsets.all(25),
      // constraints: const BoxConstraints(maxWidth: 1400),
      child: Column(
        children: [
          Stack(
            children: [
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      "denis@debian: ",
                      style: TextStyle(
                          overflow: TextOverflow.visible,
                          fontSize: 19,
                          leadingDistribution:
                              TextLeadingDistribution.proportional,
                          color: Colors.greenAccent,
                          fontFamily: "NeueMetana",
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.start,
                      
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "               ~\$ ${"about_me".tr}",
                      textAlign: TextAlign.justify,
                      textStyle: const TextStyle(
                          fontSize: 19,
                          leadingDistribution:
                              TextLeadingDistribution.proportional,
                          color: Colors.white,
                          fontFamily: "NeueMetana",
                          fontWeight: FontWeight.w700),
                      curve: Curves.decelerate,
                      speed: const Duration(milliseconds: 40),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 30),
                  displayFullTextOnTap: true,
                  onTap: () {
                    setState(() {
                      animationControllerBtn.forward();
                      showEmptyWidget = false;
                    });
                  },
                  onFinished: () {
                    setState(() {
                      animationControllerBtn.forward();
                      showEmptyWidget = false;
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Visibility(
              visible: showEmptyWidget,
              replacement: FadeTransition(
                opacity: animationBtn,
                child: MouseRegion(
                  onHover: (v) {
                    setState(() {
                      onHover();
                    });
                  },
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shadowColor:
                            MaterialStateProperty.all(Colors.greenAccent),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        minimumSize:
                            MaterialStateProperty.all(const Size(50, 50)),
                        elevation: (btnHover)
                            ? MaterialStateProperty.all(5)
                            : MaterialStateProperty.all(1)),
                    onPressed: () {
                      pageState.jumpToPage(nextIndex: 2);
                    },

                    child: const Text(
                      'Knowledge',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "NeueMetana",
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w700),
                    ), // <-- Text
                  ),
                ),
              ),
              child: const SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}
