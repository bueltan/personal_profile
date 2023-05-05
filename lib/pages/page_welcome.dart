import 'package:denis_profile/components/atom_panel.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/models/item_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
              final toVerticalPosition = (kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android))|| screenWidth<1000  ;

            return Stack(
              children: [
                Builder(builder: (context) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: (controller.expanded) ? 0.4 : 0.5,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/background_welcome.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
                // AnimatedContainer(
                //   decoration: BoxDecoration(
                //     color: (controller.expanded)
                //         ? Colors.black.withOpacity(0.5)
                //         : Colors.transparent,
                //   ),
                //   duration: const Duration(milliseconds: 1500),
                // ),
                SizedBox(
                  width: (controller.expanded)
                      ? constrains.maxWidth
                      : constrains.maxWidth - 365,
                  child:  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, top:200),
                      child: SizedBox(
                        height: toVerticalPosition?600:200,
                        child: Padding(
                          padding: const EdgeInsets.only(right:25.0),
                          child: ListItems(isVertical: toVerticalPosition,),
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
                        opacity:(controller.expanded)?1:0 ,
                        child: Text(
                                    'Denis Germán Gimenez'.tr,
                                    style: const TextStyle(
                          color: Colors.white,
                          shadows: [Shadow(color: Colors.black,blurRadius: 5)],
                          fontSize: 40,
                          fontFamily: "NeueMetana",
                          ),
                                    textAlign: TextAlign.center,
                                  ),
                      ),
                    ),
                  ),
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
    super.key, required this.isVertical,
  });

  // bool isVertical = false;
  @override
  Widget build(BuildContext context) {
    //  SchedulerBinding.instance.addPostFrameCallback((_) {
    //       if ((toVerticalPosition ) && isVertical == false){
    //         setState(() {
    //           isVertical = true;
    //         });
    //       }else if(screenWidth>1000 && isVertical == true){
    //          setState(() {
    //           isVertical = false;
    //         });
    //       }
    //     });
    return ListView.builder(
      
       physics: const ClampingScrollPhysics(),
       scrollDirection:isVertical?Axis.vertical: Axis.horizontal,
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
                  child: ItemCicle(
                    index: index,
                  ),
                ),
              )),
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
    return Circle(
        onHoverChange: (state) {
          setState(() {
            onHover = state;
          });
        },
        widthContainer: 120,
        width: 80,
        colorBackGround: Colors.black.withOpacity(0.8),
        colorBorde: Colors.greenAccent,
        bordeWidth: 1,
        onTap: () {
          goToPage();
        },
        widgetInCircle: SvgPicture.asset(
          getItemPageWithIndex().getRouteAssest,
          width: 45,
          // ignore: deprecated_member_use
          color: Colors.white,
        ),
        widgetReplaceText: GestureDetector(
          onTap: () {
            goToPage();
          },
          child: MouseRegion(
            onHover: (v) {
              setState(() {
                onHoverText();
              });
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.greenAccent),
                  
                  boxShadow: (pageStateController.expanded)
                      ? [
                          const BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.green,
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
                    style: TextStyle(
                        fontSize: size,
                        color: (onHover) ? Colors.greenAccent : Colors.white,
                        fontFamily: "UbuntuMono",
                        fontWeight: FontWeight.w700)),

              ),
            ),
          ),
        ));
  }
}
