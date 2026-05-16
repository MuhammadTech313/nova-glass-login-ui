import 'package:flutter/material.dart';
import 'package:nova_auth_ui/core/themes/theme.dart';
import '../widgets/animated_background.dart';
import '../widgets/glass_card.dart';
import '../widgets/hero_section.dart';
import '../widgets/auth_form_switcher.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;

    return Scaffold(
      backgroundColor: AppTheme.deepBlack,
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Animated background
              const Positioned.fill(
                child: AnimatedBackground(),
              ),

              // Content
              SafeArea(
                child: isDesktop ? _buildDesktopLayout(context) : _buildMobileLayout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        // Left side - Hero section
        const Expanded(
          flex: 5,
          child: HeroSection(),
        ),

        // Right side - Auth card
        Expanded(
          flex: 4,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 48,
                vertical: 40,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: const GlassCard(
                  padding: EdgeInsets.all(40),
                  showGlow: true,
                  child: AuthFormSwitcher(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          // Hero section - condensed
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 40,
            ),
            child: HeroSection(),
          ),

          SizedBox(height: 20),

          // Auth card
          Padding(
            padding: const EdgeInsets.all(24),
            child: GlassCard(
              padding: const EdgeInsets.all(32),
              showGlow: true,
              child: const AuthFormSwitcher(),
            ),
          ),

          SizedBox(height: 40),
        ],
      ),
    );
  }
}
