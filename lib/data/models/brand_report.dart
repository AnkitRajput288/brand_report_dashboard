import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/constants/score_thresholds.dart';
import '../../core/theme/app_colors.dart';
import 'channel_mix_model.dart';
import 'insight_model.dart';
import 'zone_model.dart';

part 'brand_report.freezed.dart';
part 'brand_report.g.dart';

/// Root model for the Brand Report dashboard.
@freezed
class BrandReport with _$BrandReport {
  const BrandReport._();

  const factory BrandReport({
    required int brandHealthScore,
    required List<ZoneModel> zones,
    /// 8-week spend values in Rs
    required List<double> weeklySpend,
    /// 8-week ROAS values
    required List<double> weeklyRoas,
    required List<InsightModel> insights,
    required ChannelMixModel channelMix,
  }) = _BrandReport;

  factory BrandReport.fromJson(Map<String, dynamic> json) =>
      _$BrandReportFromJson(json);

  /// Human-readable label for the brand health score.
  String get healthLabel {
    if (brandHealthScore >= ScoreThresholds.good) return 'Good';
    if (brandHealthScore >= ScoreThresholds.needsAttention) {
      return 'Needs Attention';
    }
    return 'Critical';
  }

  /// Colour corresponding to the current health score.
  Color get healthColor {
    if (brandHealthScore >= ScoreThresholds.good) return AppColors.scoreGood;
    if (brandHealthScore >= ScoreThresholds.needsAttention) {
      return AppColors.scoreWarning;
    }
    return AppColors.scoreCritical;
  }
}
