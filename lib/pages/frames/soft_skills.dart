import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SoftSkillsFrame extends StatefulWidget {
  const SoftSkillsFrame({
    super.key,
  });

  @override
  State<SoftSkillsFrame> createState() => _SoftSkillsFrameState();
}

class _SoftSkillsFrameState extends State<SoftSkillsFrame> 
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
      child:  RawScrollbar(
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
                padding: const EdgeInsets.only(left:25.0, right: 25),
                  child: Text(
                    'soft_skills'.tr,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: "UbuntuMono",
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                        "/assets/images/soft_skills.svg",
                        // ignore: deprecated_member_use
                        color: Colors.greenAccent.withOpacity(0.5),
                      ),
                ),
        
                Padding(
                  padding: const EdgeInsets.only(left:25, right: 25,bottom: 25, top: 40),
                  child: Text("soft_skills_text".tr, style: const TextStyle(
                                fontSize: 19,
                                leadingDistribution:
                                    TextLeadingDistribution.proportional,
                                color: Colors.white,
                                fontFamily: "UbuntuMono",
                                ),),
                ),
      
            ],
          ),
        ),
      ),
    );
  }
}

