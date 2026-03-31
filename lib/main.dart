import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_scaffold_messenger.dart';
import 'features/brand_report/providers/brand_report_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: EvernineApp(),
    ),
  );
}

/// Root application widget.
class EvernineApp extends ConsumerWidget {
  const EvernineApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Evernine Brands — Brand Report',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ref.watch(themeModeProvider),
      routerConfig: appRouter,
    );
  }
}
