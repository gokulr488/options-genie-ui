import 'dart:convert';

import 'package:talos_commons/base_classes/base_api.dart';
import 'package:talos_commons/base_classes/base_json.dart';
import 'package:talos_commons/utils/call_context.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
part 'og_login.g.dart';

class OgLoginApi extends BaseApi {
  OgLoginApi({required super.req, super.showDefaultError});

  @override
  Future<CallContext> call() async {
    await triggerCall();
    return callContext;
  }

  @override
  get restCall => http.post(uri, headers: header, body: req.toRawJson());

  @override
  get getOutgressLog => 'Getting Upstox Login page URL';

  @override
  get getEndpoint => '/auth/og/login';

  @override
  get deserialiser => OgLoginResp.fromRawJson;
}

@JsonSerializable()
class OgLoginResp extends Basejson {
  final bool? status;
  final String? message;
  final String? token;

  OgLoginResp({
    this.status,
    this.message,
    this.token,
  });

  factory OgLoginResp.fromJson(Map<String, dynamic> json) =>
      _$OgLoginRespFromJson(json);
  @override
  factory OgLoginResp.fromRawJson(String str) =>
      OgLoginResp.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => _$OgLoginRespToJson(this);

  @override
  String toRawJson() => json.encode(toJson());
}

@JsonSerializable()
class OgLoginReq extends Basejson {
  final String? userName;
  final String? password;

  OgLoginReq({
    this.password,
    this.userName,
  });

  factory OgLoginReq.fromJson(Map<String, dynamic> json) =>
      _$OgLoginReqFromJson(json);
  @override
  factory OgLoginReq.fromRawJson(String str) =>
      OgLoginReq.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => _$OgLoginReqToJson(this);

  @override
  String toRawJson() => json.encode(toJson());
}
