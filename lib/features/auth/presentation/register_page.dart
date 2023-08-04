import 'package:flutter/material.dart';
import 'package:ticket/core/constants/size_constants.dart';
import 'package:ticket/features/auth/widgets/decoration_input.dart';
import 'package:ticket/features/auth/widgets/title.dart';
import 'package:ticket/features/presentation/widgets/my_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeConstants.paddingLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyTitle(),
          const SizedBox(height: SizeConstants.paddingXXLarge),
          TextFormField(
            cursorColor: Theme.of(context).colorScheme.secondary,
            controller: nameController,
            decoration: decorationInput('Your name', context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: SizeConstants.paddingMedium),
            child: TextFormField(
              cursorColor: Theme.of(context).colorScheme.secondary,
              controller: emailController,
              decoration: decorationInput('Enter your email', context),
            ),
          ),
          TextFormField(controller: passwordController, obscureText: true, cursorColor: Theme.of(context).colorScheme.secondary, decoration: decorationInput('password', context)),
          const SizedBox(height: SizeConstants.paddingLarge),
          const MyButton(
            text: 'Sign Up',
          ),
        ],
      ),
    ));
  }
}
