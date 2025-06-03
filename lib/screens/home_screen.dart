import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/provider/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Toggle'),
        actions: [
          Switch(
            value: isDark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          )
        ],
      ),
      body: const Center(
        child: Text('Toggle Theme Using Provider'),
      ),
    );
  }
}
