import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/insight_model.dart';

/// A card displaying a single AI insight with type icon and urgent indicator.
class InsightCard extends StatelessWidget {
  const InsightCard({super.key, required this.insight, this.onTap});

  final InsightModel insight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final (icon, iconColor) = _iconForType(insight.type);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: insight.isUrgent
            ? const Border(
                left: BorderSide(color: AppColors.urgentBorder, width: 4),
              )
            : null,
        borderRadius: BorderRadius.circular(12),
        color: insight.isUrgent
            ? AppColors.scoreCritical.withValues(alpha: 0.04)
            : null,
      ),
      child: Card(
        margin: EdgeInsets.zero,
        shape: insight.isUrgent
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              )
            : null,
        child: ListTile(
          onTap: onTap ??
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Coming soon')),
                );
              },
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(icon, color: iconColor, size: 28),
              if (insight.isUrgent)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.scoreCritical,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          title: Text(
            insight.headline,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            insight.body,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.65),
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
        ),
      ),
    );
  }

  (IconData, Color) _iconForType(InsightType type) => switch (type) {
        InsightType.alert => (
            Icons.warning_amber_rounded,
            AppColors.scoreWarning
          ),
        InsightType.opportunity => (
            Icons.trending_up_rounded,
            AppColors.scoreGood
          ),
        InsightType.fyi => (Icons.info_outline_rounded, AppColors.primary),
      };
}
