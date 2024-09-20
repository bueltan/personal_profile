import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:denis_profile/components/atom_panel.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/models/item_atom.dart';
import 'package:denis_profile/pages/frames/electronic.dart';
import 'package:denis_profile/pages/frames/full_stack_developer.dart';
import 'package:denis_profile/pages/frames/programming.dart';
import 'package:denis_profile/pages/frames/soft_skills.dart';
import 'package:denis_profile/pages/frames/sysadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageKnowledge extends StatefulWidget {
  const PageKnowledge({
    super.key,
  });

  @override
  State<PageKnowledge> createState() => _PageKnowledgeState();
}

class _PageKnowledgeState extends State<PageKnowledge>
    with TickerProviderStateMixin {
  late Animation<double> animationBtn;
  late AnimationController animationControllerBtn;
  late Animation<double> animationText;
  late AnimationController animationControllerText;
  bool btnHover = false;
  bool isDisposed = false;
  @override
  void initState() {
    super.initState();
    isDisposed = false;
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
                        "/images/background_apollo_control.webp"),
                    fit: BoxFit.cover,
                    opacity: (controller.expanded) ? 0.7 : 0.5,
                  ),
                ),
              ),
              GetBuilder<AtomController>(
                  id: "AtomController",
                  builder: (controllerAtom) {
                    return CircularPanel(
                        contentWidget: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(top:25, bottom: 25),
                              child: ContentSwich(
                                                  atomController: controllerAtom,
                                                ),
                            )));
                  }),
              GetBuilder<AtomController>(
                  id: "AtomController",
                  builder: (atomController) {
                    return Positioned.fill(
                      top: 25,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: (controller.expanded) ? 0 : 350),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 1000),
                            opacity: (atomController.currentItemAtom ==
                                    ItemAtom.none)
                                ? 1
                                : 0,
                            child: Text(
                              '_knowledge'.tr,
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
                      ),
                    );
                  }),
            ],
          );
        });
  }
}

class ContentSwich extends StatelessWidget {
  final AtomController atomController;

  const ContentSwich({
    super.key,
    required this.atomController,
  });

  @override
  Widget build(BuildContext context) {
    return switch (atomController.currentItemAtom) {
      ItemAtom.programming => const ProgrammingFrame(),
      ItemAtom.electronic => const ElectronicFrame(),
      ItemAtom.sysadmin => const SysAdminFrame(),
      ItemAtom.softskills => const SoftSkillsFrame(),
      ItemAtom.fullstack => const FullStackDeveloperFrame(),
      ItemAtom.none => const SizedBox(),
    };
  }
}
