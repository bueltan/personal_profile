class TimeLineItemData {
  final String title;
  final String years;
  final String rightTitle;
  final String rightSubTitle;
  final String rightThirdLine;
  final String rightFourthLine;
  final int index;

  const TimeLineItemData({
    required this.title,
    required this.years,
    required this.rightTitle,
    required this.rightSubTitle,
    required this.rightThirdLine,
    required this.rightFourthLine,
    required this.index,
  });
}

enum TimeLineItem {
  icvr,
  dockaboat,
  ghp,
  guazuapp,
  independent,
  cyberlink,
  overUp,
  qualitech,
}

const Map<TimeLineItem, TimeLineItemData> _timelineMap = {
  TimeLineItem.icvr: TimeLineItemData(
    title: "icvr_title",
    years: "icvr_years",
    rightTitle: "icvr_right_title",
    rightSubTitle: "icvr_right_subtitle",
    rightThirdLine: "icvr_third_line",
    rightFourthLine: "icvr_fourth_line",
    index: 0,
  ),
  TimeLineItem.dockaboat: TimeLineItemData(
    title: "dockaboat_title",
    years: "dockaboat_years",
    rightTitle: "dockaboat_right_title",
    rightSubTitle: "dockaboat_right_subtitle",
    rightThirdLine: "dockaboat_third_line",
    rightFourthLine: "dockaboat_fourth_line",
    index: 1,
  ),
  TimeLineItem.ghp: TimeLineItemData(
    title: "ghp_title",
    years: "ghp_years",
    rightTitle: "ghp_right_title",
    rightSubTitle: "ghp_right_subtitle",
    rightThirdLine: "ghp_third_line",
    rightFourthLine: "ghp_fourth_line",
    index: 2,
  ),
  TimeLineItem.guazuapp: TimeLineItemData(
    title: "guazuapp_title",
    years: "guazuapp_years",
    rightTitle: "guazuapp_right_title",
    rightSubTitle: "guazuapp_right_subtitle",
    rightThirdLine: "guazuapp_third_line",
    rightFourthLine: "guazuapp_fourth_line",
    index: 3,
  ),
  TimeLineItem.independent: TimeLineItemData(
    title: "independent_title",
    years: "independent_years",
    rightTitle: "independent_right_title",
    rightSubTitle: "independent_right_subtitle",
    rightThirdLine: "independent_third_line",
    rightFourthLine: "independent_fourth_line",
    index: 4,
  ),
  TimeLineItem.cyberlink: TimeLineItemData(
    title: "cyberlink_title",
    years: "cyberlink_years",
    rightTitle: "cyberlink_right_title",
    rightSubTitle: "cyberlink_right_subtitle",
    rightThirdLine: "cyberlink_third_line",
    rightFourthLine: "cyberlink_fourth_line",
    index: 5,
  ),
  TimeLineItem.overUp: TimeLineItemData(
    title: "overup_title",
    years: "overUp_years",
    rightTitle: "overUp_right_title",
    rightSubTitle: "overUp_right_subtitle",
    rightThirdLine: "overUp_third_line",
    rightFourthLine: "overUp_fourth_line",
    index: 6,
  ),
  TimeLineItem.qualitech: TimeLineItemData(
    title: "qualitech_title",
    years: "qualitech_years",
    rightTitle: "qualitech_right_title",
    rightSubTitle: "qualitech_right_subtitle",
    rightThirdLine: "qualitech_third_line",
    rightFourthLine: "qualitech_fourth_line",
    index: 7,
  ),
};

extension TimeLineItemExtension on TimeLineItem {
  TimeLineItemData get data => _timelineMap[this]!;
}
