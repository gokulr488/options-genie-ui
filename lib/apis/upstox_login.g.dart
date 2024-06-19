// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upstox_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpstoxLoginResp _$UpstoxLoginRespFromJson(Map<String, dynamic> json) =>
    UpstoxLoginResp(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UpstoxLoginRespToJson(UpstoxLoginResp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
    };

UpstoxLoginReq _$UpstoxLoginReqFromJson(Map<String, dynamic> json) =>
    UpstoxLoginReq(
      code: json['code'] as String?,
    );

Map<String, dynamic> _$UpstoxLoginReqToJson(UpstoxLoginReq instance) =>
    <String, dynamic>{
      'code': instance.code,
    };
