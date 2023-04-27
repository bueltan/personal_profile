import 'package:denis_profile/controllers/PagesState.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page0 extends StatefulWidget {
  const Page0({
    super.key,
  });

  @override
  State<Page0> createState() => _Page0State();
}

class _Page0State extends State<Page0> with TickerProviderStateMixin {
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
          return LayoutBuilder(builder: (context, constrains) {
            return Stack(
              children: [
                Builder(builder: (context) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: (controller.expanded) ? 1 : 0.7,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/background_denis_profile.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  width: (controller.expanded)
                      ? constrains.maxWidth
                      : constrains.maxWidth - 365,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity: animationText,
                          child: Center(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 1500),
                              decoration: BoxDecoration(
                                  color: (controller.expanded)
                                      ? Colors.black.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16))),
                              padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16, bottom: 10),
                              child: Text(
                                'DENIS GERMÁN GIMENEZ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    shadows: (btnHover)
                                        ? [
                                            const Shadow(
                                              blurRadius: 3.0,
                                              color: Colors.white,
                                              offset: Offset(0, 0),
                                            ),
                                          ]
                                        : null,
                                    fontFamily: "NeueMetana",
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FadeTransition(
                            opacity: animationBtn,
                            child: MouseRegion(
                              onHover: (v) {
                                setState(() {
                                  onHover();
                                });
                              },
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shadowColor: MaterialStateProperty.all(
                                        Colors.greenAccent),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(50, 50)),
                                    elevation: (btnHover)
                                        ? MaterialStateProperty.all(5)
                                        : MaterialStateProperty.all(1)),
                                onPressed: () {
                                  controller.jumpToPage(nextIndex: 1);
                                },

                                child: const Text(
                                  'About Me',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: "NeueMetana",
                                      color: Colors.greenAccent,
                                      fontWeight: FontWeight.w700),
                                ), // <-- Text
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
        });
  }
}
