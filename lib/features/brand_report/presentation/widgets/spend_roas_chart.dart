import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/section_header.dart';

/// Line chart showing weekly Spend (left axis) and ROAS (right axis).
class SpendRoasChart extends StatelessWidget {
  const SpendRoasChart({
    super.key,
    required this.weeklySpend,
    required this.weeklyRoas,
  });

  final List<double> weeklySpend;
  final List<double> weeklyRoas;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader('Spend vs ROAS — Last 8 Weeks'),
        const Gap(AppSpacing.md),
        _Legend(),
        const Gap(AppSpacing.sm),
        SizedBox(
          height: 220,
          child: LineChart(
            _buildChartData(),
            duration: const Duration(milliseconds: 600),
          ),
        ),
      ],
    );
  }

  LineChartData _buildChartData() {
    final spendSpots = weeklySpend
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList();

    final roasSpots = weeklyRoas
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList();

    final maxSpend = weeklySpend.reduce((a, b) => a > b ? a : b);
    final minRoas = weeklyRoas.reduce((a, b) => a < b ? a : b);
    final maxRoas = weeklyRoas.reduce((a, b) => a > b ? a : b);

    return LineChartData(
      minX: 0,
      maxX: (weeklySpend.length - 1).toDouble(),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              final week = 'W${value.toInt() + 1}';
              return Text(
                week,
                style: const TextStyle(fontSize: 10),
              );
            },
            reservedSize: 22,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 52,
            getTitlesWidget: (value, meta) {
              if (value == 0) return const Text('');
              final fmt = NumberFormat.compactCurrency(
                symbol: '₹',
                locale: 'en_IN',
                decimalDigits: 0,
              );
              return Text(
                fmt.format(value),
                style: const TextStyle(fontSize: 9),
              );
            },
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 36,
            getTitlesWidget: (value, meta) {
              return Text(
                '${value.toStringAsFixed(1)}x',
                style: const TextStyle(fontSize: 9),
              );
            },
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      gridData: const FlGridData(show: true, drawVerticalLine: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: spendSpots,
          isCurved: true,
          color: AppColors.chartSpend,
          barWidth: 2.5,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.chartSpend.withValues(alpha: 0.08),
          ),
        ),
        // ROAS values need normalising to share the left axis scale.
        // We scale ROAS to the spend range for visual overlap, and use
        // the right axis labels for true ROAS values.
        LineChartBarData(
          spots: roasSpots
              .map(
                (s) => FlSpot(
                  s.x,
                  _normalise(s.y, minRoas, maxRoas, 0, maxSpend * 0.6),
                ),
              )
              .toList(),
          isCurved: true,
          color: AppColors.chartRoas,
          barWidth: 2.5,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.chartRoas.withValues(alpha: 0.08),
          ),
        ),
      ],
    );
  }

  double _normalise(
    double value,
    double fromMin,
    double fromMax,
    double toMin,
    double toMax,
  ) {
    if (fromMax == fromMin) return toMin;
    return (value - fromMin) / (fromMax - fromMin) * (toMax - toMin) + toMin;
  }
}

class _Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _LegendDot(color: AppColors.chartSpend, label: 'Spend (₹)'),
        Gap(AppSpacing.md),
        _LegendDot(color: AppColors.chartRoas, label: 'ROAS (x)'),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

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
