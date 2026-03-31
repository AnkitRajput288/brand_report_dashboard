// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BrandReportImpl _$$BrandReportImplFromJson(Map<String, dynamic> json) =>
    _$BrandReportImpl(
      brandHealthScore: (json['brandHealthScore'] as num).toInt(),
      zones: (json['zones'] as List<dynamic>)
          .map((e) => ZoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      weeklySpend: (json['weeklySpend'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      weeklyRoas: (json['weeklyRoas'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      insights: (json['insights'] as List<dynamic>)
          .map((e) => InsightModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      channelMix:
          ChannelMixModel.fromJson(json['channelMix'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BrandReportImplToJson(_$BrandReportImpl instance) =>
    <String, dynamic>{
      'brandHealthScore': instance.brandHealthScore,
      'zones': instance.zones,
      'weeklySpend': instance.weeklySpend,
      'weeklyRoas': instance.weeklyRoas,
      'insights': instance.insights,
      'channelMix': instance.channelMix,
    };
