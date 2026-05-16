import 'package:flutter/material.dart';
import 'package:nova_auth_ui/core/themes/theme.dart';

class AuthButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isLoading;
  final IconData? icon;
  
  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.isLoading = false,
    this.icon,
  });
  
  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  bool _isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: AppTheme.durationFast,
        decoration: BoxDecoration(
          borderRadius: AppTheme.radiusMedium,
          gradient: widget.isPrimary
              ? LinearGradient(
                  colors: [
                    AppTheme.primaryPurple,
                    AppTheme.deepPurple,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          border: !widget.isPrimary
              ? Border.all(
                  color: AppTheme.borderGray,
                  width: 1.5,
                )
              : null,
          boxShadow: widget.isPrimary && _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primaryPurple.withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.isLoading ? null : widget.onPressed,
            borderRadius: AppTheme.radiusMedium,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: widget.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppTheme.softWhite,
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.icon != null) ...[
                          Icon(
                            widget.icon,
                            color: widget.isPrimary
                                ? AppTheme.softWhite
                                : AppTheme.mutedGray,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          widget.text,
                          style: AppTheme.getTextTheme().labelLarge?.copyWith(
                                color: widget.isPrimary
                                    ? AppTheme.softWhite
                                    : AppTheme.mutedGray,
                              ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}