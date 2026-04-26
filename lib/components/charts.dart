import 'package:denis_profile/controllers/chart_controller.dart';
import 'package:denis_profile/models/charts.dart';
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
        return switch (controller.currentChartProgOption) {
          ChartProgOptions.languages => _SafeRadarChart(
              values: ChartProgLanguages.values.map((e) => e.level).toList(),
              labels: ChartProgLanguages.values.map((e) => e.name).toList(),
              fillColor: Colors.blue.withOpacity(0.5),
            ),
          ChartProgOptions.queryLanguages => _SafeRadarChart(
              values:
                  ChartProgQueryLanguages.values.map((e) => e.level).toList(),
              labels: ChartProgQueryLanguages.values.map((e) => e.name).toList(),
              fillColor: Colors.green.withOpacity(0.5),
            ),
          ChartProgOptions.paradigms => _SafeRadarChart(
              values: ChartProgParadigms.values.map((e) => e.level).toList(),
              labels:
                  ChartProgParadigms.values.map((e) => e.keyName.tr).toList(),
              fillColor: Colors.greenAccent.withOpacity(0.5),
            ),
        };
      },
    );
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
        return switch (controller.currentChartFullStack) {
          null => _SafeRadarChart(
              values: ChartFullStack.values.map((e) => e.level).toList(),
              labels: ChartFullStack.values.map((e) => e.keyName.tr).toList(),
              fillColor: Colors.redAccent.withOpacity(0.5),
            ),
          ChartFullStack.backend => _SafeRadarChart(
              values: ChartBackEnd.values.map((e) => e.level).toList(),
              labels: ChartBackEnd.values.map((e) => e.keyName.tr).toList(),
              fillColor: Colors.blue.withOpacity(0.5),
            ),
          ChartFullStack.frontend => _SafeRadarChart(
              values: ChartFrontEnd.values.map((e) => e.level).toList(),
              labels: ChartFrontEnd.values.map((e) => e.keyName.tr).toList(),
              fillColor: Colors.green.withOpacity(0.5),
            ),
          ChartFullStack.deploymentManagement => _SafeRadarChart(
              values: ChartDeploymentManagement.values
                  .map((e) => e.level)
                  .toList(),
              labels: ChartDeploymentManagement.values
                  .map((e) => e.keyName.tr)
                  .toList(),
              fillColor: Colors.greenAccent.withOpacity(0.5),
            ),
        };
      },
    );
  }
}

class _SafeRadarChart extends StatelessWidget {
  final List<double> values;
  final List<String> labels;
  final Color fillColor;

  const _SafeRadarChart({
    required this.values,
    required this.labels,
    required this.fillColor,
  });

  bool get _hasValidData {
    if (values.isEmpty || labels.isEmpty) return false;
    if (values.length != labels.length) return false;
    if (values.any((value) => value.isNaN || value.isInfinite)) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasValidData) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : 400.0;

        final maxHeight = constraints.hasBoundedHeight
            ? constraints.maxHeight
            : 400.0;

        final availableSize = maxWidth < maxHeight ? maxWidth : maxHeight;
        final chartSize = availableSize.clamp(220.0, 400.0);

        if (chartSize.isNaN || chartSize.isInfinite || chartSize < 120) {
          return const SizedBox.shrink();
        }

        return Center(
          child: SizedBox(
            width: chartSize,
            height: chartSize,
            child: RepaintBoundary(
              child: RadarChart(
                labelColor: Colors.white,
                strokeColor: Colors.white,
                values: values,
                labels: labels,
                maxValue: 10,
                fillColor: fillColor,
                chartRadiusFactor: 0.7,
              ),
            ),
          ),
        );
      },
    );
  }
}