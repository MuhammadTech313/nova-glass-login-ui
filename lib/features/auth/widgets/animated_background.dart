import 'package:flutter/material.dart';
import 'package:nova_auth_ui/core/themes/theme.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      3,
      (index) => AnimationController(
        duration: Duration(seconds: 8 + index * 2),
        vsync: this,
      )..repeat(reverse: true),
    );

    _animations = _controllers
        .map((controller) => Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: controller, curve: Curves.easeInOut),
            ))
        .toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple orb
        AnimatedBuilder(
          animation: _animations[0],
          builder: (context, child) {
            return Positioned(
              left: -100 + (_animations[0].value * 150),
              top: 100 + (_animations[0].value * 200),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.primaryPurple.withOpacity(0.15),
                      AppTheme.primaryPurple.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // Emerald orb
        AnimatedBuilder(
          animation: _animations[1],
          builder: (context, child) {
            return Positioned(
              right: -150 + (_animations[1].value * 100),
              top: 200 + (_animations[1].value * 150),
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.emeraldAccent.withOpacity(0.12),
                      AppTheme.emeraldAccent.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // Third accent orb
        AnimatedBuilder(
          animation: _animations[2],
          builder: (context, child) {
            return Positioned(
              left: 100 + (_animations[2].value * 100),
              bottom: -100 + (_animations[2].value * 150),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.purpleGlow.withOpacity(0.1),
                      AppTheme.purpleGlow.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // Grid overlay
        CustomPaint(
          painter: GridPainter(),
          size: Size.infinite,
        ),
      ],
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.borderGray.withOpacity(0.03)
      ..strokeWidth = 1;

    const spacing = 80.0;

    // Vertical lines
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Horizontal lines
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
