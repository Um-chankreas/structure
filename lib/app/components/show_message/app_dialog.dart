import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:sample_project/app/components/buttons/custom_button.dart';
import 'package:sample_project/app/constants/app_colors.dart';
import 'package:sample_project/app/constants/assets_name.dart';
import 'package:sample_project/app/enum/button_type.dart';
import 'package:sample_project/app/enum/status_msg.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  static void showResponseDialog(
      BuildContext context, String message, ResponseMsg type) {
    final color = switch (type) {
      ResponseMsg.success => AppColors.successLight,
      ResponseMsg.warning => AppColors.warningLight,
      ResponseMsg.failed => AppColors.errorLight,
    };

    final String asset = switch (type) {
      ResponseMsg.success => AssetsName.success,
      ResponseMsg.warning => AssetsName.warning,
      ResponseMsg.failed => AssetsName.warning,
    };

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                width: 80,
                height: 80,
                image: AssetImage(asset),
                color: color,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            CustomButton(
              text: "Ok".tr,
              isExpanded: true,
              size: ButtonSize.sm,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
