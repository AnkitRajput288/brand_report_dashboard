// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ZoneModelImpl _$$ZoneModelImplFromJson(Map<String, dynamic> json) =>
    _$ZoneModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      primaryMetric:
          MetricModel.fromJson(json['primaryMetric'] as Map<String, dynamic>),
      metrics: (json['metrics'] as List<dynamic>)
          .map((e) => MetricModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      weeklyTrend: (json['weeklyTrend'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$ZoneModelImplToJson(_$ZoneModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'primaryMetric': instance.primaryMetric,
      'metrics': instance.metrics,
      'weeklyTrend': instance.weeklyTrend,
    };
