import 'package:denis_profile/models/item_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../controllers/page_controller.dart';

class AppDrawer extends StatefulWidget {
  final Widget child;

  const AppDrawer({
    super.key,
    required this.child,
  });

  static AppDrawerState of(BuildContext context) =>
      context.findAncestorStateOfType<AppDrawerState>()!;

  @override
  AppDrawerState createState() => AppDrawerState();
}

class AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static const Duration duration = Duration(milliseconds: 300);
  static const double maxSlide = 325;
  static const double dragRightStartVal = 60;
  static const double dragLeftStartVal = maxSlide - 20;

  late final AnimationController _controller;

  static bool shouldDrag = false;

  final PageStateController pageStateCtrl = Get.find<PageStateController>();

  bool get isWebMobile =>
      kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: AppDrawerState.duration,
      value: 0.0,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      // Start closed, without shifting the page to the right.
      pageStateCtrl.expandPage();
      _controller.value = 0.0;
    });
  }

  void close() {
    pageStateCtrl.expandPage();
    _controller.reverse();
  }

  void open() {
    pageStateCtrl.shrinkPage();
    _controller.forward();
  }

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    final bool isDraggingFromLeft =
        _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;

    final bool isDraggingFromRight =
        _controller.isCompleted &&
        startDetails.globalPosition.dx > dragLeftStartVal;

    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false || isWebMobile) {
      return;
    }

    final double? primaryDelta = updateDetails.primaryDelta;
    if (primaryDelta == null) return;

    final double delta = primaryDelta / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed) {
      pageStateCtrl.expandPage();
    } else {
      pageStateCtrl.shrinkPage();
    }

    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    const double kMinFlingVelocity = 500.0;
    final double dragVelocity =
        dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= kMinFlingVelocity) {
      final double visualVelocityInPx =
          dragEndDetails.velocity.pixelsPerSecond.dx /
              MediaQuery.of(context).size.width;

      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.2) {
      close();
    } else {
      open();
    }
  }

  void _closeOnSmallScreensIfNeeded(BoxConstraints constraints) {
    if (pageStateCtrl.expanded == false &&
        (constraints.maxWidth < 1000 || isWebMobile)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        close();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: LayoutBuilder(
        builder: (context, constraints) {
          _closeOnSmallScreensIfNeeded(constraints);

          return GetBuilder<PageStateController>(
            id: "PageState",
            builder: (controller) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, _) {
                  final double animationVal = _controller.value;
                  final double translateVal = animationVal * maxSlide;

                  return Stack(
                    children: <Widget>[
                      const CustomDrawer(),
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..translate(translateVal),
                        child: widget.child,
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  static const backgroundColor = Colors.black87;

  static const colors = [
    Colors.grey,
    Colors.black87,
  ];

  static const durations = [
    9000,
    10000,
  ];

  static const heightPercentages = [
    .11,
    .12,
  ];

  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final PageStateController pageStateCtrl = Get.find<PageStateController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: Stack(
            children: [
              WaveWidget(
                config: CustomConfig(
                  colors: CustomDrawer.colors,
                  durations: CustomDrawer.durations,
                  heightPercentages: CustomDrawer.heightPercentages,
                ),
                backgroundColor: CustomDrawer.backgroundColor,
                size: const Size(double.infinity, double.infinity),
                waveAmplitude: 0,
              ),
              GetBuilder<PageStateController>(
                id: "PageState",
                builder: (pageStateCtrl) {
                  if (pageStateCtrl.expanded) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Header(),
                      Expanded(
                        child: AnimationLimiter(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: ListView.builder(
                              itemCount: PageItem.values.length,
                              itemBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  delay: const Duration(milliseconds: 200),
                                  duration: const Duration(milliseconds: 2000),
                                  child: SlideAnimation(
                                    verticalOffset: 150.0,
                                    child: FadeInAnimation(
                                      child: ItemTime(
                                        pageItem: PageItem.values.firstWhere(
                                          (item) => item.index == index,
                                        ),
                                        index: index,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const ChangeLocate(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ChangeLocate extends StatefulWidget {
  const ChangeLocate({
    super.key,
  });

  @override
  State<ChangeLocate> createState() => _ChangeLocateState();
}

class _ChangeLocateState extends State<ChangeLocate> {
  void _changeLocale(Locale locale) {
    Get.updateLocale(locale);

    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              _changeLocale(const Locale('en', 'US'));
            },
            child: Text(
              "English",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: "UbuntuMono",
                color: Get.locale == const Locale('en', 'US')
                    ? Colors.greenAccent
                    : Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              _changeLocale(const Locale('es', 'AR'));
            },
            child: Text(
              "Español",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: "UbuntuMono",
                color: Get.locale == const Locale('es', 'AR')
                    ? Colors.greenAccent
                    : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool showMainWidget = true;
  final PageStateController pageStateCtrl = Get.find<PageStateController>();
  bool amIHovering = false;

  void onHover() {
    if (!mounted) return;

    setState(() {
      amIHovering = true;
    });

    Future.delayed(const Duration(milliseconds: 800)).then((value) {
      if (!mounted) return;

      setState(() {
        amIHovering = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final bool isWebOnMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);

    final bool hideDrawer = isWebOnMobile || screenWidth < 600;

    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 160,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16),
        child: GestureDetector(
          onTap: () {
            pageStateCtrl.jumpToPage(animate: false);
            if (hideDrawer) AppDrawer.of(context).close();
          },
          child: Visibility(
            visible: showMainWidget,
            replacement: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  onHover: (event) {
                    if (amIHovering == false) {
                      onHover();
                    }
                  },
                  child: Text(
                    'Denis Germán\nGimenez',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontFamily: "NeueMetana",
                      color: Colors.white,
                      shadows: amIHovering &&
                              pageStateCtrl.currentPageIndex != 0
                          ? const [
                              Shadow(
                                blurRadius: 3.0,
                                color: Colors.white,
                                offset: Offset(0, 0),
                              ),
                            ]
                          : null,
                    ),
                  ),
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
                          color: Colors.greenAccent,
                        ),
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Denis Germán\nGimenez',
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontFamily: "NeueMetana",
                      color: Colors.white,
                    ),
                    curve: Curves.decelerate,
                    speed: const Duration(milliseconds: 180),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 190),
                displayFullTextOnTap: false,
                stopPauseOnTap: false,
                onFinished: () {
                  if (!mounted) return;

                  setState(() {
                    showMainWidget = false;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemTime extends StatefulWidget {
  final Color startLine;
  final Color endLine;
  final Color dot;
  final Color startLineHover;
  final Color endLineHover;
  final Color dotHover;
  final Color text;
  final Color textHover;
  final int index;
  final PageItem pageItem;

  const ItemTime({
    super.key,
    this.startLine = Colors.white,
    this.endLine = Colors.white,
    this.dot = Colors.white,
    this.startLineHover = Colors.greenAccent,
    this.endLineHover = Colors.greenAccent,
    this.dotHover = Colors.greenAccent,
    this.text = Colors.white,
    this.textHover = Colors.greenAccent,
    required this.index,
    required this.pageItem,
  });

  @override
  State<ItemTime> createState() => _ItemTimeState();
}

class _ItemTimeState extends State<ItemTime> {
  bool amIHovering = false;

  void onHover() {
    if (!mounted) return;

    setState(() {
      amIHovering = true;
    });

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      if (!mounted) return;

      setState(() {
        amIHovering = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        if (amIHovering == false) {
          onHover();
        }
      },
      child: GetBuilder<PageStateController>(
        id: "pageIndex",
        builder: (controller) {
          final double screenWidth = MediaQuery.of(context).size.width;

          final bool isWebOnMobile = kIsWeb &&
              (defaultTargetPlatform == TargetPlatform.iOS ||
                  defaultTargetPlatform == TargetPlatform.android);

          final bool hideDrawer = isWebOnMobile || screenWidth < 600;

          return InkWell(
            onTap: () {
              controller.jumpToPage(
                pageItem: widget.pageItem,
                animate: false,
              );

              if (hideDrawer) AppDrawer.of(context).close();
            },
            child: SizedBox(
              width: 325,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                ),
                child: TimelineTile(
                  hasIndicator: true,
                  isLast: widget.index == PageItem.values.length - 1,
                  axis: TimelineAxis.vertical,
                  alignment: TimelineAlign.start,
                  lineXY: 0.2,
                  beforeLineStyle: LineStyle(
                    color: amIHovering
                        ? widget.startLineHover
                        : widget.startLine,
                    thickness: 2,
                  ),
                  afterLineStyle: LineStyle(
                    color: amIHovering
                        ? widget.endLineHover
                        : widget.endLine,
                    thickness: 2,
                  ),
                  indicatorStyle: IndicatorStyle(
                    iconStyle:  IconStyle(
                      iconData: Icons.circle,
                      fontSize: 14,
                      color: Colors.greenAccent,
                    ),
                    drawGap: true,
                    width: 15,
                    color: controller.currentPageIndex - 1 == widget.index
                        ? Colors.greenAccent
                        : amIHovering
                            ? widget.dotHover
                            : widget.dot,
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.transparent,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 300),
                        tween: controller.currentPageIndex - 1 == widget.index
                            ? Tween<double>(begin: 18, end: 22)
                            : Tween<double>(begin: 22, end: 18),
                        builder: (_, size, __) {
                          return Text(
                            widget.pageItem.keyName.tr,
                            style: TextStyle(
                              fontSize: size,
                              shadows: amIHovering
                                  ? const [
                                      Shadow(
                                        blurRadius: 3.0,
                                        color: Colors.greenAccent,
                                        offset: Offset(0, 0),
                                      ),
                                    ]
                                  : null,
                              color:
                                  controller.currentPageIndex - 1 == widget.index
                                      ? Colors.greenAccent
                                      : Colors.white,
                              fontFamily: "UbuntuMono",
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}