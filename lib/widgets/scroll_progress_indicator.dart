import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class ScrollProgressIndicator extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollProgressIndicator({super.key, required this.scrollController});

  @override
  State<ScrollProgressIndicator> createState() =>
      _ScrollProgressIndicatorState();
}

class _ScrollProgressIndicatorState extends State<ScrollProgressIndicator> {
  late final ValueNotifier<double> _progressNotifier;

  @override
  void initState() {
    super.initState();
    _progressNotifier = ValueNotifier<double>(0.0);
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) return;
    final maxExtent = widget.scrollController.position.maxScrollExtent;
    if (maxExtent > 0) {
      final currentOffset = widget.scrollController.offset;
      final newProgress = (currentOffset / maxExtent).clamp(0.0, 1.0);
      if ((newProgress - _progressNotifier.value).abs() > 0.001) {
        _progressNotifier.value = newProgress;
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    _progressNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 4,
      height: double.infinity,
      child: ValueListenableBuilder<double>(
        valueListenable: _progressNotifier,
        builder: (context, progress, child) {
          return Align(
            alignment: Alignment.topCenter,
            child: FractionallySizedBox(
              heightFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.primaryBlue,
                      AppTheme.secondaryPurple,
                      AppTheme.accentCyan,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryBlue.withValues(alpha: 0.6),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: AppTheme.secondaryPurple.withValues(alpha: 0.4),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TopScrollProgressBar extends StatefulWidget {
  final ScrollController scrollController;

  const TopScrollProgressBar({super.key, required this.scrollController});

  @override
  State<TopScrollProgressBar> createState() => _TopScrollProgressBarState();
}

class _TopScrollProgressBarState extends State<TopScrollProgressBar> {
  late final ValueNotifier<double> _progressNotifier;

  @override
  void initState() {
    super.initState();
    _progressNotifier = ValueNotifier<double>(0.0);
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) return;
    final maxExtent = widget.scrollController.position.maxScrollExtent;
    if (maxExtent > 0) {
      final currentOffset = widget.scrollController.offset;
      final newProgress = (currentOffset / maxExtent).clamp(0.0, 1.0);
      if ((newProgress - _progressNotifier.value).abs() > 0.001) {
        _progressNotifier.value = newProgress;
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    _progressNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3,
      width: double.infinity,
      child: ValueListenableBuilder<double>(
        valueListenable: _progressNotifier,
        builder: (context, progress, child) {
          return Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.primaryBlue,
                      AppTheme.secondaryPurple,
                      AppTheme.accentCyan,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryBlue.withValues(alpha: 0.8),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
