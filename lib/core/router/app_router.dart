import 'package:go_router/go_router.dart';

import '../../features/brand_report/presentation/screens/brand_report_screen.dart';

/// Application router — single route "/" for the dashboard.
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BrandReportScreen(),
    ),
  ],
);
