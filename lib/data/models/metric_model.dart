import 'package:freezed_annotation/freezed_annotation.dart';

part 'metric_model.freezed.dart';
part 'metric_model.g.dart';

/// Direction of a metric change relative to the previous period.
enum TrendDirection {
  /// Change > +1.0%
  up,

  /// Change < -1.0%
  down,

  /// Change between -1.0% and +1.0%
  flat,
}

/// A single labelled metric with its current value and week-over-week change.
@freezed
class MetricModel with _$MetricModel {
  const MetricModel._();

  const factory MetricModel({
    required String label,
    required double value,
    /// Positive = improvement, negative = decline (percentage points)
    required double changePct,
  }) = _MetricModel;

  factory MetricModel.fromJson(Map<String, dynamic> json) =>
      _$MetricModelFromJson(json);

  /// Derives the trend direction from [changePct].
  TrendDirection get trend {
    if (changePct > 1.0) return TrendDirection.up;
    if (changePct < -1.0) return TrendDirection.down;
    return TrendDirection.flat;
  }
}
