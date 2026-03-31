import 'package:intl/intl.dart';

/// Utility functions for formatting numbers used in dashboard metrics.
class NumberFormatter {
  NumberFormatter._();

  static final NumberFormat _inrCompact = NumberFormat.compactCurrency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 1,
  );

  static final NumberFormat _pct = NumberFormat('#,##0.0');

  /// Formats a ROAS value as "4.2x"
  static String formatRoas(double value) => '${value.toStringAsFixed(1)}x';

  /// Formats a currency value in compact Indian format, e.g. "₹1.2L"
  static String formatCurrency(double value) => _inrCompact.format(value);

  /// Formats a percentage change, e.g. "+8.3%" or "-1.4%"
  static String formatPct(double value, {bool showSign = true}) {
    final formatted = _pct.format(value.abs());
    if (!showSign) return '$formatted%';
    return value >= 0 ? '+$formatted%' : '-$formatted%';
  }

  /// Formats a plain double with given decimal places
  static String formatValue(double value, {int decimals = 1}) =>
      value.toStringAsFixed(decimals);
}
