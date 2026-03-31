import 'package:freezed_annotation/freezed_annotation.dart';

part 'insight_model.freezed.dart';
part 'insight_model.g.dart';

/// Category of an AI-generated insight.
enum InsightType {
  /// An actionable warning requiring attention
  alert,

  /// A growth opportunity to act on
  opportunity,

  /// Informational note — no action required
  fyi,
}

/// An AI-generated insight card shown in the feed.
@freezed
class InsightModel with _$InsightModel {
  const factory InsightModel({
    required String id,
    required InsightType type,
    required bool isUrgent,
    required String headline,
    required String body,
    String? zoneId,
  }) = _InsightModel;

  factory InsightModel.fromJson(Map<String, dynamic> json) =>
      _$InsightModelFromJson(json);
}
