import 'dart:convert';

import '../../core/utils/app_logger.dart';
import '../../core/utils/internet_check.dart';
import '../models/brand_report.dart';
import 'brand_report_repository.dart';

/// Which mock brand health scenario the fake repository should return.
enum BrandHealthScenario { good, needsAttention, critical }

/// In-memory implementation of [BrandReportRepository].
/// Simulates a 500ms network delay to demonstrate async state handling.
class FakeBrandReportRepository implements BrandReportRepository {
  FakeBrandReportRepository({
    this.scenario = BrandHealthScenario.good,
    Future<void> Function()? connectivityCheck,
  }) : _connectivityCheck = connectivityCheck ?? checkInternetConnectivity;

  final BrandHealthScenario scenario;
  final Future<void> Function() _connectivityCheck;
  bool simulateError = false;

  @override
  Future<BrandReport> fetchBrandReport() async {
    AppLogger.d('FakeBrandReportRepository: fetching brand report');
    await Future<void>.delayed(const Duration(milliseconds: 500));

    if (simulateError) {
      throw Exception('Simulated error from FakeBrandReportRepository');
    }

    await _connectivityCheck();

    final json = switch (scenario) {
      BrandHealthScenario.good => _mockReportGoodJson,
      BrandHealthScenario.needsAttention => _mockReportNeedsAttentionJson,
      BrandHealthScenario.critical => _mockReportCriticalJson,
    };

    AppLogger.i('FakeBrandReportRepository: returning mock data ($scenario)');
    return BrandReport.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  static const String _mockReportNeedsAttentionJson = '''
{
  "brandHealthScore": 55,
  "zones": [
    {
      "id": "paid_ads",
      "name": "Paid Ads",
      "primaryMetric": {"label": "ROAS", "value": 2.4, "changePct": -6.2},
      "metrics": [
        {"label": "Spend", "value": 160000.0, "changePct": -3.1},
        {"label": "ROAS", "value": 2.4, "changePct": -6.2},
        {"label": "CTR", "value": 2.1, "changePct": -1.8},
        {"label": "Impressions", "value": 1800000.0, "changePct": -4.5},
        {"label": "CAC", "value": 480.0, "changePct": 8.2}
      ],
      "weeklyTrend": [2.9, 2.7, 2.5, 2.4]
    },
    {
      "id": "seo",
      "name": "SEO",
      "primaryMetric": {"label": "DA", "value": 28.0, "changePct": -0.5},
      "metrics": [
        {"label": "Domain Authority", "value": 28.0, "changePct": -0.5},
        {"label": "Organic Traffic", "value": 22000.0, "changePct": -5.1},
        {"label": "Backlinks", "value": 940.0, "changePct": -2.3},
        {"label": "Avg Rank", "value": 24.6, "changePct": 3.1}
      ],
      "weeklyTrend": [30.0, 29.0, 29.0, 28.0]
    },
    {
      "id": "social_media",
      "name": "Social Media",
      "primaryMetric": {"label": "Eng. Rate", "value": 2.8, "changePct": -3.2},
      "metrics": [
        {"label": "Followers", "value": 94200.0, "changePct": -0.4},
        {"label": "Eng. Rate", "value": 2.8, "changePct": -3.2},
        {"label": "Reach", "value": 195000.0, "changePct": -6.8},
        {"label": "Saves", "value": 2100.0, "changePct": -1.5}
      ],
      "weeklyTrend": [3.4, 3.1, 2.9, 2.8]
    },
    {
      "id": "marketplace",
      "name": "Marketplace",
      "primaryMetric": {"label": "Conv Rate", "value": 1.8, "changePct": -4.5},
      "metrics": [
        {"label": "GMV", "value": 1900000.0, "changePct": -7.2},
        {"label": "Conv Rate", "value": 1.8, "changePct": -4.5},
        {"label": "Returns", "value": 7.1, "changePct": 2.4},
        {"label": "Avg Order Size", "value": 1240.0, "changePct": -2.1}
      ],
      "weeklyTrend": [2.3, 2.1, 1.9, 1.8]
    },
    {
      "id": "messaging",
      "name": "Messaging",
      "primaryMetric": {"label": "Open Rate", "value": 28.4, "changePct": -3.8},
      "metrics": [
        {"label": "Open Rate", "value": 28.4, "changePct": -3.8},
        {"label": "CTR", "value": 3.2, "changePct": -2.1},
        {"label": "Unsubscribes", "value": 1.2, "changePct": 0.6},
        {"label": "Sent", "value": 61000.0, "changePct": -1.4}
      ],
      "weeklyTrend": [31.5, 30.2, 29.1, 28.4]
    }
  ],
  "weeklySpend": [180000.0, 172000.0, 165000.0, 158000.0, 162000.0, 155000.0, 150000.0, 160000.0],
  "weeklyRoas": [3.1, 2.9, 2.8, 2.7, 2.6, 2.5, 2.4, 2.4],
  "insights": [
    {
      "id": "ins_001",
      "type": "alert",
      "isUrgent": true,
      "headline": "ROAS declining for 4 consecutive weeks",
      "body": "Paid Ads ROAS has dropped from 2.9 to 2.4 over the past month. Creative fatigue and rising CPMs are the likely causes. Refresh ad creatives and test new audience segments to reverse the trend.",
      "zoneId": "paid_ads"
    },
    {
      "id": "ins_002",
      "type": "alert",
      "isUrgent": true,
      "headline": "Marketplace conversion rate below category average",
      "body": "Your 1.8% conversion rate is 1.4\u00d7 below the category benchmark of 2.5%. Product listing quality scores have dropped \u2014 updating images and A+ content could recover 0.4\u20130.6 conversion points.",
      "zoneId": "marketplace"
    },
    {
      "id": "ins_003",
      "type": "opportunity",
      "isUrgent": false,
      "headline": "Email open rates recoverable with subject-line testing",
      "body": "Open rates have declined 3.8% this period. A/B testing personalised subject lines has shown 18\u201325% improvement in comparable accounts. Start with your top 20% engaged segment.",
      "zoneId": "messaging"
    }
  ],
  "channelMix": {
    "segments": {
      "Paid Social": 35,
      "Marketplace": 24,
      "Influencer": 10,
      "SEO": 20,
      "Others": 11
    }
  }
}
''';

  static const String _mockReportCriticalJson = '''
{
  "brandHealthScore": 28,
  "zones": [
    {
      "id": "paid_ads",
      "name": "Paid Ads",
      "primaryMetric": {"label": "ROAS", "value": 1.1, "changePct": -18.5},
      "metrics": [
        {"label": "Spend", "value": 95000.0, "changePct": -12.4},
        {"label": "ROAS", "value": 1.1, "changePct": -18.5},
        {"label": "CTR", "value": 0.9, "changePct": -5.3},
        {"label": "Impressions", "value": 820000.0, "changePct": -21.0},
        {"label": "CAC", "value": 890.0, "changePct": 24.6}
      ],
      "weeklyTrend": [2.1, 1.7, 1.3, 1.1]
    },
    {
      "id": "seo",
      "name": "SEO",
      "primaryMetric": {"label": "DA", "value": 18.0, "changePct": -4.2},
      "metrics": [
        {"label": "Domain Authority", "value": 18.0, "changePct": -4.2},
        {"label": "Organic Traffic", "value": 8400.0, "changePct": -18.7},
        {"label": "Backlinks", "value": 310.0, "changePct": -9.4},
        {"label": "Avg Rank", "value": 42.3, "changePct": 11.8}
      ],
      "weeklyTrend": [22.0, 20.0, 19.0, 18.0]
    },
    {
      "id": "social_media",
      "name": "Social Media",
      "primaryMetric": {"label": "Eng. Rate", "value": 0.9, "changePct": -7.8},
      "metrics": [
        {"label": "Followers", "value": 41000.0, "changePct": -2.1},
        {"label": "Eng. Rate", "value": 0.9, "changePct": -7.8},
        {"label": "Reach", "value": 58000.0, "changePct": -14.2},
        {"label": "Saves", "value": 420.0, "changePct": -9.6}
      ],
      "weeklyTrend": [1.8, 1.4, 1.1, 0.9]
    },
    {
      "id": "marketplace",
      "name": "Marketplace",
      "primaryMetric": {"label": "Conv Rate", "value": 0.7, "changePct": -14.6},
      "metrics": [
        {"label": "GMV", "value": 480000.0, "changePct": -29.3},
        {"label": "Conv Rate", "value": 0.7, "changePct": -14.6},
        {"label": "Returns", "value": 14.8, "changePct": 7.2},
        {"label": "Avg Order Size", "value": 860.0, "changePct": -8.4}
      ],
      "weeklyTrend": [1.4, 1.1, 0.9, 0.7]
    },
    {
      "id": "messaging",
      "name": "Messaging",
      "primaryMetric": {"label": "Open Rate", "value": 11.2, "changePct": -12.4},
      "metrics": [
        {"label": "Open Rate", "value": 11.2, "changePct": -12.4},
        {"label": "CTR", "value": 0.8, "changePct": -6.3},
        {"label": "Unsubscribes", "value": 3.6, "changePct": 2.8},
        {"label": "Sent", "value": 34000.0, "changePct": -8.1}
      ],
      "weeklyTrend": [16.4, 14.1, 12.3, 11.2]
    }
  ],
  "weeklySpend": [140000.0, 128000.0, 115000.0, 104000.0, 98000.0, 96000.0, 93000.0, 95000.0],
  "weeklyRoas": [2.1, 1.8, 1.6, 1.4, 1.3, 1.2, 1.1, 1.1],
  "insights": [
    {
      "id": "ins_001",
      "type": "alert",
      "isUrgent": true,
      "headline": "ROAS near break-even \u2014 pause spend immediately",
      "body": "At 1.1\u00d7 ROAS, Paid Ads spend is barely covering cost of goods. Continuing at current spend levels is eroding margin. Pause all non-performing ad sets and reallocate to organic and retention channels until ROAS exceeds 2.0.",
      "zoneId": "paid_ads"
    },
    {
      "id": "ins_002",
      "type": "alert",
      "isUrgent": true,
      "headline": "Marketplace GMV down 29% \u2014 listing suspension risk",
      "body": "GMV has dropped 29% and return rate is at 14.8%, which is approaching the platform\u2019s 15% suspension threshold. Audit your top 10 SKUs for quality issues and engage seller support before the next review cycle.",
      "zoneId": "marketplace"
    },
    {
      "id": "ins_003",
      "type": "alert",
      "isUrgent": true,
      "headline": "Email list health critically low",
      "body": "Unsubscribe rate has risen to 3.6% and open rate has halved in 4 weeks. Sending frequency must be cut by at least 50% immediately. Run a re-permission campaign to salvage the engaged segment before deliverability is permanently damaged.",
      "zoneId": "messaging"
    }
  ],
  "channelMix": {
    "segments": {
      "Paid Social": 22,
      "Marketplace": 38,
      "Influencer": 5,
      "SEO": 28,
      "Others": 7
    }
  }
}
''';

  static const String _mockReportGoodJson = '''
{
  "brandHealthScore": 74,
  "zones": [
    {
      "id": "paid_ads",
      "name": "Paid Ads",
      "primaryMetric": {"label": "ROAS", "value": 4.2, "changePct": 8.3},
      "metrics": [
        {"label": "Spend", "value": 190000.0, "changePct": 5.2},
        {"label": "ROAS", "value": 4.2, "changePct": 8.3},
        {"label": "CTR", "value": 3.8, "changePct": -0.4},
        {"label": "Impressions", "value": 2400000.0, "changePct": 12.1},
        {"label": "CAC", "value": 320.0, "changePct": -3.5}
      ],
      "weeklyTrend": [3.8, 4.1, 3.9, 4.2]
    },
    {
      "id": "seo",
      "name": "SEO",
      "primaryMetric": {"label": "DA", "value": 38.0, "changePct": 2.1},
      "metrics": [
        {"label": "Domain Authority", "value": 38.0, "changePct": 2.1},
        {"label": "Organic Traffic", "value": 45200.0, "changePct": 7.4},
        {"label": "Backlinks", "value": 1840.0, "changePct": 4.8},
        {"label": "Avg Rank", "value": 14.2, "changePct": -1.3}
      ],
      "weeklyTrend": [36.0, 37.0, 37.0, 38.0]
    },
    {
      "id": "social_media",
      "name": "Social Media",
      "primaryMetric": {"label": "Eng. Rate", "value": 5.7, "changePct": -1.4},
      "metrics": [
        {"label": "Followers", "value": 128400.0, "changePct": 0.8},
        {"label": "Eng. Rate", "value": 5.7, "changePct": -1.4},
        {"label": "Reach", "value": 310000.0, "changePct": -2.1},
        {"label": "Saves", "value": 4820.0, "changePct": 3.2}
      ],
      "weeklyTrend": [6.2, 5.9, 5.8, 5.7]
    },
    {
      "id": "marketplace",
      "name": "Marketplace",
      "primaryMetric": {"label": "Conv Rate", "value": 3.1, "changePct": 12.0},
      "metrics": [
        {"label": "GMV", "value": 4200000.0, "changePct": 18.5},
        {"label": "Conv Rate", "value": 3.1, "changePct": 12.0},
        {"label": "Returns", "value": 4.2, "changePct": -0.6},
        {"label": "Avg Order Size", "value": 1840.0, "changePct": 5.3}
      ],
      "weeklyTrend": [2.4, 2.7, 2.9, 3.1]
    },
    {
      "id": "messaging",
      "name": "Messaging",
      "primaryMetric": {"label": "Open Rate", "value": 42.3, "changePct": 0.6},
      "metrics": [
        {"label": "Open Rate", "value": 42.3, "changePct": 0.6},
        {"label": "CTR", "value": 6.8, "changePct": 1.2},
        {"label": "Unsubscribes", "value": 0.4, "changePct": -0.1},
        {"label": "Sent", "value": 84000.0, "changePct": 3.7}
      ],
      "weeklyTrend": [41.5, 41.8, 42.0, 42.3]
    }
  ],
  "weeklySpend": [120000.0, 145000.0, 132000.0, 168000.0, 155000.0, 178000.0, 162000.0, 190000.0],
  "weeklyRoas": [3.8, 4.1, 3.9, 4.4, 4.2, 4.7, 4.3, 4.9],
  "insights": [
    {
      "id": "ins_001",
      "type": "alert",
      "isUrgent": true,
      "headline": "Paid Ads CPM up 22% this week",
      "body": "Increased bid pressure across Meta and Google is driving CPM up 22% week-over-week. Consider shifting budget to programmatic display or reducing top-of-funnel spend until auction pressure normalises.",
      "zoneId": "paid_ads"
    },
    {
      "id": "ins_002",
      "type": "opportunity",
      "isUrgent": false,
      "headline": "SEO gap in branded keywords",
      "body": "Competitor analysis shows a 34% share-of-voice gap for your top 5 branded search terms. Publishing a dedicated landing page and acquiring 20\u201330 contextual backlinks could close this gap in 6 weeks.",
      "zoneId": "seo"
    },
    {
      "id": "ins_003",
      "type": "fyi",
      "isUrgent": false,
      "headline": "Social ER above industry average",
      "body": "Your 5.7% engagement rate benchmarks 1.9\u00d7 above the D2C industry average of 3.0%. Story polls and user-generated content reposts are the primary drivers \u2014 maintain this content mix.",
      "zoneId": "social_media"
    }
  ],
  "channelMix": {
    "segments": {
      "Paid Social": 42,
      "Marketplace": 20,
      "Influencer": 14,
      "SEO": 16,
      "Others": 8
    }
  }
}
''';
}
