// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'og_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OgLoginResp _$OgLoginRespFromJson(Map<String, dynamic> json) => OgLoginResp(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$OgLoginRespToJson(OgLoginResp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
    };

OgLoginReq _$OgLoginReqFromJson(Map<String, dynamic> json) => OgLoginReq(
      password: json['password'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$OgLoginReqToJson(OgLoginReq instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
    };
