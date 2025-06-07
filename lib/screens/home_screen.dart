import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/app/components/buttons/custom_button.dart';
import 'package:sample_project/app/components/show_message/app_dialog.dart';
import 'package:sample_project/app/components/show_message/toast.dart';
import 'package:sample_project/app/enum/button_type.dart';
import 'package:sample_project/app/enum/status_msg.dart';
import 'package:sample_project/app/routes/app_route.dart';
import 'package:sample_project/app/routes/app_router.dart';
import 'package:sample_project/app/utils/app_log.dart';
import 'package:sample_project/main.dart';
import 'package:sample_project/provider/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isExpanded = false;
  bool hasIcon = false;
  ButtonType type = ButtonType.filled;
  ButtonSize size = ButtonSize.md;
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = themeProvider.isDarkMode;
    var localeKhmer = const Locale('km', 'KH');
    var localeEnglish = const Locale('en', 'US');
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(),

                const Gap(8),
                const Text("Custom button"),
                const Gap(8),
                Wrap(
                  direction: Axis.horizontal,
                  children: [
                    // Button type selector
                    DropdownButton<ButtonType>(
                      value: type,
                      items: ButtonType.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.name.toUpperCase()),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => type = value!),
                    ),
                    // Button size selector
                    DropdownButton<ButtonSize>(
                      value: size,
                      items: ButtonSize.values.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.name.toUpperCase()),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => size = value!),
                    ),
                  ],
                ),

                // Switches for states
                SwitchListTile(
                  title: const Text("Is Loading"),
                  value: isLoading,
                  onChanged: (val) => setState(() => isLoading = val),
                ),
                SwitchListTile(
                  title: const Text("Is Expanded"),
                  value: isExpanded,
                  onChanged: (val) => setState(() => isExpanded = val),
                ),
                SwitchListTile(
                  title: const Text("Has Icon"),
                  value: hasIcon,
                  onChanged: (val) => setState(() => hasIcon = val),
                ),
                const Gap(16),

                // Test Button
                CustomButton(
                  text: "Test Button",
                  type: type,
                  size: size,
                  isLoading: isLoading,
                  isExpanded: isExpanded,
                  icon: hasIcon ? Icons.check_circle_outline : null,
                  onPressed: isLoading
                      ? null
                      : () {
                          CustomToast.show(
                            context,
                            "Saved successfully!",
                            type: ResponseMsg.success,
                          );
                        },
                ),
                const Gap(8),
                Text("Change Laungues",
                    style: Theme.of(context).textTheme.bodyMedium),
                SwitchListTile(
                  title: Text(localize == "Kh" ? "Khmer" : "English"),
                  value: localize == "Kh" ? false : true,
                  onChanged: (val) async {
                    final prefs = await SharedPreferences.getInstance();

                    setState(() {
                      AppLog.info(localize);
                      localize = localize == "Kh" ? "En" : "Kh";
                      prefs.setString("local", localize);
                      AppLog.info(localize);
                      Get.updateLocale(
                          localize == "Kh" ? localeKhmer : localeEnglish);
                    });
                  },
                ),
                const Gap(8),
                Text(
                  "Hello".tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text("Good morning".tr,
                    style: Theme.of(context).textTheme.titleMedium),
                Text("Good Night".tr,
                    style: Theme.of(context).textTheme.titleMedium),
                const Gap(8),
                Text(" App Dialog".tr,
                    style: Theme.of(context).textTheme.titleMedium),
                const Gap(8),
                Row(
                  children: [
                    CustomButton(
                      text: "Failed".tr,
                      size: ButtonSize.md,
                      onPressed: () {
                        AppDialog.showResponseDialog(
                            context, "Failed message", ResponseMsg.failed);
                      },
                    ),
                    const Gap(8),
                    CustomButton(
                      text: "Warning".tr,
                      size: ButtonSize.md,
                      onPressed: () {
                        AppDialog.showResponseDialog(
                            context, "Waring message", ResponseMsg.warning);
                      },
                    ),
                    const Gap(8),
                    CustomButton(
                      text: "Success".tr,
                      size: ButtonSize.md,
                      onPressed: () {
                        AppDialog.showResponseDialog(
                            context, "Success message", ResponseMsg.success);
                      },
                    ),
                  ],
                ),
                const Gap(8),
                const Gap(8),
                Text("Go Router".tr,
                    style: Theme.of(context).textTheme.titleMedium),
                CustomButton(
                  text: "Login Screen".tr,
                  isExpanded: true,
                  onPressed: () =>
                      AppRouter.router.pushNamed(AppRoute.login.name),
                )
              ],
            ),
          ),
        ));
  }
}
