import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:denis_profile/components/charts.dart';
import 'package:denis_profile/controllers/chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class ProgrammingFrame extends StatefulWidget {
   const ProgrammingFrame({
    super.key,
  });

  @override
  State<ProgrammingFrame> createState() => _ProgrammingFrameState();
}

class _ProgrammingFrameState extends State<ProgrammingFrame>
    with TickerProviderStateMixin {
  late Animation<double> animationFrame;
  late AnimationController animationCrltFrame;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    animationCrltFrame = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    scrollController = ScrollController();
    animationFrame =
        CurvedAnimation(parent: animationCrltFrame, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    super.dispose();
    animationCrltFrame.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ChartController chartCtrl = Get.find<ChartController>();
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
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'programming'.tr,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: "UbuntuMono",
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 290,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(left:17),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: ChartProgOptions.values.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 300),
                            duration: const Duration(milliseconds: 2500),
                            child: SlideAnimation(
                              horizontalOffset: 250.0,
                              child: FadeInAnimation(
                                  child: ItemToGraph(
                                option: ChartProgOptions.values[index],
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left:25,right: 25,top: 16),
                    child: RadarChartProgramming(),
                  ),
                ],
              ),
              Padding(
                    padding: const EdgeInsets.only(left:25,right: 25, bottom: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "programming_text".tr,
                        textAlign: TextAlign.start,
                        textStyle: const TextStyle(
                            fontSize: 19,
                            leadingDistribution:
                                TextLeadingDistribution.proportional,
                            color: Colors.white,
                            fontFamily: "UbuntuMono",
                            fontWeight: FontWeight.w700),
                        curve: Curves.easeIn,
                        speed: const Duration(milliseconds: 5),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 10),
                    displayFullTextOnTap: true,
                    onTap: () {},
                    onFinished: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemToGraph extends StatelessWidget {
  final ChartProgOptions option;
  const ItemToGraph({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    ChartControl chartCtrl = Get.find<ChartControl>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.greenAccent.withOpacity(0.7),
          backgroundColor:
              Colors.deepPurpleAccent.withOpacity(0.4), // Background Color
        ),
        onPressed: () {
          chartCtrl.setCurrentChartProgOption(option);
        },
        child: Text(
          option.name.tr,
          textAlign: TextAlign.start,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: "UbuntuMono",
              color: Colors.greenAccent,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
