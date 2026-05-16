import 'package:flutter/material.dart';
import 'package:nova_auth_ui/core/themes/theme.dart';


class AuthTextField extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  
  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.controller,
    this.keyboardType,
    this.validator,
  });
  
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscureText = true;
  bool _isFocused = false;
  
  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTheme.getTextTheme().bodyMedium?.copyWith(
                color: AppTheme.softWhite,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 8),
        Focus(
          onFocusChange: (focused) {
            setState(() {
              _isFocused = focused;
            });
          },
          child: AnimatedContainer(
            duration: AppTheme.durationFast,
            decoration: BoxDecoration(
              borderRadius: AppTheme.radiusMedium,
              border: Border.all(
                color: _isFocused
                    ? AppTheme.primaryPurple.withOpacity(0.5)
                    : AppTheme.borderGray,
                width: 1.5,
              ),
              boxShadow: _isFocused
                  ? [
                      BoxShadow(
                        color: AppTheme.primaryPurple.withOpacity(0.15),
                        blurRadius: 12,
                        spreadRadius: 0,
                      ),
                    ]
                  : null,
            ),
            child: TextFormField(
              controller: widget.controller,
              obscureText: _obscureText,
              keyboardType: widget.keyboardType,
              validator: widget.validator,
              style: AppTheme.getTextTheme().bodyMedium?.copyWith(
                    color: AppTheme.softWhite,
                    fontSize: 15,
                  ),
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: AppTheme.getTextTheme().bodyMedium?.copyWith(
                      color: AppTheme.mutedGray.withOpacity(0.5),
                    ),
                filled: true,
                fillColor: AppTheme.surfaceBlack.withOpacity(0.4),
                border: OutlineInputBorder(
                  borderRadius: AppTheme.radiusMedium,
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppTheme.mutedGray,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}