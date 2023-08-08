// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket/core/constants/size_constants.dart';
import 'package:ticket/features/auth/data/models/user_model.dart';
import 'package:ticket/features/widgets/decoration_input.dart';
import 'package:ticket/features/widgets/title.dart';
import 'package:ticket/features/events/presentation/widgets/my_button.dart';

import '../provider/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void dispose() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    password1Controller.clear();
    super.dispose();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                const SizedBox(
                  height: SizeConstants.paddingMedium,
                ),
                TextFormField(
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  controller: lastNameController,
                  decoration: decorationInput('Last name', context),
                ),
                const SizedBox(
                  height: SizeConstants.paddingMedium,
                ),
                TextFormField(
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  controller: userNameController,
                  decoration: decorationInput('username', context),
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
                const SizedBox(
                  height: SizeConstants.paddingMedium,
                ),
                TextFormField(controller: password1Controller, obscureText: true, cursorColor: Theme.of(context).colorScheme.secondary, decoration: decorationInput('re enter password', context)),
                const SizedBox(height: SizeConstants.paddingLarge),
                MyButton(
                  text: 'Sign Up',
                  onPressed: registFunc,
                ),
                const SizedBox(height: SizeConstants.paddingMedium),
                TextButton(onPressed: () => context.go('/login'), child: Text('do you hava an account?', style: Theme.of(context).textTheme.subtitle1))
              ],
            ),
          ),
        ));
  }

  void registFunc() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    UserModel userModel = UserModel(
      firstName: nameController.text,
      email: (emailController.text).toString(),
      lastName: lastNameController.text,
      username: userNameController.text,
    );
    String password = passwordController.text;

    await authProvider.register(userModel, password, password);
    // error = authProvider.error.toString();

    if (authProvider.status == Status.authenticated) {
      context.go('/eventsAll');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.error.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
