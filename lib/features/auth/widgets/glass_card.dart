import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nova_auth_ui/core/themes/theme.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final bool showBorder;
  final bool showGlow;
  
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.borderRadius,
    this.showBorder = true,
    this.showGlow = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? AppTheme.radiusLarge,
        boxShadow: showGlow ? AppTheme.cardShadow : [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? AppTheme.radiusLarge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.glassBackground,
              borderRadius: borderRadius ?? AppTheme.radiusLarge,
              border: showBorder
                  ? Border.all(
                      color: AppTheme.glassBorder,
                      width: 1,
                    )
                  : null,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.glassHighlight,
                  Colors.transparent,
                ],
              ),
            ),
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}