import 'package:flutter/material.dart';

/// Global key for the root [ScaffoldMessenger].
/// Use this to show snackbars from anywhere — including inside overlays
/// such as modal bottom sheets — so they always appear above all layers.
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
