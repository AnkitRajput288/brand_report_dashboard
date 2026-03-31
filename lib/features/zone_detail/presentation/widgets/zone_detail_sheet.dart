import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/utils/number_formatter.dart';
import '../../../../core/widgets/section_header.dart';
import '../../providers/zone_detail_provider.dart';
import '../../../brand_report/providers/brand_report_provider.dart';
import 'zone_insight_card.dart';
import 'zone_metric_grid.dart';
import 'zone_sparkline.dart';

/// Draggable bottom sheet showing detailed metrics for a single zone.
class ZoneDetailSheet extends ConsumerWidget {
  const ZoneDetailSheet({super.key, required this.zoneId});

  final String zoneId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zone = ref.watch(zoneDetailProvider(zoneId));
    final report = ref.watch(brandReportNotifierProvider).valueOrNull;

    if (zone == null) {
      return const SizedBox.shrink();
    }

    // Wrap in ScaffoldMessenger + Scaffold so that snackbars are shown
    // inside the modal overlay — above the bottom sheet — rather than
    // behind it in the main Scaffold.
    return ScaffoldMessenger(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DraggableScrollableSheet(
          initialChildSize: 0.55,
          minChildSize: 0.40,
          maxChildSize: 0.85,
          snap: true,
          snapSizes: const [0.55, 0.85],
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.radiusLg),
                ),
              ),
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(AppSpacing.md),
                children: [
                  // Drag handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: AppSpacing.md),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.2),
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusSm),
                      ),
                    ),
                  ),

                  // Zone name + primary metric
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          zone.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            _formatPrimary(zone.primaryMetric.value,
                                zone.primaryMetric.label),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            zone.primaryMetric.label,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.6),
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(AppSpacing.md),

                  // Sparkline
                  ZoneSparkline(trend: zone.weeklyTrend),
                  const Gap(AppSpacing.lg),

                  // Key Metrics
                  const SectionHeader('Key Metrics'),
                  const Gap(AppSpacing.sm),
                  ZoneMetricGrid(metrics: zone.metrics),
                  const Gap(AppSpacing.lg),

                  // AI Insight for this zone
                  if (report != null) ...[
                    const SectionHeader('AI Insight'),
                    const Gap(AppSpacing.sm),
                    ZoneInsightCard(
                      insights: report.insights,
                      zoneId: zoneId,
                    ),
                    const Gap(AppSpacing.md),
                  ],

                  // CTA
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Full zone view coming soon'),
                          ),
                        );
                      },
                      child: const Text('View Full Zone →'),
                    ),
                  ),
                  const Gap(AppSpacing.xl),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _formatPrimary(double value, String label) {
    if (label == 'ROAS') return NumberFormatter.formatRoas(value);
    if (value > 10000) return NumberFormatter.formatCurrency(value);
    if (value < 100) {
      final isPercent = label.toLowerCase().contains('rate') ||
          label.toLowerCase().contains('er');
      return '${NumberFormatter.formatValue(value)}${isPercent ? "%" : ""}';
    }
    return NumberFormatter.formatValue(value, decimals: 0);
  }
}
