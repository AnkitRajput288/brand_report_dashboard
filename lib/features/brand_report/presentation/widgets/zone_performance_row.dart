import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../data/models/zone_model.dart';
import '../../../zone_detail/presentation/widgets/zone_detail_sheet.dart';
import '../../presentation/screens/brand_report_screen.dart';
import 'zone_card.dart';

/// Renders zone cards as a horizontal scroll on mobile
/// and a 2-column grid on tablet / web.
class ZonePerformanceRow extends StatelessWidget {
  const ZonePerformanceRow({
    super.key,
    required this.zones,
    this.layout = LayoutMode.mobile,
  });

  final List<ZoneModel> zones;
  final LayoutMode layout;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader('Zone Performance'),
        const Gap(AppSpacing.md),
        if (layout == LayoutMode.tablet)
          _ZoneGrid(zones: zones, onTap: _openZoneDetail)
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: zones.length,
            separatorBuilder: (_, __) => const Gap(AppSpacing.sm),
            itemBuilder: (context, index) {
              final zone = zones[index];
              return ZoneCard(
                zone: zone,
                expanded: true,
                onTap: () => _openZoneDetail(context, zone),
              );
            },
          ),
      ],
    );
  }

  void _openZoneDetail(BuildContext context, ZoneModel zone) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ZoneDetailSheet(zoneId: zone.id),
    );
  }
}

/// 2-column grid of zone cards for tablet / web.
class _ZoneGrid extends StatelessWidget {
  const _ZoneGrid({required this.zones, required this.onTap});

  final List<ZoneModel> zones;
  final void Function(BuildContext, ZoneModel) onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.md,
        mainAxisExtent: AppSpacing.kZoneCardGridHeight,
      ),
      itemCount: zones.length,
      itemBuilder: (context, index) {
        final zone = zones[index];
        return ZoneCard(
          zone: zone,
          expanded: true,
          onTap: () => onTap(context, zone),
        );
      },
    );
  }
}
