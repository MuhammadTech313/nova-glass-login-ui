import 'package:flutter/material.dart';
import 'package:nova_auth_ui/core/themes/theme.dart';

class SocialButton extends StatefulWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
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
          border: Border.all(
            color: _isHovered ? AppTheme.borderGray.withOpacity(0.8) : AppTheme.subtleBorder,
            width: 1.5,
          ),
          color: _isHovered
              ? AppTheme.surfaceBlack.withOpacity(0.5)
              : AppTheme.surfaceBlack.withOpacity(0.2),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: AppTheme.radiusMedium,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIcon(),
                  const SizedBox(width: 12),
                  Text(
                    widget.text,
                    style: AppTheme.getTextTheme().bodyMedium?.copyWith(
                          color: AppTheme.softWhite,
                          fontWeight: FontWeight.w500,
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

  Widget _buildIcon() {
    String path;

    switch (widget.iconPath) {
      case 'google':
        path = 'assets/icons/google.png';
        break;
      case 'github':
        path = 'assets/icons/github.png';
        break;
      case 'apple':
        path = 'assets/icons/apple.png';
        break;
      default:
        path = 'assets/icons/default.png';
    }

    return Image.asset(
      path,
      width: 18,
      height: 18,
      fit: BoxFit.contain,
    );
  }
}
