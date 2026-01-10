import 'package:web/web.dart' as web;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'package:denis_profile/models/item_experience.dart';

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
  bool isDisposed = false;

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.timeLineItem.data;

    return SizedBox(
      height: 200,
      child: TimelineTile(
        hasIndicator: true,
        isFirst: widget.index == 0,
        isLast: widget.index == TimeLineItem.values.length - 1,
        axis: TimelineAxis.vertical,
        alignment: TimelineAlign.start,
        lineXY: 0.2,
        beforeLineStyle: LineStyle(
          color: amIHovering
              ? widget.startLineHover
              : widget.startLine.withOpacity(0.5),
          thickness: 2,
        ),
        afterLineStyle: LineStyle(
          color: amIHovering
              ? widget.endLineHover
              : widget.endLine.withOpacity(0.5),
          thickness: 2,
        ),
        indicatorStyle: IndicatorStyle(
          indicator: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 16),
                child: Text(
                  data.title.tr,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    shadows: const [Shadow(color: Colors.black, blurRadius: 5)],
                    color: amIHovering ? widget.textHover : widget.text,
                    fontSize: 25,
                    fontFamily: "UbuntuMono",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                data.years.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  shadows: [Shadow(color: Colors.black, blurRadius: 5)],
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: "UbuntuMono",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          drawGap: true,
          height: 100,
          width: 200,
          color: Colors.transparent,
        ),
        endChild: Padding(
          padding: const EdgeInsets.only(right: 25.0, bottom: 25),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Colors.black.withOpacity(.5),
              border: Border.all(
                width: 1,
                color: Colors.greenAccent.withOpacity(0.5),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        data.rightTitle.tr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          shadows: const [
                            Shadow(color: Colors.black, blurRadius: 5)
                          ],
                          color: amIHovering ? widget.textHover : widget.text,
                          fontSize: 19,
                          fontFamily: "UbuntuMono",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (data.rightSubTitle.tr.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          data.rightSubTitle.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            shadows: const [
                              Shadow(color: Colors.black, blurRadius: 5)
                            ],
                            color:
                                amIHovering ? widget.textHover : Colors.white,
                            fontSize: 19,
                            fontFamily: "UbuntuMono",
                          ),
                        ),
                      ),
                    if (data.rightThirdLine.tr.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Colors.greenAccent.withOpacity(0.7),
                                  backgroundColor:
                                      Colors.greenAccent.withOpacity(0.4),
                                ),
                                onPressed:
                                    data.rightThirdLine.tr.contains("%DOWN")
                                        ? null
                                        : () {
                                            openUrl(data.rightThirdLine.tr);
                                          },
                                child: Text(
                                  data.rightThirdLine.tr.split(":")[0],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                      )
                                    ],
                                    fontSize: 16,
                                    fontFamily: "UbuntuMono",
                                    color: data.rightThirdLine.tr
                                            .contains("%DOWN")
                                        ? Colors.grey
                                        : Colors.greenAccent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            if (data.rightFourthLine.tr.isNotEmpty)
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Colors.greenAccent.withOpacity(0.7),
                                  backgroundColor:
                                      Colors.greenAccent.withOpacity(0.4),
                                ),
                                onPressed:
                                    data.rightFourthLine.tr.contains("%DOWN")
                                        ? null
                                        : () {
                                            openUrl(data.rightFourthLine.tr);
                                          },
                                child: Text(
                                  data.rightFourthLine.tr.split(":")[0],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    shadows: const [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 5,
                                      )
                                    ],
                                    fontSize: 16,
                                    fontFamily: "UbuntuMono",
                                    color: data.rightFourthLine.tr
                                            .contains("%DOWN")
                                        ? Colors.grey
                                        : Colors.greenAccent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void openUrl(String textWithUrl) {
    String? url;
    if (textWithUrl.contains("http") && textWithUrl.contains(": ")) {
      url = textWithUrl.split(": ")[1].replaceAll(' ', '');
    }
    if (url != null) {
       web.window.open(url, '_blank');
    }
  }
}
