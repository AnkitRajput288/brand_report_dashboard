import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/models/brand_report.dart';
import 'animated_circular_score.dart';

/// Dashboard card showing the animated brand health score with label.
class BrandHealthCard extends StatelessWidget {
  const BrandHealthCard({super.key, required this.report});

  final BrandReport report;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'Brand Health Score',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap(24),
            AnimatedCircularScore(score: report.brandHealthScore),
            const Gap(8),
            Text(
              'Overall brand performance across all zones',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.6),
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
