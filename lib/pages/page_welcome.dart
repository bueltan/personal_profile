import 'package:denis_profile/components/atom_panel.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/models/item_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PageWelcome extends StatefulWidget {
  const PageWelcome({super.key});

  @override
  State<PageWelcome> createState() => _PageWelcomeState();
}

class _PageWelcomeState extends State<PageWelcome>
    with TickerProviderStateMixin {
  late final Animation<double> animationText;
  late final AnimationController animationControllerText;

  bool btnHover = false;

  @override
  void initState() {
    super.initState();

    animationControllerText = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    animationText = CurvedAnimation(
      parent: animationControllerText,
      curve: Curves.easeIn,
    );

    animationControllerText.forward();
  }

  @override
  void dispose() {
    animationControllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageStateController>(
      id: "pageIndex",
      builder: (pageIndexController) {
        return GetBuilder<PageStateController>(
          id: "PageState",
          builder: (controller) {
            return LayoutBuilder(
              builder: (context, constrains) {
                final double screenWidth = MediaQuery.of(context).size.width;

                final bool toVerticalPosition =
                    (kIsWeb &&
                            (defaultTargetPlatform == TargetPlatform.iOS ||
                                defaultTargetPlatform ==
                                    TargetPlatform.android)) ||
                        screenWidth < 1000;

                return Stack(
                  children: [
                    // Fondo sutil
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 1500),
                      opacity: controller.expanded ? 0.4 : 0.5,
                      child: Container(color: Colors.transparent),
                    ),

                    // Lista de círculos / Items
                    SizedBox(
                      width: controller.expanded
                          ? constrains.maxWidth
                          : constrains.maxWidth - 365,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 200),
                          child: SizedBox(
                            height: toVerticalPosition ? 600 : 200,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 25.0,
                                bottom: toVerticalPosition ? 25 : 0,
                              ),
                              child: ListItems(
                                isVertical: toVerticalPosition,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

// ====================== ListItems y ItemCicle ======================

class ListItems extends StatelessWidget {
  final bool isVertical;

  const ListItems({
    super.key,
    required this.isVertical,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
              padding: const EdgeInsets.only(left: 20.0),
              child: FadeInAnimation(
                child: ItemCicle(index: index),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ItemCicle extends StatefulWidget {
  final int index;

  const ItemCicle({
    super.key,
    required this.index,
  });

  @override
  State<ItemCicle> createState() => _ItemCicleState();
}

class _ItemCicleState extends State<ItemCicle> {
  bool onHover = false;

  final PageStateController pageStateController = Get.find<PageStateController>();

  PageItem getItemPageWithIndex() {
    return PageItem.values.firstWhere(
      (item) => item.index == widget.index,
    );
  }

  void onHoverText() {
    if (!mounted) return;
    setState(() => onHover = true);

    Future.delayed(const Duration(milliseconds: 500)).then((_) {
      if (!mounted) return;
      setState(() => onHover = false);
    });
  }

  void goToPage() {
    final PageItem pageItem = getItemPageWithIndex();
    final int x = pageItem.index > 0 ? pageItem.index : 1;

    pageStateController.jumpToPage(
      pageItem: pageItem,
      distanceTime: Duration(milliseconds: 800 * x),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Circle(
      onHoverChange: (state) {
        if (!mounted) return;
        setState(() => onHover = state);
      },
      widthContainer: 120,
      width: 80,
      colorBackGround: Colors.black.withOpacity(0.8),
      colorBorde: Colors.greenAccent,
      bordeWidth: 1,
      onTap: goToPage,
      widgetInCircle: SvgPicture.asset(
        getItemPageWithIndex().getRouteAssest,
        width: 45,
        color: Colors.white,
      ),
      widgetReplaceText: GestureDetector(
        onTap: goToPage,
        child: MouseRegion(
          onHover: (_) => !onHover ? onHoverText() : null,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Colors.greenAccent),
              boxShadow: pageStateController.expanded
                  ? [const BoxShadow(blurRadius: 5.0, color: Colors.green)]
                  : null,
              color: Colors.black,
            ),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 300),
              tween: onHover
                  ? Tween<double>(begin: 19, end: 22)
                  : Tween<double>(begin: 22, end: 19),
              builder: (_, size, __) => Text(
                getItemPageWithIndex().keyName.tr,
                style: TextStyle(
                  fontSize: size,
                  color: onHover ? Colors.greenAccent : Colors.white,
                  fontFamily: "UbuntuMono",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}