import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/number_formatter.dart';
import '../../../../data/models/metric_model.dart';

/// 2-column grid of metric tiles for the zone detail sheet.
class ZoneMetricGrid extends StatelessWidget {
  const ZoneMetricGrid({super.key, required this.metrics});

  final List<MetricModel> metrics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisSpacing: AppSpacing.sm,
        childAspectRatio: 2.2,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) => _MetricTile(metric: metrics[index]),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.metric});

  final MetricModel metric;

  @override
  Widget build(BuildContext context) {
    final trendColor = switch (metric.trend) {
      TrendDirection.up => AppColors.trendUp,
      TrendDirection.down => AppColors.trendDown,
      TrendDirection.flat => AppColors.trendFlat,
    };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              metric.label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.6),
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    _formatValue(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  NumberFormatter.formatPct(metric.changePct),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: trendColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatValue() {
    if (metric.value > 10000) {
      return NumberFormatter.formatCurrency(metric.value);
    }
    if (metric.label.toLowerCase().contains('rate') ||
        metric.label.toLowerCase().contains('er') ||
        metric.label.toLowerCase().contains('ctr')) {
      return '${NumberFormatter.formatValue(metric.value)}%';
    }
    return NumberFormatter.formatValue(metric.value);
  }
}
