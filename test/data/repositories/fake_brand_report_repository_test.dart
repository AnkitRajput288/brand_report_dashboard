import 'package:brand_report_dashboard/data/repositories/fake_brand_report_repository.dart';
import 'package:flutter_test/flutter_test.dart';

// No-op connectivity check — avoids platform channel calls in unit tests.
Future<void> _noOpConnectivity() async {}

void main() {
  group('FakeBrandReportRepository', () {
    late FakeBrandReportRepository repo;

    setUp(() {
      repo = FakeBrandReportRepository(connectivityCheck: _noOpConnectivity);
    });

    test('fetchBrandReport() returns a valid BrandReport with 5 zones',
        () async {
      final report = await repo.fetchBrandReport();

      expect(report.brandHealthScore, equals(74));
      expect(report.zones.length, equals(5));
      expect(report.insights.length, greaterThanOrEqualTo(3));
      expect(report.weeklySpend.length, equals(8));
      expect(report.weeklyRoas.length, equals(8));
    });

    test('fetchBrandReport() completes in >= 400ms (simulates delay)',
        () async {
      final stopwatch = Stopwatch()..start();
      await repo.fetchBrandReport();
      stopwatch.stop();

      expect(
        stopwatch.elapsedMilliseconds,
        greaterThanOrEqualTo(400),
        reason: 'Must simulate async delay of at least 400ms',
      );
    });

    test('fetchBrandReport() throws when simulateError is true', () async {
      repo.simulateError = true;
      expect(repo.fetchBrandReport(), throwsException);
    });

    test('channel mix segments sum to 100', () async {
      final report = await repo.fetchBrandReport();
      final total =
          report.channelMix.segments.values.reduce((sum, v) => sum + v);
      expect(total, equals(100));
    });

    test('at least one insight is urgent', () async {
      final report = await repo.fetchBrandReport();
      expect(report.insights.any((i) => i.isUrgent), isTrue);
    });
  });
}
