import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../data/models/insight_model.dart';
import 'insight_card.dart';

/// Non-scrollable column of AI insight cards.
/// The parent [SingleChildScrollView] handles scrolling.
class AIInsightsFeed extends StatelessWidget {
  const AIInsightsFeed({super.key, required this.insights});

  final List<InsightModel> insights;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader('AI Insights'),
        const Gap(AppSpacing.md),
        ...insights.map((insight) => InsightCard(insight: insight)),
      ],
    );
  }
}
