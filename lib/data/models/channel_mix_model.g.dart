// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_mix_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChannelMixModelImpl _$$ChannelMixModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChannelMixModelImpl(
      segments: (json['segments'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$ChannelMixModelImplToJson(
        _$ChannelMixModelImpl instance) =>
    <String, dynamic>{
      'segments': instance.segments,
    };
