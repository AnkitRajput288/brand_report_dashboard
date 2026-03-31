import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_card.dart';

/// Generic widget that handles all three [AsyncValue] states.
///
/// - Loading → renders [loading] (defaults to CircularProgressIndicator)
/// - Error   → renders [ErrorCard] with optional retry callback
/// - Data    → renders [data] builder result
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading,
    this.onRetry,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final Widget? loading;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () =>
          loading ?? const Center(child: CircularProgressIndicator()),
      error: (error, _) => ErrorCard(
        message: error.toString(),
        onRetry: onRetry,
      ),
      data: data,
    );
  }
}
