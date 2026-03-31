// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetricModelImpl _$$MetricModelImplFromJson(Map<String, dynamic> json) =>
    _$MetricModelImpl(
      label: json['label'] as String,
      value: (json['value'] as num).toDouble(),
      changePct: (json['changePct'] as num).toDouble(),
    );

Map<String, dynamic> _$$MetricModelImplToJson(_$MetricModelImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'changePct': instance.changePct,
    };
