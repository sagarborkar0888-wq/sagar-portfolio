import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class BackToTopButton extends StatefulWidget {
  final ScrollController scrollController;

  const BackToTopButton({super.key, required this.scrollController});

  @override
  State<BackToTopButton> createState() => _BackToTopButtonState();
}

class _BackToTopButtonState extends State<BackToTopButton> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) return;
    final show = widget.scrollController.offset > 300;
    if (show != _isVisible) {
      setState(() => _isVisible = show);
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _scrollToTop() {
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton.small(
          heroTag: "back_to_top",
          onPressed: _scrollToTop,
          backgroundColor: AppTheme.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 6,
          tooltip: 'Scroll to top',
          child: const Icon(Icons.arrow_upward_rounded),
        ),
      ),
    );
  }
}
