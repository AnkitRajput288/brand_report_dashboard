import 'package:connectivity_plus/connectivity_plus.dart';

/// Throws an [Exception] if there is no internet connection.
Future<void> checkInternetConnectivity() async {
  final results = await Connectivity().checkConnectivity();
  final hasConnection = results.any(
    (r) => r != ConnectivityResult.none,
  );
  if (!hasConnection) {
    throw Exception(
      'No internet connection. Please check your network and try again.',
    );
  }
}
