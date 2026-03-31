import 'package:freezed_annotation/freezed_annotation.dart';

import 'metric_model.dart';

part 'zone_model.freezed.dart';
part 'zone_model.g.dart';

/// A marketing zone (e.g. Paid Ads, SEO) with its performance metrics.
@freezed
class ZoneModel with _$ZoneModel {
  const factory ZoneModel({
    required String id,
    required String name,
    required MetricModel primaryMetric,
    required List<MetricModel> metrics,

    /// 4 data points used for the sparkline chart
    required List<double> weeklyTrend,
  }) = _ZoneModel;

  factory ZoneModel.fromJson(Map<String, dynamic> json) =>
      _$ZoneModelFromJson(json);
}
