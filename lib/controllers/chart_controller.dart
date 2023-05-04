import 'package:denis_profile/models/charts.dart';
import 'package:get/get.dart';


class ChartControl extends GetxController {
  ChartProgOptions currentChartProgOption = ChartProgOptions.languages;
  ChartFullStack? currentChartFullStack;

  setCurrentChartProgOption(ChartProgOptions chartOption) {
    currentChartProgOption = chartOption;
    update(["ChartProgOptions"]);
  }

  setCurrentChartFullStack(ChartFullStack chartFullStack) {
    currentChartFullStack = chartFullStack;
    update(["ChartFullStack"]);
  }
  setChartFullStack() {
    currentChartFullStack = null;
    update(["ChartFullStack"]);
  }
}
