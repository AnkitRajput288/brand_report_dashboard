import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/brand_report/providers/brand_report_provider.dart';
import 'brand_report_repository.dart';
import 'fake_brand_report_repository.dart';

/// Provides the [BrandReportRepository] implementation used at runtime.
/// Recreates the repository when [selectedScenarioProvider] changes.
/// Override this in tests with a mock.
final brandReportRepositoryProvider = Provider<BrandReportRepository>((ref) {
  final scenario = ref.watch(selectedScenarioProvider);
  return FakeBrandReportRepository(scenario: scenario);
});
