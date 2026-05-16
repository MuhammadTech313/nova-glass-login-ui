import 'package:flutter/material.dart';
import 'package:nova_auth_ui/core/themes/theme.dart';
import 'features/auth/screens/auth_screen.dart';

void main() {
  runApp(const NovaAuthApp());
}

class NovaAuthApp extends StatelessWidget {
  const NovaAuthApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nova Auth',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const AuthScreen(),
    );
  }
}