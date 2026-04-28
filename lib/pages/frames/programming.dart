import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:denis_profile/components/charts.dart';
import 'package:denis_profile/controllers/chart_controller.dart';
import 'package:denis_profile/models/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class ProgrammingFrame extends StatefulWidget {
  const ProgrammingFrame({super.key});

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
    animationCrltFrame.dispose();
    scrollController.dispose();
    super.dispose();
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
        thumbColor: Colors.greenAccent.withOpacity(0.5),
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              // Título
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 20),
                child: Text(
                  'programming'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: "UbuntuMono",
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Contenido centrado
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 40,
                    runSpacing: 30,
                    children: [
                      // Lista de items (botones)
                      SizedBox(
                        width: 290,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
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
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // Gráfico Radar
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: RadarChartProgramming(),
                      ),
                    ],
                  ),
                ),
              ),

              // Texto descriptivo
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 40, bottom: 40),
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
                          fontWeight: FontWeight.w700,
                        ),
                        curve: Curves.easeIn,
                        speed: const Duration(milliseconds: 5),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 10),
                    displayFullTextOnTap: true,
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

// ====================== ItemToGraph (sin cambios) ======================
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
          foregroundColor: Colors.greenAccent,
          backgroundColor: Colors.black.withOpacity(0.8),
          minimumSize: const Size(double.infinity, 48),
        ),
        onPressed: () {
          chartCtrl.setCurrentChartProgOption(option);
        },
        child: Text(
          option.name.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            shadows: [Shadow(color: Colors.black, blurRadius: 5)],
            fontSize: 16,
            fontFamily: "UbuntuMono",
            color: Colors.greenAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
