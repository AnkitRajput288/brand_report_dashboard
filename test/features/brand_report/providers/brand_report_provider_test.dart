import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:brand_report_dashboard/data/models/brand_report.dart';
import 'package:brand_report_dashboard/data/models/channel_mix_model.dart';
import 'package:brand_report_dashboard/data/repositories/brand_report_repository.dart';
import 'package:brand_report_dashboard/data/repositories/brand_report_repository_provider.dart';
import 'package:brand_report_dashboard/features/brand_report/providers/brand_report_provider.dart';

class MockBrandReportRepository extends Mock implements BrandReportRepository {}

/// Minimal valid BrandReport for tests.
const _stubReport = BrandReport(
  brandHealthScore: 74,
  zones: [],
  weeklySpend: [1, 2, 3, 4, 5, 6, 7, 8],
  weeklyRoas: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0],
  insights: [],
  channelMix: ChannelMixModel(segments: {}),
);

void main() {
  late MockBrandReportRepository mockRepo;
  late ProviderContainer container;

  setUp(() {
    mockRepo = MockBrandReportRepository();
    when(() => mockRepo.fetchBrandReport())
        .thenAnswer((_) async => _stubReport);

    container = ProviderContainer(
      overrides: [
        brandReportRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );
  });

  tearDown(() => container.dispose());

  test('initial state is AsyncLoading', () {
    // Reading the provider before the future resolves gives AsyncLoading.
    final state = container.read(brandReportNotifierProvider);
    expect(state, isA<AsyncLoading<BrandReport>>());
  });

  test('after build() completes, state is AsyncData<BrandReport>', () async {
    await container.read(brandReportNotifierProvider.future);
    final state = container.read(brandReportNotifierProvider);
    expect(state, isA<AsyncData<BrandReport>>());
    expect(state.value?.brandHealthScore, equals(74));
  });

  test('refresh() transitions loading → data', () async {
    // Wait for initial load
    await container.read(brandReportNotifierProvider.future);

    // Trigger refresh
    final notifier = container.read(brandReportNotifierProvider.notifier);
    final refreshFuture = notifier.refresh();

    // Mid-refresh state should be loading
    final midState = container.read(brandReportNotifierProvider);
    expect(midState, isA<AsyncLoading<BrandReport>>());

    await refreshFuture;

    final finalState = container.read(brandReportNotifierProvider);
    expect(finalState, isA<AsyncData<BrandReport>>());
  });

  test('error state is propagated when repository throws', () async {
    when(() => mockRepo.fetchBrandReport()).thenThrow(Exception('network error'));

    final errorContainer = ProviderContainer(
      overrides: [
        brandReportRepositoryProvider.overrideWithValue(mockRepo),
      ],
    );
    addTearDown(errorContainer.dispose);

    await expectLater(
      errorContainer.read(brandReportNotifierProvider.future),
      throwsA(isA<Exception>()),
    );

    final state = errorContainer.read(brandReportNotifierProvider);
    expect(state, isA<AsyncError<BrandReport>>());
  });
}
