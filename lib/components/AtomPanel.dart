import 'dart:ui' as ui;
import 'package:denis_profile/components/AtomController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CircularPanel extends StatefulWidget {
  const CircularPanel({
    super.key,
  });

  @override
  State<CircularPanel> createState() => _CircularPanelState();
}

class _CircularPanelState extends State<CircularPanel> {
  @override
  Widget build(BuildContext context) {
    final AtomController atomController = Get.find<AtomController>();

    return LayoutBuilder(builder: (context, mainConstraints) {
      double width = .49 * (mainConstraints.maxWidth);
      double height = .49 * (mainConstraints.maxWidth);

      return CanvasCircle(
          atomController: atomController, width: width, height: height);
    });
  }
}

class CanvasCircle extends StatelessWidget {
  const CanvasCircle({
    super.key,
    required this.atomController,
    required this.width,
    required this.height,
  });

  final AtomController atomController;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: const Duration(milliseconds: 1500),
      color: (atomController.expanded)
          ? Colors.black.withOpacity(0.7)
          : Colors.black.withOpacity(0.5),
      child: Center(
        child: Padding(
          padding:
              EdgeInsets.only(right: (atomController.expanded) ? 0 : 325.0),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: Colors.transparent,
                  width: (width <= 600) ? 600 : width,
                  height: (height <= 600) ? 600 : height,
                  child: LayoutBuilder(builder: (context, constraints) {
                    double mainWidth = (constraints.maxWidth <= 600)
                        ? 600
                        : constraints.maxWidth;
                    double mainHeight = (constraints.maxHeight <= 600)
                        ? 600
                        : constraints.maxHeight;
                    return Center(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          ExternalCircles(
                            mainWidth: mainWidth,
                            mainHeight: mainHeight,
                            atomController: atomController,
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: "NeueMetana",
                            ),
                          ),
                          ElementalCircle(
                            widthContainer: mainWidth,
                            heightContainer: mainWidth,
                            width: mainWidth * .25,
                            height: mainWidth * .25,
                            colorBackGround: Colors.transparent,
                            colorBorde: Colors.white,
                            onTap: () {},
                            widgetInCircle: const Text(
                              "Full stack developer",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: "NeueMetana",
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExternalCircles extends StatefulWidget {
  const ExternalCircles({
    super.key,
    required this.mainWidth,
    required this.mainHeight,
    required this.atomController,
    required this.textStyle,
  });

  final double mainWidth;
  final double mainHeight;
  final AtomController atomController;
  final TextStyle textStyle;
  @override
  State<ExternalCircles> createState() => _ExternalCirclesState();
}

class _ExternalCirclesState extends State<ExternalCircles>
    with TickerProviderStateMixin {
  late Animation<double> animationRotateExternalCircule;
  late AnimationController animationControllerRotate;
  late Animation<double> animationTextInternalCicule;
  late AnimationController animationControllerText;

  bool isDisposed = false;
  @override
  void initState() {
    super.initState();
    isDisposed = false;

    animationControllerText = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    animationControllerRotate = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animationRotateExternalCircule = CurvedAnimation(
      parent: animationControllerRotate,
      curve: Curves.easeInOutCirc,
    );

    animationTextInternalCicule =
        CurvedAnimation(parent: animationControllerText, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    animationControllerRotate.dispose();
    animationControllerText.dispose();
    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AtomController atomController = Get.find<AtomController>();

    animationControllerRotate.forward();
    return RotationTransition(
      turns: animationRotateExternalCircule,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ElementalCircle(
            widthContainer: widget.mainWidth * .5,
            heightContainer: widget.mainWidth * .5,
            width: widget.mainWidth * .5,
            height: widget.mainHeight * 5,
            colorBackGround: Colors.transparent,
            colorBorde: Colors.greenAccent,
            hoverEfect: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Circle(
                widthContainer: (widget.mainWidth * .5) * .33,
                width: (widget.mainWidth * .5) * .30,
                colorBackGround: Colors.black,
                colorBorde: Colors.greenAccent,
                axisDirection: AxisDirection.left,
                text: atomController.textLeftCircle.tr,
                textStyle: widget.textStyle,
                onTap: () {},
              ),
              Circle(
                widthContainer: (widget.mainWidth * .5) * .33,
                width: (widget.mainWidth * .5) * .30,
                colorBackGround: Colors.black,
                colorBorde: Colors.greenAccent,
                axisDirection: AxisDirection.right,
                text: atomController.textRightCircle.tr,
                textStyle: widget.textStyle,
                onTap: () {},
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Circle(
                heightContainer: (widget.mainHeight * .5) * .33,
                height: (widget.mainHeight * .5) * .30,
                colorBackGround: Colors.black,
                axisDirection: AxisDirection.up,
                colorBorde: Colors.greenAccent,
                text: atomController.textUpperCircle.tr,
                textStyle: widget.textStyle,
                onTap: () {},
              ),
              Circle(
                heightContainer: (widget.mainHeight * .5) * .33,
                height: (widget.mainHeight * .5) * .30,
                colorBackGround: Colors.black,
                colorBorde: Colors.greenAccent,
                text: atomController.textLowerCircle.tr,
                textStyle: widget.textStyle,
                onTap: () {},
                widgetInCircle: SvgPicture.asset(
                  "icons/electronics_icon.svg",
                  width: widget.mainHeight * .08,
                  // ignore: deprecated_member_use
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final double? heightContainer;
  final double? height;
  final double? widthContainer;
  final double? width;
  final Color colorBackGround;
  final Color colorBorde;
  final String text;
  final TextStyle textStyle;
  final AxisDirection axisDirection;
  final Function()? onTap;
  final Widget widgetInCircle;

  const Circle({
    super.key,
    this.widthContainer,
    this.width,
    this.heightContainer,
    this.height,
    required this.colorBackGround,
    this.colorBorde = Colors.white,
    this.text = "text",
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 16),
    this.axisDirection = AxisDirection.down,
    this.onTap,
    this.widgetInCircle = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: switch (axisDirection) {
          AxisDirection.down => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElementalCircle(
                  heightContainer: heightContainer ?? widthContainer,
                  widthContainer: widthContainer ?? heightContainer,
                  width: width ?? height,
                  height: height ?? width,
                  colorBorde: colorBorde,
                  colorBackGround: colorBackGround,
                  onTap: onTap,
                  widgetInCircle: widgetInCircle,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    text,
                    style: textStyle,
                  ),
                )
              ],
            ),
          AxisDirection.up => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    text,
                    style: textStyle,
                  ),
                ),
                ElementalCircle(
                  heightContainer: heightContainer ?? widthContainer,
                  widthContainer: widthContainer ?? heightContainer,
                  width: width ?? height,
                  height: height ?? width,
                  colorBorde: colorBorde,
                  colorBackGround: colorBackGround,
                  onTap: onTap,
                  widgetInCircle: widgetInCircle,
                ),
              ],
            ),
          AxisDirection.right => Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElementalCircle(
                  heightContainer: heightContainer ?? widthContainer,
                  widthContainer: widthContainer ?? heightContainer,
                  width: width ?? height,
                  height: height ?? width,
                  colorBorde: colorBorde,
                  colorBackGround: colorBackGround,
                  onTap: onTap,
                  widgetInCircle: widgetInCircle,
                ),
                SizedBox(
                    width: widthContainer,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          style: textStyle,
                        ),
                      ),
                    ))
              ],
            ),
          AxisDirection.left => Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: widthContainer,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          style: textStyle,
                        ),
                      ),
                    )),
                ElementalCircle(
                  heightContainer: heightContainer ?? widthContainer,
                  widthContainer: widthContainer ?? heightContainer,
                  width: width ?? height,
                  height: height ?? width,
                  colorBorde: colorBorde,
                  colorBackGround: colorBackGround,
                  onTap: onTap,
                  widgetInCircle: widgetInCircle,
                ),
              ],
            ),
        });
  }
}

