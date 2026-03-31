import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../data/models/channel_mix_model.dart';
import '../../providers/brand_report_provider.dart';

/// Interactive donut chart for channel mix.
/// Tapping a segment selects it and shows details in the hole centre.
class ChannelMixChart extends ConsumerWidget {
  const ChannelMixChart({
    super.key,
    required this.channelMix,
    required this.isTablet,
  });

  final ChannelMixModel channelMix;
  final bool isTablet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedDonutSegmentProvider);
    final entries = channelMix.segments.entries.toList();

    final chart = SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sectionsSpace: 2,
          centerSpaceRadius: 60,
          sections: entries.asMap().entries.map((e) {
            final index = e.key;
            final entry = e.value;
            final isSelected = selected == entry.key;
            return PieChartSectionData(
              color: AppColors.chartPalette[index % AppColors.chartPalette.length],
              value: entry.value,
              title: isSelected ? '' : '${entry.value.toInt()}%',
              radius: isSelected ? 60 : 50,
              titleStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          }).toList(),
          pieTouchData: PieTouchData(
            touchCallback: (event, response) {
              if (!event.isInterestedForInteractions || response == null) {
                return;
              }
              final touchedIndex = response.touchedSection?.touchedSectionIndex;
              if (touchedIndex == null || touchedIndex < 0) return;

              final key = entries[touchedIndex].key;
              final notifier = ref.read(selectedDonutSegmentProvider.notifier);
              notifier.state = (notifier.state == key) ? null : key;
            },
          ),
          centerSpaceColor: Theme.of(context).colorScheme.surface,
        ),
      ),
    );

    final centreOverlay = selected != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selected,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              Text(
                '${channelMix.segments[selected]?.toInt()}%',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
              ),
            ],
          )
        : null;

    final legend = Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.xs,
      children: entries.asMap().entries.map((e) {
        final color =
            AppColors.chartPalette[e.key % AppColors.chartPalette.length];
        return _LegendItem(color: color, label: e.value.key);
      }).toList(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader('Channel Mix'),
        const Gap(AppSpacing.md),
        if (isTablet)
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    chart,
                    if (centreOverlay != null) centreOverlay,
                  ],
                ),
              ),
              const Gap(AppSpacing.md),
              Expanded(flex: 2, child: legend),
            ],
          )
        else
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  chart,
                  if (centreOverlay != null) centreOverlay,
                ],
              ),
              const Gap(AppSpacing.md),
              legend,
            ],
          ),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const Gap(4),
        Text(label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
