# Brand Report Dashboard

A cross-platform Flutter application — **Evernine Brands AI Marketing OS Dashboard** — that visualizes brand health, marketing zone performance, spend vs. ROAS trends, channel mix distribution, and AI-generated insights.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
- [Running the App](#running-the-app)
- [Testing](#testing)
- [Code Generation](#code-generation)
- [Scenario Switching](#scenario-switching)
- [Responsive Design](#responsive-design)

---

## Overview

This dashboard provides a unified view of brand marketing performance across multiple zones. It is built with clean architecture principles, separating data, domain, and presentation layers. State management is handled by Riverpod with `AsyncNotifier` for full loading/error/data lifecycle support.

---

## Features

| Feature | Description |
|---|---|
| **Brand Health Score** | Animated circular score with color-coded classification (Good / Needs Attention / Critical) |
| **Zone Performance** | 5 marketing zones (Paid Ads, SEO, Social Media, Marketplace, Messaging) displayed in a scrollable/grid layout with trend indicators |
| **Zone Detail Sheet** | Draggable bottom sheet with per-zone metrics, sparklines, and insights |
| **Spend vs ROAS Chart** | 8-week dual-axis line chart — Spend (₹) on left, ROAS (x) on right |
| **Channel Mix Donut Chart** | Interactive donut chart; tap a segment to highlight and display its share |
| **AI Insights Feed** | Scrollable list of actionable insights typed as Alert, Opportunity, or FYI; urgent items are highlighted |
| **Theme Toggle** | Light / Dark mode switch in the app bar |
| **Pull-to-Refresh** | Manual data refresh via app bar action |
| **Scenario Switcher** | Dropdown to switch between Good, Needs Attention, and Critical health scenarios for demo/testing |
| **Responsive Layout** | Stacked single-column on mobile; side-by-side charts and grid zones on tablet (≥ 768 px) |
| **Shimmer Loading** | Skeleton placeholders while data is loading |
| **Error Handling** | Error card with retry action for failed data fetches |

---

## Tech Stack

| Category | Package | Version |
|---|---|---|
| Framework | Flutter | stable |
| Language | Dart | ^3.5.0 |
| State Management | flutter_riverpod / riverpod_annotation | 2.5.1 |
| Code Generation | freezed / json_serializable / riverpod_generator | latest |
| Charts | fl_chart | 0.68.0 |
| Navigation | go_router | 14.2.0 |
| Networking | connectivity_plus | latest |
| Image Loading | cached_network_image + shimmer | latest |
| Formatting | intl | latest |
| Logging | logger | latest |
| Testing | flutter_test + mocktail | latest |

---

## Project Structure

```
lib/
├── main.dart                          # App entry point (ProviderScope)
│
├── core/                              # Shared infrastructure
│   ├── constants/
│   │   ├── app_durations.dart         # Animation timing constants
│   │   ├── app_spacing.dart           # Spacing scale & breakpoints
│   │   └── score_thresholds.dart      # Health score classification thresholds
│   ├── router/
│   │   └── app_router.dart            # GoRouter configuration (single "/" route)
│   ├── theme/
│   │   ├── app_colors.dart            # Color tokens (scores, charts, shimmer)
│   │   └── app_theme.dart             # Material 3 light & dark themes
│   ├── utils/
│   │   ├── app_logger.dart            # Logger singleton
│   │   ├── internet_check.dart        # Connectivity utility
│   │   └── number_formatter.dart      # Currency, ROAS, percentage formatters
│   └── widgets/
│       ├── async_value_widget.dart    # Generic async state handler widget
│       ├── error_card.dart            # Error UI with retry callback
│       ├── section_header.dart        # Reusable section title
│       └── shimmer_box.dart           # Loading skeleton block
│
├── data/                              # Data layer
│   ├── models/
│   │   ├── brand_report.dart          # Root model: health score, zones, charts, insights
│   │   ├── channel_mix_model.dart     # Channel name + percentage
│   │   ├── insight_model.dart         # AI insight: type, urgency, headline, body
│   │   ├── metric_model.dart          # Labelled metric with trend (changePct)
│   │   └── zone_model.dart            # Marketing zone with metrics & sparkline
│   └── repositories/
│       ├── brand_report_repository.dart            # Abstract interface
│       ├── brand_report_repository_provider.dart   # Riverpod provider binding
│       └── fake_brand_report_repository.dart       # Mock implementation (500ms simulated delay)
│
├── features/
│   ├── brand_report/                  # Main dashboard feature
│   │   ├── providers/
│   │   │   └── brand_report_provider.dart  # AsyncNotifier + theme/scenario providers
│   │   └── presentation/
│   │       ├── screens/
│   │       │   └── brand_report_screen.dart
│   │       └── widgets/
│   │           ├── ai_insights_feed.dart
│   │           ├── animated_circular_score.dart
│   │           ├── brand_health_card.dart
│   │           ├── channel_mix_chart.dart
│   │           ├── dashboard_shimmer.dart
│   │           ├── insight_card.dart
│   │           ├── spend_roas_chart.dart
│   │           ├── zone_card.dart
│   │           └── zone_performance_row.dart
│   │
│   └── zone_detail/                   # Zone detail bottom sheet feature
│       ├── providers/
│       │   └── zone_detail_provider.dart
│       └── presentation/
│           └── widgets/
│               ├── zone_detail_sheet.dart
│               ├── zone_insight_card.dart
│               ├── zone_metric_grid.dart
│               └── zone_sparkline.dart
│
test/
├── data/repositories/
│   └── fake_brand_report_repository_test.dart
└── features/brand_report/providers/
    └── brand_report_provider_test.dart
```

---

## Architecture

The project follows a **layered clean architecture**:

```
Presentation (Widgets / Screens)
        ↓
   Providers (Riverpod AsyncNotifier)
        ↓
   Repository Interface (abstract)
        ↓
   Repository Implementation (Fake / Real)
        ↓
   Data Models (Freezed immutable)
```

- **Models** are immutable value objects generated with `freezed` and serialized with `json_serializable`.
- **Repositories** are defined as abstract classes and injected via Riverpod providers, making it easy to swap the fake implementation for a real API.
- **Providers** manage the full async lifecycle (loading → data / error) using `AsyncNotifier`.
- **Widgets** are purely presentational and observe only the state they need.

### Health Score Thresholds

| Score | Status |
|---|---|
| >= 70 | Good |
| 40 - 69 | Needs Attention |
| < 40 | Critical |

---

## Getting Started

### Prerequisites

- Flutter SDK (stable channel) — [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK >= 3.5.0 (bundled with Flutter)

### Install Dependencies

```bash
flutter pub get
```

---

## Running the App

```bash
# Mobile (connected device or emulator)
flutter run

# Web
flutter run -d chrome

# Specific device
flutter run -d <device-id>
```

---

## Testing

```bash
# Run all tests
flutter test

# Run a specific test file
flutter test test/features/brand_report/providers/brand_report_provider_test.dart
```

Tests cover:

- `FakeBrandReportRepository`: validates mock data shape — 5 zones, 8-week arrays, channel mix summing to 100%.
- `BrandReportNotifier`: verifies `AsyncLoading -> AsyncData` lifecycle and refresh behavior.

---

## Code Generation

Models and providers use build_runner for code generation. Re-run after modifying any `@freezed`, `@JsonSerializable`, or `@riverpod` annotated file:

```bash
dart run build_runner build --delete-conflicting-outputs
```

For continuous generation during development:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

---

## Scenario Switching

The app ships with three built-in health scenarios for demo and testing purposes, selectable from the app bar dropdown:

| Scenario | Health Score |
|---|---|
| Good | 74 |
| Needs Attention | 55 |
| Critical | 28 |

Switching a scenario triggers an immediate data refresh without any network call.

---

## Responsive Design

| Breakpoint | Layout |
|---|---|
| < 768 px (mobile) | Stacked single-column; zones in horizontal scroll |
| >= 768 px (tablet) | Side-by-side charts; zones in a grid |

Breakpoints and spacing values are centralized in `lib/core/constants/app_spacing.dart`.
