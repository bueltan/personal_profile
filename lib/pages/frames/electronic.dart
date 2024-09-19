import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ElectronicFrame extends StatefulWidget {
  const ElectronicFrame({
    super.key,
  });

  @override
  State<ElectronicFrame> createState() => _ElectronicFrameState();
}

class _ElectronicFrameState extends State<ElectronicFrame>
    with TickerProviderStateMixin {
  late Animation<double> animationFrame;
  late AnimationController animationCrltFrame;
  late Animation<double> animationImages;
  late AnimationController animationCrltImages;
  late ScrollController scrollController;
  bool visibleCarusel = false;
  @override
  void initState() {
    super.initState();
    animationCrltFrame = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    scrollController = ScrollController();
    animationFrame =
        CurvedAnimation(parent: animationCrltFrame, curve: Curves.easeIn);

    animationCrltImages = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animationImages =
        CurvedAnimation(parent: animationCrltImages, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    super.dispose();
    animationCrltFrame.dispose();
    animationCrltImages.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationCrltFrame.forward();
    return FadeTransition(
      opacity: animationFrame,
      child: RawScrollbar(
        controller: scrollController,
        mainAxisMargin: 30,
        crossAxisMargin: 10,
        radius: const Radius.circular(4),
        thumbColor: Colors.deepPurpleAccent.withOpacity(0.5),
        thumbVisibility: true,
        child:  SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:25.0, right: 25),
              child: Text(
                'electronic'.tr,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: "UbuntuMono",
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
              Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                            "/images/electronics.svg",
                            // ignore: deprecated_member_use
                            color: Colors.greenAccent.withOpacity(0.5),
                            width: 150,
                          ),
                    ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 40),
              child: Align(
                alignment: Alignment.topLeft,
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "electronic_text".tr,
                      textAlign: TextAlign.start,
                      textStyle: const TextStyle(
                        fontSize: 19,
                        leadingDistribution: TextLeadingDistribution.proportional,
                        color: Colors.white,
                        fontFamily: "UbuntuMono",
                      ),
                      curve: Curves.easeIn,
                      speed: const Duration(milliseconds: 5),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 10),
                  displayFullTextOnTap: true,
                  onTap: () {
                    setState(() {
                      visibleCarusel = true;
                      animationCrltImages.forward();
                    });
                  },
                  onFinished: () {
                    setState(() {
                      visibleCarusel = true;
                      animationCrltImages.forward();
                    });
                  },
                ),
              ),
            ),
            Visibility(
              visible: visibleCarusel,
              child: FadeTransition(
                opacity: animationImages,
                child: Padding(
                  padding: const EdgeInsets.only(left:25.0, right: 25,bottom: 25),
                  child: CarouselSlider(
                      items: [
                        Image.asset("images/1.png"),
                        Image.asset("images/2.png"),
                        Image.asset("images/3.png"),
                        Image.asset("images/4.png")
                      ],
                      options: CarouselOptions(
                        height: 150,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (a, f) {},
                        scrollDirection: Axis.horizontal,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),)
    );
  }
}
