import 'package:denis_profile/components/AtomPanel.dart';
import 'package:denis_profile/controllers/PagesState.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2 extends StatefulWidget {
  const Page2({
    super.key,
  });

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with TickerProviderStateMixin {
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
    if(isDisposed == false){
           setState(() {
        btnHover = false;
    });
    }});
 
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
                            "assets/images/back_ground_apollo_control.png"),
                        fit: BoxFit.cover,
                        opacity: (controller.expanded) ? 8 : 0.6,
                      ),
                    ),
                  ),
                
                  CircularPanel(),
                ],
              );
            }
          );
            
          
        
  }
}

