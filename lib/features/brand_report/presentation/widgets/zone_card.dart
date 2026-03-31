import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/number_formatter.dart';
import '../../../../data/models/metric_model.dart';
import '../../../../data/models/zone_model.dart';

/// A fixed-width card for a single marketing zone.
/// Tapping opens the zone detail bottom sheet via [onTap].
class ZoneCard extends StatefulWidget {
  const ZoneCard({
    super.key,
    required this.zone,
    required this.onTap,
    this.expanded = false,
  });

  final ZoneModel zone;
  final VoidCallback onTap;

  /// When true the card fills its parent (grid cell). When false a fixed
  /// 160px width is used for the horizontal scroll layout.
  final bool expanded;

  @override
  State<ZoneCard> createState() => _ZoneCardState();
}

class _ZoneCardState extends State<ZoneCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scaleController;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.97,
      upperBound: 1.0,
      value: 1.0,
    );
    _scale = _scaleController;
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _scaleController.reverse(),
      onTapUp: (_) {
        _scaleController.forward();
        widget.onTap();
      },
      onTapCancel: () => _scaleController.forward(),
      child: ScaleTransition(
        scale: _scale,
        child: SizedBox(
          width: widget.expanded ? double.infinity : AppSpacing.kZoneCardWidth,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.zone.name,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.7),
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(AppSpacing.sm),
                  Text(
                    _formatPrimaryValue(widget.zone.primaryMetric),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget.zone.primaryMetric.label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.5),
                        ),
                  ),
                  const Gap(AppSpacing.sm),
                  _TrendArrow(metric: widget.zone.primaryMetric),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatPrimaryValue(MetricModel metric) {
    if (metric.label == 'ROAS') return NumberFormatter.formatRoas(metric.value);
    if (metric.label == 'Spend') {
      return NumberFormatter.formatCurrency(metric.value);
    }
    if (metric.value > 10000) {
      return NumberFormatter.formatCurrency(metric.value);
    }
    if (metric.value < 100) {
      return '${NumberFormatter.formatValue(metric.value)}${_isPercent(metric.label) ? "%" : ""}';
    }
    return NumberFormatter.formatValue(metric.value, decimals: 0);
  }

  bool _isPercent(String label) {
    final l = label.toLowerCase();
    return l.contains('rate') || l.contains('er') || l.contains('ctr');
  }
}

/// Arrow + change percentage indicator for a metric trend.
class _TrendArrow extends StatelessWidget {
  const _TrendArrow({required this.metric});

  final MetricModel metric;

  @override
  Widget build(BuildContext context) {
    final trend = metric.trend;
    final (icon, color) = switch (trend) {
      TrendDirection.up => (Icons.arrow_upward_rounded, AppColors.trendUp),
      TrendDirection.down => (
          Icons.arrow_downward_rounded,
          AppColors.trendDown
        ),
      TrendDirection.flat => (Icons.remove_rounded, AppColors.trendFlat),
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const Gap(2),
        Text(
          NumberFormatter.formatPct(metric.changePct),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
        ),
      ],
    );
  }
}
