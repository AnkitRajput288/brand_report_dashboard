import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/error_card.dart';
import '../../../../data/repositories/fake_brand_report_repository.dart';
import '../../providers/brand_report_provider.dart';
import '../widgets/ai_insights_feed.dart';
import '../widgets/brand_health_card.dart';
import '../widgets/channel_mix_chart.dart';
import '../widgets/dashboard_shimmer.dart';
import '../widgets/spend_roas_chart.dart';
import '../widgets/zone_performance_row.dart';

/// Layout mode passed top-down to avoid breakpoint logic inside leaf widgets.
enum LayoutMode { mobile, tablet }

/// The main Brand Report dashboard screen.
class BrandReportScreen extends ConsumerWidget {
  const BrandReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(brandReportNotifierProvider);
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand Report'),
        actions: [
          if (reportAsync.hasValue)
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              tooltip: 'Refresh',
              onPressed: () =>
                  ref.read(brandReportNotifierProvider.notifier).refresh(),
            ),
          IconButton(
            icon: Icon(
                isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
            tooltip: isDark ? 'Switch to light theme' : 'Switch to dark theme',
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
          PopupMenuButton<BrandHealthScenario>(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Switch scenario',
            onSelected: (scenario) =>
                ref.read(selectedScenarioProvider.notifier).state = scenario,
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: BrandHealthScenario.good,
                child: Text('Good (score 70+)'),
              ),
              PopupMenuItem(
                value: BrandHealthScenario.needsAttention,
                child: Text('Needs Attention (score 40–69)'),
              ),
              PopupMenuItem(
                value: BrandHealthScenario.critical,
                child: Text('Critical (score below 40)'),
              ),
            ],
          ),
        ],
      ),
      body: reportAsync.when(
        loading: () => const DashboardShimmer(),
        error: (error, _) => ErrorCard(
          message: error.toString(),
          onRetry: () =>
              ref.read(brandReportNotifierProvider.notifier).refresh(),
        ),
        data: (report) => RefreshIndicator(
          onRefresh: () =>
              ref.read(brandReportNotifierProvider.notifier).refresh(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isTablet =
                  constraints.maxWidth > AppSpacing.kTabletBreakpoint;
              final layout = isTablet ? LayoutMode.tablet : LayoutMode.mobile;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1 — Brand Health Card
                    BrandHealthCard(report: report),
                    const Gap(AppSpacing.lg),

                    // 2 — Zone Performance
                    ZonePerformanceRow(zones: report.zones, layout: layout),
                    const Gap(AppSpacing.lg),

                    // 3 & 5 — Charts side-by-side on tablet
                    if (layout == LayoutMode.tablet)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: SpendRoasChart(
                              weeklySpend: report.weeklySpend,
                              weeklyRoas: report.weeklyRoas,
                            ),
                          ),
                          const Gap(AppSpacing.lg),
                          Expanded(
                            flex: 2,
                            child: ChannelMixChart(
                              channelMix: report.channelMix,
                              isTablet: true,
                            ),
                          ),
                        ],
                      )
                    else ...[
                      SpendRoasChart(
                        weeklySpend: report.weeklySpend,
                        weeklyRoas: report.weeklyRoas,
                      ),
                      const Gap(AppSpacing.lg),
                      ChannelMixChart(
                        channelMix: report.channelMix,
                        isTablet: false,
                      ),
                    ],
                    const Gap(AppSpacing.lg),

                    // 4 — AI Insights
                    AIInsightsFeed(insights: report.insights),
                    const Gap(AppSpacing.lg),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
