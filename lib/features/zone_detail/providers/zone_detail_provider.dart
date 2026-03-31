import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/zone_model.dart';
import '../../brand_report/providers/brand_report_provider.dart';

part 'zone_detail_provider.g.dart';

/// Returns the [ZoneModel] with the given [zoneId], or null if not found.
/// Derived synchronously from the brand report data.
@riverpod
ZoneModel? zoneDetail(
  // ignore: deprecated_member_use
  ZoneDetailRef ref,
  String zoneId,
) {
  final report = ref.watch(brandReportNotifierProvider).valueOrNull;
  return report?.zones.where((z) => z.id == zoneId).firstOrNull;
}
