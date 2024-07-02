import 'dart:convert';

import 'package:optionsgenieui/constants.dart';
import 'package:talos_commons/base_classes/base_api.dart';
import 'package:talos_commons/base_classes/base_json.dart';
import 'package:talos_commons/utils/call_context.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'upstox_login.g.dart';

class UpstoxLoginApi extends BaseApi {
  UpstoxLoginApi(
      {required super.req, super.showDefaultError, super.isHttps = IS_HTTPS});

  @override
  Future<CallContext> call() async {
    await triggerCall();
    return callContext;
  }

  @override
  get restCall => http.post(uri, headers: header, body: req.toRawJson());

  @override
  get getOutgressLog => 'Authenticating with Upstox';

  @override
  get getEndpoint => '/auth/upstox/login';

  @override
  get deserialiser => UpstoxLoginResp.fromRawJson;
}

@JsonSerializable()
class UpstoxLoginResp extends Basejson {
  final bool? status;
  final String? message;
  final String? token;

  UpstoxLoginResp({
    this.status,
    this.message,
    this.token,
  });

  factory UpstoxLoginResp.fromJson(Map<String, dynamic> json) =>
      _$UpstoxLoginRespFromJson(json);
  @override
  factory UpstoxLoginResp.fromRawJson(String str) =>
      UpstoxLoginResp.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => _$UpstoxLoginRespToJson(this);

  @override
  String toRawJson() => json.encode(toJson());
}

@JsonSerializable()
class UpstoxLoginReq extends Basejson {
  final String? code;

  UpstoxLoginReq({this.code});

  factory UpstoxLoginReq.fromJson(Map<String, dynamic> json) =>
      _$UpstoxLoginReqFromJson(json);
  @override
  factory UpstoxLoginReq.fromRawJson(String str) =>
      UpstoxLoginReq.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => _$UpstoxLoginReqToJson(this);

  @override
  String toRawJson() => json.encode(toJson());
}
