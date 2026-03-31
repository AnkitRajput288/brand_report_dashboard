import 'package:flutter/material.dart';

/// All colour tokens for the Evernine dashboard.
/// Widget files MUST use these constants — no raw Color values.
class AppColors {
  AppColors._();

  // ── Brand ──────────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF1A56DB);
  static const Color onPrimary = Colors.white;
  static const Color secondary = Color(0xFF7C3AED);

  // ── Score ──────────────────────────────────────────────────────────────────
  static const Color scoreGood = Color(0xFF22C55E);
  static const Color scoreWarning = Color(0xFFF59E0B);
  static const Color scoreCritical = Color(0xFFEF4444);

  // ── Trend ──────────────────────────────────────────────────────────────────
  static const Color trendUp = Color(0xFF22C55E);
  static const Color trendDown = Color(0xFFEF4444);
  static const Color trendFlat = Color(0xFF94A3B8);

  // ── Chart series ───────────────────────────────────────────────────────────
  static const Color chartSpend = Color(0xFF3B82F6);
  static const Color chartRoas = Color(0xFF8B5CF6);

  /// Five distinct colours for the donut chart palette
  static const List<Color> chartPalette = [
    Color(0xFF3B82F6), // blue
    Color(0xFF22C55E), // green
    Color(0xFFF59E0B), // amber
    Color(0xFFEF4444), // red
    Color(0xFF8B5CF6), // violet
  ];

  // ── Surfaces ───────────────────────────────────────────────────────────────
  static const Color cardSurface = Color(0xFFF8FAFC);
  static const Color urgentBorder = Color(0xFFEF4444);

  // ── Shimmer ────────────────────────────────────────────────────────────────
  static const Color shimmerBase = Color(0xFFE2E8F0);
  static const Color shimmerHighlight = Color(0xFFF8FAFC);
}
