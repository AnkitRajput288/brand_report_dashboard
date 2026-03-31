import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/constants/app_durations.dart';
import '../../../../core/constants/score_thresholds.dart';
import '../../../../core/theme/app_colors.dart';

/// Animated circular arc that fills from 0 → [score] on first render.
/// The arc colour reflects the health classification via [AppColors].
class AnimatedCircularScore extends StatefulWidget {
  const AnimatedCircularScore({
    super.key,
    required this.score,
    this.size = 160,
  });

  final int score;
  final double size;

  @override
  State<AnimatedCircularScore> createState() => _AnimatedCircularScoreState();
}

class _AnimatedCircularScoreState extends State<AnimatedCircularScore>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.medium * 2,
    );
    _progress = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _scoreColor(int score) {
    if (score >= ScoreThresholds.good) return AppColors.scoreGood;
    if (score >= ScoreThresholds.needsAttention) return AppColors.scoreWarning;
    return AppColors.scoreCritical;
  }

  String _scoreLabel(int score) {
    if (score >= ScoreThresholds.good) return 'Good';
    if (score >= ScoreThresholds.needsAttention) return 'Needs Attention';
    return 'Critical';
  }

  @override
  Widget build(BuildContext context) {
    final color = _scoreColor(widget.score);
    final label = _scoreLabel(widget.score);

    return AnimatedBuilder(
      animation: _progress,
      builder: (context, _) {
        final animatedScore = (widget.score * _progress.value).round();
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _ScoreArcPainter(
                  progress: _progress.value,
                  color: color,
                  trackColor:
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$animatedScore',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                  ),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ScoreArcPainter extends CustomPainter {
  const _ScoreArcPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
  });

  final double progress;
  final Color color;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 12.0;
    const startAngle = -math.pi * 0.75;
    const totalSweep = math.pi * 1.5;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide / 2) - strokeWidth / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // Track
    canvas.drawArc(
      rect,
      startAngle,
      totalSweep,
      false,
      Paint()
        ..color = trackColor
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    // Progress arc
    canvas.drawArc(
      rect,
      startAngle,
      totalSweep * progress,
      false,
      Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_ScoreArcPainter old) =>
      old.progress != progress || old.color != color;
}
