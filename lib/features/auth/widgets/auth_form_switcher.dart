import 'package:flutter/material.dart';
import 'package:nova_auth_ui/core/themes/theme.dart';
import 'auth_text_field.dart';
import 'auth_button.dart';
import 'social_button.dart';

enum AuthMode { login, signup }

class AuthFormSwitcher extends StatefulWidget {
  const AuthFormSwitcher({super.key});

  @override
  State<AuthFormSwitcher> createState() => _AuthFormSwitcherState();
}

class _AuthFormSwitcherState extends State<AuthFormSwitcher> with SingleTickerProviderStateMixin {
  AuthMode _authMode = AuthMode.login;
  bool _isLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppTheme.durationMedium,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _toggleAuthMode() {
    setState(() {
      _authMode = _authMode == AuthMode.login ? AuthMode.signup : AuthMode.login;
      _animationController.reset();
      _animationController.forward();
    });
  }

  void _handleSubmit() {
    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void _handleSocialLogin(String provider) {
    // Handle social login
    print('Social login with $provider');
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              _authMode == AuthMode.login ? 'Welcome back' : 'Create account',
              style: AppTheme.getTextTheme().headlineLarge?.copyWith(
                    fontSize: 28,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              _authMode == AuthMode.login
                  ? 'Sign in to continue to Nova'
                  : 'Start your journey with Nova',
              style: AppTheme.getTextTheme().bodyMedium,
            ),

            const SizedBox(height: 32),

            // Form
            if (_authMode == AuthMode.signup) ...[
              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      label: 'First name',
                      hint: 'John',
                      controller: _firstNameController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AuthTextField(
                      label: 'Last name',
                      hint: 'Doe',
                      controller: _lastNameController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],

            AuthTextField(
              label: _authMode == AuthMode.login ? 'Email or username' : 'Email',
              hint: _authMode == AuthMode.login ? 'you@example.com' : 'you@example.com',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 20),

            AuthTextField(
              label: 'Password',
              hint: '••••••••',
              isPassword: true,
              controller: _passwordController,
            ),

            if (_authMode == AuthMode.signup) ...[
              const SizedBox(height: 20),
              AuthTextField(
                label: 'Confirm password',
                hint: '••••••••',
                isPassword: true,
                controller: _confirmPasswordController,
              ),
            ],

            if (_authMode == AuthMode.login) ...[
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Forgot password?',
                    style: AppTheme.getTextTheme().bodyMedium?.copyWith(
                          color: AppTheme.primaryPurple,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 28),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: AuthButton(
                text: _authMode == AuthMode.login ? 'Sign in' : 'Create account',
                onPressed: _handleSubmit,
                isLoading: _isLoading,
              ),
            ),

            const SizedBox(height: 28),

            // Divider
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppTheme.borderGray.withOpacity(0.5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'OR',
                    style: AppTheme.getTextTheme().bodyMedium?.copyWith(
                          fontSize: 12,
                        ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: AppTheme.borderGray.withOpacity(0.5),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Social buttons
            SocialButton(
              text: 'Continue with Google',
              iconPath: 'google',
              onPressed: () => _handleSocialLogin('google'),
            ),

            const SizedBox(height: 12),

            SocialButton(
              text: 'Continue with GitHub',
              iconPath: 'github',
              onPressed: () => _handleSocialLogin('github'),
            ),

            const SizedBox(height: 28),

            // Switch mode
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _authMode == AuthMode.login ? 'New here?' : 'Already have an account?',
                    style: AppTheme.getTextTheme().bodyMedium,
                  ),
                  const SizedBox(width: 6),
                  TextButton(
                    onPressed: _toggleAuthMode,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      _authMode == AuthMode.login ? 'Create account' : 'Sign in',
                      style: AppTheme.getTextTheme().bodyMedium?.copyWith(
                            color: AppTheme.primaryPurple,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
