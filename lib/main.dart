import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/app/themes/app_theme.dart';
import 'package:sample_project/provider/provider_scope.dart';
import 'package:sample_project/provider/theme_provider.dart';
import 'package:sample_project/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'My App',
      theme: AppTheme.getLightTheme(),
      darkTheme: AppTheme.getDarkTheme(),
      themeMode: themeProvider.themeMode, // system | light | dark
      home: const HomeScreen(),
    );
  }
}
