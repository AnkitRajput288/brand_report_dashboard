import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/app_logger.dart';
import '../../../data/models/brand_report.dart';
import '../../../data/repositories/brand_report_repository_provider.dart';
import '../../../data/repositories/fake_brand_report_repository.dart';

part 'brand_report_provider.g.dart';

/// Controls which mock health score scenario the fake repository returns.
final selectedScenarioProvider = StateProvider<BrandHealthScenario>(
  (ref) => BrandHealthScenario.good,
);

/// AsyncNotifier that loads and refreshes the brand report.
/// Re-fetches automatically when [selectedScenarioProvider] changes.
@riverpod
class BrandReportNotifier extends _$BrandReportNotifier {
  @override
  Future<BrandReport> build() {
    // Rebuild (and re-fetch) whenever the scenario changes.
    ref.watch(selectedScenarioProvider);
    return _fetch();
  }

  Future<BrandReport> _fetch() {
    AppLogger.d('BrandReportNotifier: fetching brand report');
    return ref.read(brandReportRepositoryProvider).fetchBrandReport();
  }

  /// Reloads the brand report, transitioning through [AsyncLoading].
  Future<void> refresh() async {
    AppLogger.i('BrandReportNotifier: refreshing');
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

/// Tracks the currently selected donut chart segment key.
/// null means no segment is selected.
final selectedDonutSegmentProvider = StateProvider<String?>((ref) => null);

/// Controls the app-wide theme mode. Defaults to the system preference.
final themeModeProvider = StateProvider<ThemeMode>(
  (ref) => ThemeMode.system,
);
