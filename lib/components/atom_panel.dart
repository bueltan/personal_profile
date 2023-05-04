import 'dart:ui' as ui;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:denis_profile/controllers/atom_controller.dart';
import 'package:denis_profile/models/item_atom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CircularPanel extends StatefulWidget {
  final Widget contentWidget;

  const CircularPanel({
    super.key,
    required this.contentWidget,
  });

  @override
  State<CircularPanel> createState() => _CircularPanelState();
}

class _CircularPanelState extends State<CircularPanel> {
  @override
  Widget build(BuildContext context) {
    return CanvasCircle(
      contentWidget: widget.contentWidget,
    );
  }
}

class CanvasCircle extends StatefulWidget {
  final Widget contentWidget;

  const CanvasCircle({
    super.key,
    required this.contentWidget,
  });

  @override
  State<CanvasCircle> createState() => _CanvasCircleState();
}

class _CanvasCircleState extends State<CanvasCircle> {
  @override
  Widget build(BuildContext context) {
    AtomController atomController = Get.find<AtomController>();
    double height = MediaQuery.of(context).size.height;
    return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: (atomController.expanded)
            ? Colors.black.withOpacity(0.5)
            : Colors.black.withOpacity(0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: LayoutBuilder(builder: (context, mainConstraints) {
                double width = .50 * (mainConstraints.maxWidth);
                double height = .50 * (mainConstraints.maxWidth);
                double icrementedWidth = 0;
                icrementedWidth = width * 1.1;
                if (atomController.expanded ){
                  while  (mainConstraints.maxHeight >= icrementedWidth){
                    width = icrementedWidth;
                    height = width;
                    icrementedWidth = width + 1;

                  }
                  
                  
                }
                return AtomPanel(
                    atomController: atomController,
                    width: width,
                    height: height);
              }),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 25,
                    bottom: 25,
                    left: 25,
                    right: (!atomController.expanded &&
                            atomController.currentItemAtom != ItemAtom.none)
                        ? 365
                        : 25),
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    border: Border.all(  color: Colors.deepPurpleAccent.withOpacity(0.5)),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 800),
                  height: (atomController.currentItemAtom == ItemAtom.none)
                      ? 0
                      : height,
                  width: (atomController.currentItemAtom == ItemAtom.none)
                      ? 0
                      : 800,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Visibility(
                      visible:
                          atomController.currentItemAtom != ItemAtom.none &&
                              constraints.maxWidth > 600,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: widget.contentWidget),
                          Positioned(
                            right: 10,
                            top: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.greenAccent,
                                  size: 25,
                                ),
                                onPressed: () {
                                  atomController
                                      .setCurrentItemAtom(ItemAtom.none);
                                },
                                splashRadius: 20,
                                splashColor: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),
                          // Positioned(
                          //       right: 10,
                          //       top: 45,
                          //       child:  Column(
                          //     mainAxisSize: MainAxisSize.min,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: TextButton(
                                      
                          //             onPressed: () {
                          //               atomController
                          //                   .setCurrentItemAtom(ItemAtom.none);
                          //             }, child: Text("A", ),
                                     
                          //           ),
                          //         ),
                                
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ));
  }
}

class AtomPanel extends StatelessWidget {
  const AtomPanel({
    super.key,
    required this.atomController,
    required this.width,
    required this.height,
  });

