import '../models/brand_report.dart';

/// Abstract contract for fetching brand report data.
abstract class BrandReportRepository {
  /// Fetches the full brand report.
  Future<BrandReport> fetchBrandReport();
}
