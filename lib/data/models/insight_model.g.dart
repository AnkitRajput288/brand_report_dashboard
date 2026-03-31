// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsightModelImpl _$$InsightModelImplFromJson(Map<String, dynamic> json) =>
    _$InsightModelImpl(
      id: json['id'] as String,
      type: $enumDecode(_$InsightTypeEnumMap, json['type']),
      isUrgent: json['isUrgent'] as bool,
      headline: json['headline'] as String,
      body: json['body'] as String,
      zoneId: json['zoneId'] as String?,
    );

Map<String, dynamic> _$$InsightModelImplToJson(_$InsightModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$InsightTypeEnumMap[instance.type]!,
      'isUrgent': instance.isUrgent,
      'headline': instance.headline,
      'body': instance.body,
      'zoneId': instance.zoneId,
    };

const _$InsightTypeEnumMap = {
  InsightType.alert: 'alert',
  InsightType.opportunity: 'opportunity',
  InsightType.fyi: 'fyi',
};
