import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sample_project/app/components/inputs/app_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordCtr = TextEditingController();
  final isObscure = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login".tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username".tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Gap(8),
            TextFormField(),
            const Gap(8),
            Text(
              "Password".tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Gap(8),
            ValueListenableBuilder<bool>(
              valueListenable: isObscure,
              builder: (context, obscure, child) => AppTextFormField(
                controller: passwordCtr,
                obscureText: obscure,
                suffixIcon: IconButton(
                  icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => isObscure.value = !obscure,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
