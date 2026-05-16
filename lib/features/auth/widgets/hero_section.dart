import 'package:flutter/material.dart';
import 'package:nova_auth_ui/core/themes/theme.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 1200;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 32 : 64,
        vertical: isSmall ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand Icon
                  _buildBrandIcon(),

                  SizedBox(height: isSmall ? 32 : 48),

                  // Main Heading
                  Text(
                    'Nova',
                    style: AppTheme.getTextTheme().displayLarge?.copyWith(
                          fontSize: isSmall ? 48 : 72,
                        ),
                  ),

                  const SizedBox(height: 16),

                  // Tagline
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        AppTheme.purpleGlow,
                        AppTheme.emeraldGlow,
                      ],
                    ).createShader(bounds),
                    child: Text(
                      'Your Intelligent Workspace.',
                      style: AppTheme.getTextTheme().headlineLarge?.copyWith(
                            fontSize: isSmall ? 24 : 32,
                            color: Colors.white,
                          ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Description
                  SizedBox(
                    width: isSmall ? double.infinity : 480,
                    child: Text(
                      'Collaborate, automate, and organize your workflow with tools designed for the future of work.',
                      style: AppTheme.getTextTheme().bodyLarge?.copyWith(
                            fontSize: isSmall ? 16 : 18,
                          ),
                    ),
                  ),

                  SizedBox(height: isSmall ? 40 : 64),

                  // Decorative elements
                  if (!isSmall) _buildFloatingCards(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandIcon() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryPurple,
            AppTheme.emeraldAccent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryPurple.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'N',
          style: AppTheme.getTextTheme().headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }

  Widget _buildFloatingCards() {
    return Row(
      children: [
        _buildFeatureCard(
          icon: Icons.rocket_launch_outlined,
          title: 'Fast',
          color: AppTheme.primaryPurple,
        ),
        const SizedBox(width: 16),
        _buildFeatureCard(
          icon: Icons.shield_outlined,
          title: 'Secure',
          color: AppTheme.emeraldAccent,
        ),
        const SizedBox(width: 16),
        _buildFeatureCard(
          icon: Icons.auto_awesome_outlined,
          title: 'Smart',
          color: AppTheme.purpleGlow,
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.borderGray.withOpacity(0.5),
          width: 1,
        ),
        color: AppTheme.surfaceBlack.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              color: color,
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: AppTheme.getTextTheme().bodyMedium?.copyWith(
                  color: AppTheme.softWhite,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