class ElementalCircle extends StatefulWidget {
  const ElementalCircle({
    super.key,
    this.heightContainer,
    this.widthContainer,
    this.width,
    this.height,
    this.onTap,
    this.hoverEfect = true,
    this.widgetInCircle = const SizedBox(),
    required this.colorBorde,
    required this.colorBackGround,
  });

  final double? heightContainer;
  final double? widthContainer;
  final double? width;
  final double? height;
  final ui.Color colorBorde;
  final ui.Color colorBackGround;
  final bool hoverEfect;
  final Widget widgetInCircle;

  final Function()? onTap;

  @override
  State<ElementalCircle> createState() => _ElementalCircleState();
}

class _ElementalCircleState extends State<ElementalCircle> {
  bool amIHovering = false;
  bool hoveringExit = false;

  void onHover() {
    setState(() {
      amIHovering = true;
    });
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        amIHovering = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.heightContainer,
        width: widget.widthContainer,
        child: Center(
            child: MouseRegion(
          onHover: (event) {
            if (amIHovering == false && widget.hoverEfect == true) {
              onHover();
            }
          },
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 2, top: 2, bottom: 2, right: 2),
              child: Material(
                shape: const CircleBorder(),
                color: widget.colorBackGround,
                elevation: (amIHovering) ? 10 : 0,
                child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
                  height: (widget.height != null && amIHovering)
                      ? widget.height! * 1.2
                      : widget.height,
                  width: (widget.width != null && amIHovering)
                      ? widget.width! * 1.2
                      : widget.width,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: widget.colorBorde),
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Center(child: widget.widgetInCircle),
                        InkWell(
                          onTap: widget.onTap,
                          splashColor: Colors.deepPurpleAccent,
                          customBorder: const CircleBorder(),
                          autofocus: true,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        )));
  }
}
