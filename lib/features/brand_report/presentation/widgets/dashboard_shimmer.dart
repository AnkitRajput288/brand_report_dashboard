import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';

/// Full-screen shimmer skeleton that mirrors the real dashboard layout.
/// Shown while the brand report is loading.
class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth > AppSpacing.kTabletBreakpoint;
        return Shimmer.fromColors(
          baseColor: AppColors.shimmerBase,
          highlightColor: AppColors.shimmerHighlight,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Brand Health Card placeholder
                _box(double.infinity, 240),
                const Gap(AppSpacing.lg),

                // Zone Performance section header
                _box(160, 20),
                const Gap(AppSpacing.md),

                // Zone cards — mirrors ZonePerformanceRow layout exactly
                if (isTablet)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: AppSpacing.md,
                      mainAxisSpacing: AppSpacing.md,
                      mainAxisExtent: AppSpacing.kZoneCardGridHeight,
                    ),
                    itemCount: 5,
                    itemBuilder: (_, __) =>
                        _box(double.infinity, double.infinity, radius: 12),
                  )
                else
                  SizedBox(
                    height: _kMobileCardHeight,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      separatorBuilder: (_, __) => const Gap(AppSpacing.sm),
                      itemBuilder: (_, __) => _box(
                        AppSpacing.kZoneCardWidth,
                        _kMobileCardHeight,
                        radius: 12,
                      ),
                    ),
                  ),
                const Gap(AppSpacing.lg),

                // Spend / ROAS chart
                _box(200, 20),
                const Gap(AppSpacing.md),
                _box(double.infinity, 220),
                const Gap(AppSpacing.lg),

                // AI Insights
                _box(120, 20),
                const Gap(AppSpacing.md),
                ...List.generate(
                  3,
                  (_) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: _box(double.infinity, 80),
                  ),
                ),
                const Gap(AppSpacing.lg),

                // Channel mix chart
                _box(140, 20),
                const Gap(AppSpacing.md),
                _box(double.infinity, 220),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Matches the natural height of a ZoneCard in the mobile horizontal scroll.
  /// (padding 16×2 + labelMedium + gap + headlineSmall + bodySmall + gap + trend)
  static const double _kMobileCardHeight = 140;

  static Widget _box(double width, double height, {double radius = 8}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.shimmerBase,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
