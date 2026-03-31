import 'package:flutter/material.dart';

/// Text style helpers.
/// All styles delegate to Theme.of(context).textTheme to respect theming.
/// This file exists as a documentation layer — use textTheme slots directly.
class AppTextStyles {
  AppTextStyles._();

  /// Returns the muted/secondary text colour for the given context.
  static Color mutedColor(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6);
}
