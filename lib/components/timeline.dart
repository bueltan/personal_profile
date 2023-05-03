import 'dart:html' as html;

import 'package:denis_profile/controllers/timeline_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ItemTimeLineWork extends StatefulWidget {
  final Color startLine;
  final Color endLine;
  final Color dot;
  final Color startLineHover;
  final Color endLineHover;
  final Color dotHover;
  final Color text;
  final Color textHover;
  final int index;
  final TimeLineItem timeLineItem;

  const ItemTimeLineWork({
    super.key,
    this.startLine = Colors.white,
    this.endLine = Colors.white,
    this.dot = Colors.white,
    this.startLineHover = Colors.green,
    this.endLineHover = Colors.green,
    this.dotHover = Colors.green,
    this.text = Colors.greenAccent,
    this.textHover = Colors.green,
    required this.index,
    required this.timeLineItem,
  });

  @override
  State<ItemTimeLineWork> createState() => _ItemTimeState();
}

class _ItemTimeState extends State<ItemTimeLineWork> {
  bool amIHovering = false;

  void onHover() async {
    setState(() {
      amIHovering = false;
    });
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      setState(() {
        amIHovering = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => {
        if (amIHovering == false) {onHover()}
      },
      child: SizedBox(
        height: 200,
        child: TimelineTile(
          hasIndicator: true,
          isFirst: widget.index == 0,
          isLast: widget.index == TimeLineItem.values.length - 1,
          axis: TimelineAxis.vertical,
          alignment: TimelineAlign.center,
          lineXY: 0.2,
          beforeLineStyle: LineStyle(
              color: (amIHovering)
                  ? widget.startLineHover
                  : widget.startLine,
              thickness: 2),
          afterLineStyle: LineStyle(
              color:
                  (amIHovering) ? widget.endLineHover : widget.endLine,
              thickness: 2),
          indicatorStyle: IndicatorStyle(
              indicator: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.timeLineItem.centerText.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: "UbuntuMono",
                  ),
                ),
              ),
              drawGap: true,
              height: 40,
              width: 200,
              color: Colors.transparent),
          startChild: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 200,
              child: Text(
                widget.timeLineItem.nameTitle.tr,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: (amIHovering) ? widget.textHover : widget.text,
                  fontSize: 25,
                  fontFamily: "UbuntuMono",
                ),
              ),
            ),
          ),
          endChild: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.timeLineItem.rightTitle.tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: (amIHovering)
                          ? widget.textHover
                          : widget.text,
                      fontSize: 19,
                      fontFamily: "UbuntuMono",
                    ),
                  ),
                ),
                if (widget.timeLineItem.rightSubTitle.tr != "")
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      widget.timeLineItem.rightSubTitle.tr,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: (amIHovering)
                            ? widget.textHover
                            : Colors.white.withOpacity(0.9),
                        fontSize: 19,
                        fontFamily: "UbuntuMono",
                      ),
                    ),
                  ),
                if (widget.timeLineItem.rightThirdLine.tr != "")
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                Colors.greenAccent.withOpacity(0.7),
                            backgroundColor: Colors.deepPurpleAccent
                                .withOpacity(0.4), // Background Color
                          ),
                          onPressed: () {
                          openUrl(widget.timeLineItem.rightThirdLine.tr);

                          },
                          child: Text(
                            widget.timeLineItem.rightThirdLine.tr.split(":")[0],
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "UbuntuMono",
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      if (widget.timeLineItem.rightFourthLine.tr != "")TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              Colors.greenAccent.withOpacity(0.7),
                          backgroundColor: Colors.deepPurpleAccent
                              .withOpacity(0.4), // Background Color
                        ),
                        onPressed: () {
                          openUrl(widget.timeLineItem.rightFourthLine.tr);
                        },
                        child: Text(
                          widget.timeLineItem.rightFourthLine.tr.split(":")[0],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "UbuntuMono",
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  openUrl(String textWithUrl){
    String ? url;
    if (textWithUrl.contains("http") && textWithUrl.contains(": ")){
      url = textWithUrl.split(": ")[1].replaceAll(' ', '');
    }
    if (url != null){
        html.window.open(url,"_blank");

    }
  }
}