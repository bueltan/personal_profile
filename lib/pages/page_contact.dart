import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:denis_profile/controllers/page_controller.dart';
import 'package:denis_profile/models/item_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PageContact extends StatefulWidget {
  const PageContact({
    super.key,
  });

  @override
  State<PageContact> createState() => _PageContactState();
}

class _PageContactState extends State<PageContact>
    with TickerProviderStateMixin {
  late Animation<double> animationProjects;
  late AnimationController animationControllerProjects;
  late Animation<double> animationText;
  late AnimationController animationControllerText;
  late ScrollController scrollController;
  late CarouselController carouselController;
  bool isDisposed = false;
  @override
  void initState() {
    super.initState();
    isDisposed = false;
    scrollController = ScrollController();
    animationControllerProjects = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    animationControllerText = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    carouselController = CarouselController();
    animationProjects = CurvedAnimation(
        parent: animationControllerProjects, curve: Curves.easeIn);

    animationText =
        CurvedAnimation(parent: animationControllerText, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    animationControllerProjects.dispose();
    animationControllerText.dispose();
    scrollController.dispose();
    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationControllerProjects.forward();
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
                        "assets/images/background_space_cupula_soyus.png"),
                    fit: BoxFit.cover,
                    opacity: (controller.expanded) ? 0.7 : 0.5,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: (controller.expanded) ? 0 : 325,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          '_contact'.tr,
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
                    Positioned.fill(
                      top: 40,
                      left: 25,
                      right: 25,
                      bottom: 25,
                        child: Content(animationProjects: animationProjects)),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.animationProjects,
  });

  final Animation<double> animationProjects;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: FadeTransition(
          opacity: animationProjects,
          child: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0, bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    border: Border.all(
                        color: Colors.deepPurpleAccent.withOpacity(0.8)),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: LayoutBuilder(builder: (context, constrains) {
                    return Wrap(
                      spacing: 25,
                      runSpacing:25 ,
                      children: [
                           PanelCreateMessage(
                          constrains: constrains,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 300, maxHeight: 400),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: ItemContact.values.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    delay: const Duration(milliseconds: 300),
                                    duration: const Duration(milliseconds: 2500),
                                    child: SlideAnimation(
                                        verticalOffset: 250.0,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: FadeInAnimation(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25, right: 25, bottom: 25),
                                            child: CardDataContact(
                                              itemContact: ItemContact.values
                                                  .firstWhere(
                                                      (e) => e.index == index),
                                            ),
                                          )),
                                        )),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                       
                      ],
                    );
                  }),
                )),
          ),
        ),
      ),
    );
  }
}

class PanelCreateMessage extends StatelessWidget {
  final BoxConstraints constrains;
  const PanelCreateMessage({
    super.key,
    required this.constrains,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            "contact_to_me".tr,
            style: const TextStyle(
                fontSize: 26.0,
                fontFamily: "UbuntuMono",
                fontWeight: FontWeight.w600,
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25 ,bottom: 25),
          child: Wrap(
            spacing: 25,
            runSpacing: 25,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.greenAccent, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.deepPurpleAccent, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.greenAccent, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.deepPurpleAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
                    Column(
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
                          child: TextField(
                            maxLines: 50,
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurpleAccent, width: 1.0),
                                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent, width: 1.0),
                                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.greenAccent.withOpacity(0.7),
                                  backgroundColor:
                                      Colors.deepPurpleAccent.withOpacity(0.4), // Background Color
                                ),
                                onPressed: () {
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "SENT",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      shadows: [Shadow(color: Colors.black,blurRadius: 5)],
                                        fontSize: 22,
                                        fontFamily: "UbuntuMono",
                                        color: Colors.greenAccent,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                        ),
                      ],
                    ),
              
            ],
          ),
        ),
      ],
    );
  }
}

class CardDataContact extends StatefulWidget {
  final ItemContact itemContact;

  const CardDataContact({
    super.key,
    required this.itemContact,
  });

  @override
  State<CardDataContact> createState() => _CardDataContactState();
}

class _CardDataContactState extends State<CardDataContact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              radius: 100,
              splashColor: Colors.deepPurpleAccent.withOpacity(0.5),
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: widget.itemContact.value));
                _showToast(widget.itemContact.value);
              },
              child: Padding(
                padding: const EdgeInsets.all(25),
                // ignore: deprecated_member_use
                child: SvgPicture.asset(
                  widget.itemContact.icon,
                  width: 80,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText(
                  widget.itemContact.value,
                  textAlign: TextAlign.start,
                  textStyle: const TextStyle(
                      fontSize: 22.0,
                      fontFamily: "UbuntuMono",
                      color: Colors.greenAccent),
                  curve: Curves.decelerate,
                  speed: const Duration(milliseconds: 180),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 190),
              displayFullTextOnTap: false,
              stopPauseOnTap: false,
              onTap: () {
                Clipboard.setData(
                    ClipboardData(text: widget.itemContact.value));
                _showToast(widget.itemContact.value);
              },
            ),
          ),
        ],
      ),
    );
  }

  _showToast(String text, {bool clipboard = true}) {
    var snackBar = SnackBar(
      backgroundColor: Colors.black.withOpacity(0.5),
      duration: const Duration(seconds: 1),
      content: AnimatedTextKit(
        isRepeatingAnimation: false,
        animatedTexts: [
          TypewriterAnimatedText(
            clipboard ? '${"clipboard".tr}: $text' : text,
            textAlign: TextAlign.start,
            textStyle: const TextStyle(
                fontSize: 22.0,
                fontFamily: "UbuntuMono",
                color: Colors.greenAccent),
            curve: Curves.decelerate,
            speed: const Duration(milliseconds: 20),
          ),
        ],
        totalRepeatCount: 1,
        pause: const Duration(milliseconds: 20),
        displayFullTextOnTap: false,
        stopPauseOnTap: false,
      ),
    );
    // Step 3
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
