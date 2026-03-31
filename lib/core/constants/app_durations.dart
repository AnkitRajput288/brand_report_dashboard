/// Animation duration constants used throughout the app.
class AppDurations {
  AppDurations._();

  /// 200ms — fast micro-interactions
  static const Duration fast = Duration(milliseconds: 200);

  /// 400ms — standard transitions
  static const Duration medium = Duration(milliseconds: 400);

  /// 800ms — slow emphasis animations (e.g. score arc)
  static const Duration slow = Duration(milliseconds: 800);
}
