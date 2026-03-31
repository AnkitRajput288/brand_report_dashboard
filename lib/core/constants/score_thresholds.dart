/// Score thresholds for Brand Health Score classification.
/// Use these constants — never magic numbers — in business logic.
class ScoreThresholds {
  ScoreThresholds._();

  /// Scores >= [good] are classified as "Good"
  static const int good = 70;

  /// Scores >= [needsAttention] (and < [good]) are "Needs Attention"
  static const int needsAttention = 40;

  /// Scores < [needsAttention] are "Critical"
}
