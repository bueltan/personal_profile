import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:denis_profile/components/charts.dart';
import 'package:denis_profile/controllers/chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class FullStackDeveloperFrame extends StatefulWidget {
  const FullStackDeveloperFrame({
    super.key,
  });

  @override
  State<FullStackDeveloperFrame> createState() =>
      _FullStackDeveloperFrameState();
}

class _FullStackDeveloperFrameState extends State<FullStackDeveloperFrame>
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
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'full_stack_developer'.tr,
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
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: ChartFullStack.values.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 300),
                            duration: const Duration(milliseconds: 2500),
                            child: SlideAnimation(
                              horizontalOffset: 250.0,
                              child: FadeInAnimation(
                                  child: ItemToGraph(
                                option: ChartFullStack.values[index],
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 0, right: 25, top: 16),
                    child: RadarChartFullStack(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GetBuilder<ChartControl>(
                      id: "ChartFullStack",
                      builder: (controller) {
                        return switch (controller.currentChartFullStack) {
                          
                          null => TextAnimatedFrame(key:const Key("null"), text: "full_stack_text".tr),

                          ChartFullStack.frontend => Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'frontend'.tr,
                                    style: const TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 20,
                                        fontFamily: "UbuntuMono",
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TextAnimatedFrame( key:const Key("frontend"), text: "frontend_text".tr)
                              ],
                            ),
                          
                          ChartFullStack.backend => Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'backend'.tr,
                                  style: const TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 20,
                                      fontFamily: "UbuntuMono",
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextAnimatedFrame( key:const Key("backend"),text: "backend_text".tr)
                            ]),
                          ChartFullStack.deploymentManagement =>
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'deployment_management'.tr,
                                  style: const TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 20,
                                      fontFamily: "UbuntuMono",
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextAnimatedFrame(key: const Key("deployment"), text: "deployment_text".tr)
                            ]),
                        };
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextAnimatedFrame extends StatelessWidget {
  final String text;
  const TextAnimatedFrame({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          TypewriterAnimatedText(
            text,
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
        onTap: () {},
        onFinished: () {},
      ),
    );
  }
}

class ItemToGraph extends StatelessWidget {
  final ChartFullStack option;
  const ItemToGraph({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    ChartControl chartCtrl = Get.find<ChartControl>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 290,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.greenAccent.withOpacity(0.7),
                backgroundColor:
                    Colors.deepPurpleAccent.withOpacity(0.4), // Background Color
              ),
              onPressed: () {
                chartCtrl.setCurrentChartFullStack(option);
              },
              child: Text(
                option.keyName.tr,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "UbuntuMono",
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          GetBuilder<ChartControl>(
            id:"ChartFullStack",
            builder: (context) {
              return Visibility(
                visible: chartCtrl.currentChartFullStack != null && option == ChartFullStack.deploymentManagement,
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                  onPressed: () {
                    chartCtrl.setChartFullStack();
                  },
                  icon: const Icon(Icons.arrow_back_rounded, color: Colors.greenAccent,size: 25,),
                              ),
                ),);
            }
          )
        ],
      ),
    );
  }
}
