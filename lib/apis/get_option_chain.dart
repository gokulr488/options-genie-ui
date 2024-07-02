import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:optionsgenieui/common/app_data.dart';
import 'package:optionsgenieui/constants.dart';
import 'package:talos_commons/base_classes/base_api.dart';
import 'package:talos_commons/base_classes/base_json.dart';
import 'package:talos_commons/utils/call_context.dart';

part 'get_option_chain.g.dart';

class GetOptionChainApi extends BaseApi {
  GetOptionChainApi(
      {required super.req, super.showDefaultError, super.isHttps = IS_HTTPS});

  @override
  Future<CallContext> call() async {
    setBearerToken(token);
    await triggerCall();
    return callContext;
  }

  @override
  get restCall => http.get(uri, headers: header);

  @override
  get getOutgressLog => 'Getting Upstox Login page URL';

  @override
  get getEndpoint => '/auth/upstox/login/url';

  @override
  get deserialiser => GetOptionChainApiResp.fromRawJson;
}

@JsonSerializable()
class GetOptionChainApiReq extends Basejson {
  String? futuresKey;
  String? date;

  GetOptionChainApiReq({
    this.futuresKey,
    this.date,
  });

  factory GetOptionChainApiReq.fromJson(Map<String, dynamic> json) =>
      _$GetOptionChainApiReqFromJson(json);
  @override
  factory GetOptionChainApiReq.fromRawJson(String str) =>
      GetOptionChainApiReq.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => _$GetOptionChainApiReqToJson(this);

  @override
  String toRawJson() => json.encode(toJson());
}

@JsonSerializable()
class GetOptionChainApiResp extends Basejson {
  List<OptionChainLite>? optionChain;

  GetOptionChainApiResp({
    this.optionChain,
  });

  factory GetOptionChainApiResp.fromJson(Map<String, dynamic> json) =>
      _$GetOptionChainApiRespFromJson(json);
  @override
  factory GetOptionChainApiResp.fromRawJson(String str) =>
      GetOptionChainApiResp.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => _$GetOptionChainApiRespToJson(this);

  @override
  String toRawJson() => json.encode(toJson());
}

@JsonSerializable()
class OptionChainLite extends Basejson {
  int? time;
  List<StrikeLevel>? strikeLevels;

  OptionChainLite({
    this.time,
    this.strikeLevels,
  });

  factory OptionChainLite.fromJson(Map<String, dynamic> json) =>
      _$OptionChainLiteFromJson(json);
  @override
  factory OptionChainLite.fromRawJson(String str) =>
      OptionChainLite.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => _$OptionChainLiteToJson(this);

  @override
  String toRawJson() => json.encode(toJson());
}

@JsonSerializable()
class StrikeLevel extends Basejson {
  String? strikePrice;
  OptionDetails? ceDetails;
  OptionDetails? peDetails;

  StrikeLevel({
    this.strikePrice,
    this.ceDetails,
    this.peDetails,
  });

  factory StrikeLevel.fromJson(Map<String, dynamic> json) =>
      _$StrikeLevelFromJson(json);
  @override
  factory StrikeLevel.fromRawJson(String str) =>
      StrikeLevel.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => _$StrikeLevelToJson(this);

  @override
  String toRawJson() => json.encode(toJson());
}

@JsonSerializable()
class OptionDetails extends Basejson {
  String? ltp;
  String? oi;
  String? iv;

  OptionDetails({
    this.ltp,
    this.oi,
    this.iv,
  });

  factory OptionDetails.fromJson(Map<String, dynamic> json) =>
      _$OptionDetailsFromJson(json);
  @override
  factory OptionDetails.fromRawJson(String str) =>
      OptionDetails.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => _$OptionDetailsToJson(this);

  @override
  String toRawJson() => json.encode(toJson());
}
