import 'package:flutter/material.dart';
import 'package:optionsgenieui/apis/get_option_chain.dart';
import 'package:optionsgenieui/screens/graph/graph_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:talos_commons/widgets/base_screen.dart';
import 'package:talos_commons/widgets/loading_dots.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  GraphController ctrl = GraphController.instance;
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        headerText: 'Options',
        child: FutureBuilder<List<OptionChainLite>?>(
            future: ctrl.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const LoadingCircle(size: 100);
              }

              return SfCartesianChart(
                legend: const Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.scroll),
                primaryXAxis: const NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  majorGridLines: MajorGridLines(width: 0),
                ),
                primaryYAxis: const NumericAxis(
                  axisLine: AxisLine(width: 0),
                  majorTickLines: MajorTickLines(color: Colors.transparent),
                ),
                series: ctrl.buildLineSeries(snapshot.data) ?? [],
                tooltipBehavior: TooltipBehavior(enable: true),
              );
            }));
  }

  @override
  void initState() {
    ctrl.getData();
    super.initState();
  }
}
