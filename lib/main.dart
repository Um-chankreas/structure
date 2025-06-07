import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/app/localization/translations.dart';
import 'package:sample_project/app/routes/app_router.dart';
import 'package:sample_project/app/themes/app_theme.dart';
import 'package:sample_project/provider/provider_scope.dart';
import 'package:sample_project/provider/theme_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

String localize = "Kh";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  localize = prefs.getString("local") ?? "En";
  runApp(ProviderScope(
      child: MyApp(
    local: localize,
  )));
}

class MyApp extends StatelessWidget {
  final String local;
  const MyApp({super.key, required this.local});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return GetMaterialApp.router(
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
      title: 'My App',
      theme: AppTheme.getLightTheme(),
      darkTheme: AppTheme.getDarkTheme(),
      locale: local == "En"
          ? LocalizationService.locale
          : LocalizationService.fallbackLocale,
      fallbackLocale: local == "Kh"
          ? LocalizationService.fallbackLocale
          : LocalizationService.locale,
      translations: LocalizationService(),
      themeMode: themeProvider.themeMode, // system | light | dark
    );
  }
}
