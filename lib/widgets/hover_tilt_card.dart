import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class HoverTiltCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const HoverTiltCard({super.key, required this.child, this.onTap});

  @override
  State<HoverTiltCard> createState() => _HoverTiltCardState();
}

class _HoverTiltCardState extends State<HoverTiltCard> {
  bool _isHovered = false;
  double _rotateX = 0;
  double _rotateY = 0;

  void _onHover(PointerEvent event, Size size) {
    if (size.width == 0 || size.height == 0) return;
    final dx = (event.localPosition.dx - size.width / 2) / (size.width / 2);
    final dy = (event.localPosition.dy - size.height / 2) / (size.height / 2);

    setState(() {
      _rotateX = -dy * 0.05;
      _rotateY = dx * 0.05;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() {
            _isHovered = false;
            _rotateX = 0;
            _rotateY = 0;
          }),
          onHover: (event) => _onHover(event, size),
          child: GestureDetector(
            onTap: widget.onTap,
            child: RepaintBoundary(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(_rotateX)
                  ..rotateY(_rotateY)
                  ..scale(_isHovered ? 1.02 : 1.0),
                transformAlignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: AppTheme.primaryBlue.withValues(alpha: 0.25),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                          BoxShadow(
                            color: AppTheme.secondaryPurple.withValues(
                              alpha: 0.15,
                            ),
                            blurRadius: 30,
                            spreadRadius: 4,
                          ),
                        ]
                      : [],
                ),
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
}
