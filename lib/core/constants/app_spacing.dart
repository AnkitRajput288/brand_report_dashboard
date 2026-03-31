/// Spacing scale constants used throughout the app.
/// Use these instead of raw numeric values for consistent layout.
class AppSpacing {
  AppSpacing._();

  /// 4dp — extra small gap
  static const double xs = 4.0;

  /// 8dp — small gap
  static const double sm = 8.0;

  /// 16dp — medium gap (default section padding)
  static const double md = 16.0;

  /// 24dp — large gap
  static const double lg = 24.0;

  /// 32dp — extra large gap
  static const double xl = 32.0;

  // Border radii
  /// 8dp corner radius
  static const double radiusSm = 8.0;

  /// 12dp corner radius
  static const double radiusMd = 12.0;

  /// 16dp corner radius
  static const double radiusLg = 16.0;

  /// Tablet/web breakpoint in logical pixels
  static const double kTabletBreakpoint = 768.0;

  /// Fixed width of a zone card in the mobile horizontal scroll layout
  static const double kZoneCardWidth = 160.0;

  /// Fixed height of a zone card in the tablet/web grid layout.
  /// Uses mainAxisExtent so height never shrinks as the viewport narrows.
  static const double kZoneCardGridHeight = 170.0;
}
