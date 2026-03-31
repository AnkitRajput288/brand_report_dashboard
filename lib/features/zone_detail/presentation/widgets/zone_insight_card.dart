import 'package:flutter/material.dart';

import '../../../../data/models/insight_model.dart';
import '../../../brand_report/presentation/widgets/insight_card.dart';

/// Shows the AI insight relevant to a specific zone, if one exists.
class ZoneInsightCard extends StatelessWidget {
  const ZoneInsightCard({super.key, required this.insights, required this.zoneId});

  final List<InsightModel> insights;
  final String zoneId;

  @override
  Widget build(BuildContext context) {
    final insight = insights.where((i) => i.zoneId == zoneId).firstOrNull;
    if (insight == null) return const SizedBox.shrink();
    return InsightCard(insight: insight);
  }
}
