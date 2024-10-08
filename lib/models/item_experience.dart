
enum TimeLineItem {foxy, ghp, guazuapp, independent, cyberlink, overUp, qualitech}

extension TimeLineItemExtension on TimeLineItem {
  String get nameTitle {
    switch (this) {
      case TimeLineItem.qualitech:
        return "qualitech_title";
      case TimeLineItem.overUp:
        return "overup_title";
      case TimeLineItem.cyberlink:
        return "cyberlink_title";
      case TimeLineItem.independent:
        return "independent_title";
      case TimeLineItem.guazuapp:
        return "guazuapp_title";
      case TimeLineItem.ghp:
        return "ghp_title";
      case TimeLineItem.foxy:
        return "foxy_title";
    }
  }

  String get centerText {
    switch (this) {
      case TimeLineItem.qualitech:
        return "qualitech_years";
      case TimeLineItem.overUp:
        return "overUp_years";
      case TimeLineItem.cyberlink:
        return "cyberlink_years";
      case TimeLineItem.independent:
        return "independent_years";
      case TimeLineItem.guazuapp:
        return "guazuapp_years";
      case TimeLineItem.ghp:
        return "ghp_years";
      case TimeLineItem.foxy:
        return "foxy_years";
    }
  }

  int get index {
    switch (this) {
      case TimeLineItem.qualitech:
        return 6;
      case TimeLineItem.overUp:
        return 5;
      case TimeLineItem.cyberlink:
        return 4;
      case TimeLineItem.independent:
        return 3;
      case TimeLineItem.guazuapp:
        return 2;
      case TimeLineItem.ghp:
        return 1;
      case TimeLineItem.foxy:
        return 0;
    }
  }

  String get rightTitle {
    switch (this) {
      case TimeLineItem.qualitech:
        return "qualitech_right_title";
      case TimeLineItem.overUp:
        return "overUp_right_title";
      case TimeLineItem.cyberlink:
        return "cyberlink_right_title";
      case TimeLineItem.independent:
        return "independent_right_title";
      case TimeLineItem.guazuapp:
        return "guazuapp_right_title";
      case TimeLineItem.ghp:
        return "ghp_right_title";
      case TimeLineItem.foxy:
        return "foxy_right_title";
    }
  }

  String get rightSubTitle {
    switch (this) {
      case TimeLineItem.qualitech:
        return "qualitech_right_subtitle";
      case TimeLineItem.overUp:
        return "overUp_right_subtitle";
      case TimeLineItem.cyberlink:
        return "cyberlink_right_subtitle";
      case TimeLineItem.independent:
        return "independent_right_subtitle";
      case TimeLineItem.guazuapp:
        return "guazuapp_right_subtitle";
      case TimeLineItem.ghp:
        return "ghp_right_subtitle";
      case TimeLineItem.foxy:
        return "foxy_right_subtitle";
    }
  }

  String get rightThirdLine {
    switch (this) {
      case TimeLineItem.qualitech:
        return "qualitech_third_line";
      case TimeLineItem.overUp:
        return "overUp_third_line";
      case TimeLineItem.cyberlink:
        return "cyberlink_third_line";
      case TimeLineItem.independent:
        return "independent_third_line";
      case TimeLineItem.guazuapp:
        return "guazuapp_third_line";
      case TimeLineItem.ghp:
        return "ghp_third_line";
      case TimeLineItem.foxy:
        return "foxy_third_line";
    }
  }

  String get rightFourthLine {
    switch (this) {
      case TimeLineItem.qualitech:
        return "qualitech_fourth_line";
      case TimeLineItem.overUp:
        return "overUp_fourth_line";
      case TimeLineItem.cyberlink:
        return "cyberlink_fourth_line";
      case TimeLineItem.independent:
        return "independent_fourth_line";
      case TimeLineItem.guazuapp:
        return "guazuapp_fourth_line";
      case TimeLineItem.ghp:
        return "ghp_fourth_line";
      case TimeLineItem.foxy:
        return "foxy_fourth_line";
    }
  }
}


