// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_option_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOptionChainApiReq _$GetOptionChainApiReqFromJson(
        Map<String, dynamic> json) =>
    GetOptionChainApiReq(
      futuresKey: json['futuresKey'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$GetOptionChainApiReqToJson(
        GetOptionChainApiReq instance) =>
    <String, dynamic>{
      'futuresKey': instance.futuresKey,
      'date': instance.date,
    };

GetOptionChainApiResp _$GetOptionChainApiRespFromJson(
        Map<String, dynamic> json) =>
    GetOptionChainApiResp(
      optionChain: (json['optionChain'] as List<dynamic>?)
          ?.map((e) => OptionChainLite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetOptionChainApiRespToJson(
        GetOptionChainApiResp instance) =>
    <String, dynamic>{
      'optionChain': instance.optionChain,
    };

OptionChainLite _$OptionChainLiteFromJson(Map<String, dynamic> json) =>
    OptionChainLite(
      time: (json['time'] as num?)?.toInt(),
      strikeLevels: (json['strikeLevels'] as List<dynamic>?)
          ?.map((e) => StrikeLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OptionChainLiteToJson(OptionChainLite instance) =>
    <String, dynamic>{
      'time': instance.time,
      'strikeLevels': instance.strikeLevels,
    };

StrikeLevel _$StrikeLevelFromJson(Map<String, dynamic> json) => StrikeLevel(
      strikePrice: json['strikePrice'] as String?,
      ceDetails: json['ceDetails'] == null
          ? null
          : OptionDetails.fromJson(json['ceDetails'] as Map<String, dynamic>),
      peDetails: json['peDetails'] == null
          ? null
          : OptionDetails.fromJson(json['peDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StrikeLevelToJson(StrikeLevel instance) =>
    <String, dynamic>{
      'strikePrice': instance.strikePrice,
      'ceDetails': instance.ceDetails,
      'peDetails': instance.peDetails,
    };

OptionDetails _$OptionDetailsFromJson(Map<String, dynamic> json) =>
    OptionDetails(
      ltp: json['ltp'] as String?,
      oi: json['oi'] as String?,
      iv: json['iv'] as String?,
    );

Map<String, dynamic> _$OptionDetailsToJson(OptionDetails instance) =>
    <String, dynamic>{
      'ltp': instance.ltp,
      'oi': instance.oi,
      'iv': instance.iv,
    };