  final AtomController atomController;
  final double width;
  final double height;
  final double minimunWidth = 600;
  final double minimunHeight = 600;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            right: (!atomController.expanded &&
                    atomController.currentItemAtom == ItemAtom.none)
                ? 300
                : 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          dragStartBehavior: DragStartBehavior.down,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: Colors.transparent,
              width: (width <= minimunWidth) ? minimunWidth : width,
              height: (height <= minimunHeight) ? minimunHeight : height,
              child: LayoutBuilder(builder: (context, constraints) {
                double mainWidth = (constraints.maxWidth <= minimunWidth)
                    ? minimunWidth
                    : constraints.maxWidth;
                double mainHeight = (constraints.maxHeight <= minimunHeight)
                    ? minimunHeight
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
                          fontFamily: "UbuntuMono",
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      ElementalCircle(
                        widthContainer: mainWidth,
                        heightContainer: mainWidth,
                        width: mainWidth * .25,
                        height: mainWidth * .25,
                        colorBackGround: Colors.transparent,
                        colorBorde: Colors.white,
                        onTap: () {
                          atomController.setCurrentItemAtom(ItemAtom.fullstack);
                        },
                        widgetInCircle:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "full_stack_developer".tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: "UbuntuMono",
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        itemAtom: ItemAtom.fullstack,
                      ),
                    ],
                  ),
                );
              }),
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
  final AtomController atomController = Get.find<AtomController>();

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
    atomController.setCurrentItemAtom(ItemAtom.none);

    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            itemAtom: ItemAtom.none,
            onTap: () {
              atomController.setCurrentItemAtom(ItemAtom.none);
            },
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
                text: ItemAtom.sysadmin.keyName.tr,
                textStyle: widget.textStyle,
                onTap: () {
                  atomController.setCurrentItemAtom(ItemAtom.sysadmin);
                },
                widgetInCircle:
                 SvgPicture.asset(
                  "icons/sysadmin_icon.svg",
                  width: widget.mainHeight * .06,
                  // ignore: deprecated_member_use
                  color: Colors.greenAccent,
                ),
                itemAtom: ItemAtom.sysadmin,
              ),
              Circle(
                widthContainer: (widget.mainWidth * .5) * .33,
                width: (widget.mainWidth * .5) * .30,
                colorBackGround: Colors.black,
                colorBorde: Colors.greenAccent,
                axisDirection: AxisDirection.right,
                text: ItemAtom.softskills.keyName.tr,
                textStyle: widget.textStyle,
                onTap: () {
                  atomController.setCurrentItemAtom(ItemAtom.softskills);
                },
                widgetInCircle: SvgPicture.asset(
                  "icons/soft_skills_icon.svg",
                  width: widget.mainHeight * .06,
                  // ignore: deprecated_member_use
                  color: Colors.greenAccent,
                ),
                itemAtom: ItemAtom.softskills,
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
                text: ItemAtom.programming.keyName.tr,
                textStyle: widget.textStyle,
                onTap: () {
                  atomController.setCurrentItemAtom(ItemAtom.programming);
                },
                widgetInCircle: SvgPicture.asset(
                  "icons/programming_icon.svg",
                  width: widget.mainHeight * .06,
                  // ignore: deprecated_member_use
                  color: Colors.greenAccent,
                ),
                itemAtom: ItemAtom.programming,
              ),
              Circle(
                heightContainer: (widget.mainHeight * .5) * .33,
                height: (widget.mainHeight * .5) * .30,
                colorBackGround: Colors.black,
                colorBorde: Colors.greenAccent,
                text: ItemAtom.electronic.keyName.tr,
                textStyle: widget.textStyle,
                onTap: () {
                  atomController.setCurrentItemAtom(ItemAtom.electronic);
                },
                widgetInCircle: SvgPicture.asset(
                  "icons/electronics_icon.svg",
                  width: widget.mainHeight * .06,
                  // ignore: deprecated_member_use
                  color: Colors.greenAccent,
                ),
                itemAtom: ItemAtom.electronic,
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
  final double bordeWidth;

  final Color colorBackGround;
  final Color colorBorde;
  final String text;
  final TextStyle textStyle;
  final AxisDirection axisDirection;
  final Function()? onTap;
  final ValueChanged<bool>? onHoverChange;
  final Widget? widgetReplaceText;

  final Widget widgetInCircle;
  final Enum? itemAtom;

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
    this.itemAtom,
    this.onHoverChange,
    this.widgetReplaceText, this.bordeWidth = 2,
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
                  itemAtom: itemAtom,
                  onHoverChange: onHoverChange,
                  bordeWidth: bordeWidth,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: (widgetReplaceText != null)
                      ? widgetReplaceText
                      : Text(
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
                  child: (widgetReplaceText != null)
                      ? widgetReplaceText
                      : Text(
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
                  itemAtom: itemAtom,
                  onHoverChange: onHoverChange,
                  bordeWidth: bordeWidth,
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
                  itemAtom: itemAtom,
                  onHoverChange: onHoverChange,
                  bordeWidth: bordeWidth,
                ),
                SizedBox(
                    width: widthContainer,
                    child: Center(
                      child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: (widgetReplaceText != null)
                      ? widgetReplaceText
                      : Text(
                          text,
                          style: textStyle,
                          textAlign: TextAlign.center,

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
                        child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: (widgetReplaceText != null)
                      ? widgetReplaceText
                      : Text(
                          text,
                          style: textStyle,
                          textAlign: TextAlign.center,
                        ),
                )
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
                  itemAtom: itemAtom,
                  onHoverChange: onHoverChange,
                  bordeWidth: bordeWidth,
                ),
              ],
            ),
        });
  }
}

class ElementalCircle extends StatefulWidget {
  const ElementalCircle(
      {super.key,
      this.heightContainer,
      this.widthContainer,
      this.width,
      this.height,
      this.onTap,
      this.hoverEfect = true,
      this.widgetInCircle = const SizedBox(),
      required this.colorBorde,
      required this.colorBackGround,
      this.itemAtom,
      this.onHoverChange, this.bordeWidth = 2});

  final double? heightContainer;
  final double? widthContainer;
  final double? width;
  final double bordeWidth;

  final double? height;
  final ui.Color colorBorde;
  final ui.Color colorBackGround;
  final bool hoverEfect;
  final Widget widgetInCircle;
  final Enum? itemAtom;
  final Function()? onTap;
  final ValueChanged<bool>? onHoverChange;

  @override
  State<ElementalCircle> createState() => _ElementalCircleState();
}

class _ElementalCircleState extends State<ElementalCircle> {
  bool amIHovering = false;
  bool hoveringExit = false;
  bool isDisposed = false;

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  void onHover() {
    if (widget.onHoverChange != null) {
      widget.onHoverChange!(true);
    }
    setState(() {
      amIHovering = true;
    });
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      if (isDisposed) {
        return;
      }
      setState(() {
        if (widget.onHoverChange != null) {
          widget.onHoverChange!(false);
        }
        amIHovering = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    AtomController atomController = Get.find<AtomController>();
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
                elevation: (amIHovering) ? 15 : 0,
                shadowColor: (widget.colorBackGround != Colors.transparent)
                    ? widget.colorBorde
                    : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: (widget.height != null && amIHovering)
                      ? widget.height! * 1.2
                      : widget.height,
                  width: (widget.width != null && amIHovering)
                      ? widget.width! * 1.2
                      : widget.width,
                  decoration: BoxDecoration(
                    border: Border.all(width: widget.bordeWidth, color: widget.colorBorde),
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Center(child: widget.widgetInCircle),
                        AvatarGlow(
                          glowColor: widget.colorBorde,
                          duration: const Duration(seconds: 2),
                          endRadius: widget.width ?? widget.height!,
                          animate:
                              widget.itemAtom == atomController.currentItemAtom,
                          repeat: false,
                          child: const SizedBox(),
                        ),
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
