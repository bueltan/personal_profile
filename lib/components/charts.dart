import 'package:denis_profile/controllers/chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_charts/multi_charts.dart';

class RadarChartProgramming extends StatelessWidget {
   const RadarChartProgramming({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartControl>(
      id: "ChartProgOptions",
      builder: (controller) {
      
       return switch  (controller.currentChartProgOption) {
         ChartProgOptions.languages =>
           SizedBox(
            width: 400,
            height: 400,
            //Radar Chart
            child: RadarChart(
              labelColor: Colors.white,
              strokeColor: Colors.white,
              values: ChartProgLanguages.values.map((e) => e.level).toList(),
              labels: ChartProgLanguages.values.map((e) => e.name).toList(),
              maxValue: 10,
              fillColor: Colors.blue.withOpacity(0.5),
              chartRadiusFactor: 0.7,
            ),
          ),

         ChartProgOptions.queryLanguages =>
           SizedBox(
            width: 400,
            height: 400,
            //Radar Chart
            child: RadarChart(
              labelColor: Colors.white,
              strokeColor: Colors.white,
              values: ChartProgQueryLanguages.values.map((e) => e.level).toList(),
              labels: ChartProgQueryLanguages.values.map((e) => e.name).toList(),
              maxValue: 10,
              fillColor: Colors.green.withOpacity(0.5),
              chartRadiusFactor: 0.7,
            ),
          ),
         ChartProgOptions.paradigms =>
           SizedBox(
            width: 400,
            height: 400,
            //Radar Chart
            child: RadarChart(
              labelColor: Colors.white,
              strokeColor: Colors.white,
              values: ChartProgParadigms.values.map((e) => e.level).toList(),
              labels: ChartProgParadigms.values.map((e) => e.keyName.tr).toList(),
              maxValue: 10,
              fillColor: Colors.deepPurple.withOpacity(0.5),
              chartRadiusFactor: 0.7,
            ),
          ),
      };
    });
  }
}

class RadarChartFullStack extends StatelessWidget {
   const RadarChartFullStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartControl>(
      id: "ChartFullStack",
      builder: (controller) {
       return switch  (controller.currentChartFullStack) {
         null =>
           SizedBox(
            width: 400,
            height: 400,
            //Radar Chart
            child: RadarChart(
              labelColor: Colors.white,
              strokeColor: Colors.white,
              values: ChartFullStack.values.map((e) => e.level).toList(),
              labels: ChartFullStack.values.map((e) => e.keyName.tr).toList(),
              maxValue: 10,
              fillColor: Colors.redAccent.withOpacity(0.5),
              chartRadiusFactor: 0.7,
            ),
          ),
         ChartFullStack.backend =>
           SizedBox(
            width: 400,
            height: 400,
            //Radar Chart
            child: RadarChart(
              labelColor: Colors.white,
              strokeColor: Colors.white,
              values: ChartBackEnd.values.map((e) => e.level).toList(),
              labels: ChartBackEnd.values.map((e) => e.keyName.tr).toList(),
              maxValue: 10,
              fillColor: Colors.blue.withOpacity(0.5),
              chartRadiusFactor: 0.7,
            ),
          ),

         ChartFullStack.frontend =>
           SizedBox(
            width: 400,
            height: 400,
            //Radar Chart
            child: RadarChart(
              labelColor: Colors.white,
              strokeColor: Colors.white,
              values: ChartFrontEnd.values.map((e) => e.level).toList(),
              labels: ChartFrontEnd.values.map((e) => e.keyName.tr).toList(),
              maxValue: 10,
              fillColor: Colors.green.withOpacity(0.5),
              chartRadiusFactor: 0.7,
            ),
          ),
         ChartFullStack.deploymentManagement =>
           SizedBox(
            width: 400,
            height: 400,
            //Radar Chart
            child: RadarChart(
              labelColor: Colors.white,
              strokeColor: Colors.white,
              values: ChartDeploymentManagement.values.map((e) => e.level).toList(),
              labels: ChartDeploymentManagement.values.map((e) => e.keyName.tr).toList(),
              maxValue: 10,
              fillColor: Colors.deepPurple.withOpacity(0.5),
              chartRadiusFactor: 0.7,
            ),
          ),
      };
    });
  }
}