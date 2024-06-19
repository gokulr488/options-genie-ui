import 'dart:convert';

import 'package:optionsgenieui/common/app_data.dart';
import 'package:talos_commons/base_classes/base_api.dart';
import 'package:talos_commons/base_classes/base_json.dart';
import 'package:talos_commons/utils/call_context.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'upstox_login_page.g.dart';

class UpstoxLoginPageApi extends BaseApi {
  UpstoxLoginPageApi({required super.req, super.showDefaultError});

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
  get deserialiser => UpstoxLoginPageUrlResp.fromRawJson;
}

@JsonSerializable()
class UpstoxLoginPageUrlResp extends Basejson {
  final String? url;

  UpstoxLoginPageUrlResp({
    this.url,
  });

  factory UpstoxLoginPageUrlResp.fromJson(Map<String, dynamic> json) =>
      _$UpstoxLoginPageUrlRespFromJson(json);
  @override
  factory UpstoxLoginPageUrlResp.fromRawJson(String str) =>
      UpstoxLoginPageUrlResp.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => _$UpstoxLoginPageUrlRespToJson(this);

  @override
  String toRawJson() => json.encode(toJson());
}
