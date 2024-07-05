import 'package:optionsgenieui/apis/apis.dart';
import 'package:optionsgenieui/apis/get_option_chain.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:talos_commons/utils/call_context.dart';

class GraphController {
  GraphController._privateConstructor();

  static final GraphController instance = GraphController._privateConstructor();

  List<OptionChainLite>? chartData = [];

  Future<List<OptionChainLite>?> getData() async {
    CallContext callContext = await Apis().getOptionChain('NSE_INDEX|Nifty 50');
    if (!callContext.isError) {
      GetOptionChainApiResp resp = callContext.data;
      chartData = resp.optionChain;
    }

    return chartData;
  }

  List<LineSeries<StrikeLevel, num>>? buildLineSeries(
      List<OptionChainLite>? chainData) {
    var lineData = chainData?.map(chartLineMapper).toList();
    return lineData;
  }

  LineSeries<StrikeLevel, num> chartLineMapper(chain) {
    return LineSeries<StrikeLevel, num>(
        dataSource: chain.strikeLevels,
        xValueMapper: (StrikeLevel level, _) => chain.time,
        yValueMapper: (StrikeLevel level, _) =>
            int.tryParse(level.ceDetails?.ltp ?? '0'),
        name: 'Germany',
        markerSettings: const MarkerSettings(isVisible: true));
  }
}
