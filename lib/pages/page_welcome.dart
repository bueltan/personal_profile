import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:denis_profile/components/atom_panel.dart';
import 'package:denis_profile/constants/style_theme.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/models/item_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import "package:url_launcher/url_launcher.dart";

Future<void> openLink(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception("Could not launch $url");
  }
}

class PageWelcome extends StatefulWidget {
  const PageWelcome({
    super.key,
  });

  @override
  State<PageWelcome> createState() => _PageWelcomeState();
}

class _PageWelcomeState extends State<PageWelcome>
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

    animationControllerText = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    animationText =
        CurvedAnimation(parent: animationControllerText, curve: Curves.easeIn);
  }

  @override
  void dispose() {
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
    animationControllerText.forward();

    return GetBuilder<PageStateController>(
        id: "PageState",
        builder: (controller) {
          return LayoutBuilder(builder: (context, constrains) {
            double screenWidth = MediaQuery.of(context).size.width;
            final toVerticalPosition = (kIsWeb &&
                    (defaultTargetPlatform == TargetPlatform.iOS ||
                        defaultTargetPlatform == TargetPlatform.android)) ||
                screenWidth < 1000;

            return Stack(
              children: [
                SizedBox(
                  width: (controller.expanded)
                      ? constrains.maxWidth
                      : constrains.maxWidth - 365,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, top: 200),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 25.0, bottom: (toVerticalPosition) ? 25 : 0),
                        child: ListItems(
                          isVertical: toVerticalPosition,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  child: SizedBox(
                    width: (controller.expanded)
                        ? constrains.maxWidth
                        : constrains.maxWidth - 365,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 800),
                        opacity: (controller.expanded) ? 1 : 0,
                        child: Column(
                          children: [
                            Text(
                              'Denis Germán Gimenez'.tr,
                              style: const TextStyle(
                                color: Colors.white,
                                shadows: [
                                  Shadow(color: Colors.black, blurRadius: 5)
                                ],
                                fontSize: 40,
                                fontFamily: "UbuntuMono",
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: AnimatedTextKit(
                                isRepeatingAnimation: false,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    "full_stack_developer".tr,
                                    textAlign: TextAlign.start,
                                    textStyle: const TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: "UbuntuMono",
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                    curve: Curves.decelerate,
                                    speed: const Duration(milliseconds: 180),
                                  ),
                                ],
                                totalRepeatCount: 1,
                                pause: const Duration(milliseconds: 190),
                                displayFullTextOnTap: false,
                                stopPauseOnTap: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: const PersonalFooter()),
                ),
              ],
            );
          });
        });
  }
}

class ListItems extends StatelessWidget {
  final bool isVertical;
  const ListItems({
    super.key,
    required this.isVertical,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (isVertical) ? double.infinity : 36,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        shrinkWrap: true,
        itemCount: PageItem.values.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 300),
            duration: const Duration(milliseconds: 2500),
            child: SlideAnimation(
                verticalOffset: 250.0,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: isVertical ? 0 : 20, top: isVertical? 20 : 0),
                  child: FadeInAnimation(
                    child: Item(
                      index: index,
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}

class Item extends StatefulWidget {
  final int index;
  const Item({
    super.key,
    required this.index,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool onHover = false;
  PageStateController pageStateController = Get.find<PageStateController>();
  bool isDisposed = false;

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  PageItem getItemPageWithIndex() {
    return PageItem.values.firstWhere((item) => item.index == widget.index);
  }

  void onHoverText() {
    setState(() {
      onHover = true;
    });
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      if (isDisposed) {
        return;
      }
      setState(() {
        onHover = false;
      });
    });
  }

  void goToPage() {
    PageItem pageItem = getItemPageWithIndex();
    int x = (pageItem.index > 0) ? pageItem.index : 1;
    pageStateController.jumpToPage(
        pageItem: pageItem, distanceTime: Duration(milliseconds: 800 * x));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goToPage();
      },
      child: MouseRegion(
        onHover: (_) => onHoverText(),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(6),

          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Colors.white),
              boxShadow: (pageStateController.expanded)
                  ? [
                      const BoxShadow(
                        blurRadius: 2.0,
                        color: Colors.white,
                        offset: Offset(0, 0),
                      ),
                    ]
                  : null,
              color: Colors.black),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            tween: (onHover)
                ? Tween<double>(begin: 19, end: 22)
                : Tween<double>(begin: 22, end: 19),
            builder: (_, size, __) => Text(getItemPageWithIndex().keyName.tr,
                strutStyle: StrutStyle(
                
                  fontSize: size,
                  height: 1.0,
                  forceStrutHeight: true,
                ),
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: false,
                  applyHeightToLastDescent: false,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  
                    fontSize: size,
                    color: (onHover)
                        ? PageStyle.hoverColor
                        : PageStyle.mainColor,
                    fontFamily: "UbuntuMono",
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final String url;

  const _FooterLink({
    required this.label,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openLink("https://github.com/bueltan"),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: PageStyle.accentColor,
        ),
      ),
    );
  }
}

class PersonalFooter extends StatelessWidget {
  const PersonalFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "© $year Denis Gimenez • Full Stack Software Developer • denisgimenez.com",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 16,
            children: [
              _FooterLink(
                label: "GitHub",
                url: "https://github.com/bueltan",
              ),
              _FooterLink(
                label: "Download CV",
                url: "/assets/Denis_Gimenez_CV.pdf",
              ),
              _FooterLink(
                label: "Email",
                url: "mailto:denis@denisgimenez.com",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
