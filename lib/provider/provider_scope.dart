import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/provider/theme_provider.dart';

class ProviderScope extends StatelessWidget {
  final Widget child;
  const ProviderScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
      ],
      child: child,
    );
  }
}
