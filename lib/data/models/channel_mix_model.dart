import 'package:freezed_annotation/freezed_annotation.dart';

part 'channel_mix_model.freezed.dart';
part 'channel_mix_model.g.dart';

/// Wrapper for channel mix percentage distribution.
/// Keys are channel names; values are percentage shares (0–100).
@freezed
class ChannelMixModel with _$ChannelMixModel {
  const factory ChannelMixModel({
    required Map<String, double> segments,
  }) = _ChannelMixModel;

  factory ChannelMixModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelMixModelFromJson(json);
}
