import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket/core/constants/size_constants.dart';
import 'package:ticket/features/auth/data/models/user_model.dart';
import 'package:ticket/features/auth/widgets/decoration_input.dart';
import 'package:ticket/features/auth/widgets/title.dart';
import 'package:ticket/features/events/presentation/widgets/my_button.dart';
import 'package:ticket/injection.dart';

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
            decoration: decorationInput('Your name', context, error),
          ),
          const SizedBox(
            height: SizeConstants.paddingMedium,
          ),
          TextFormField(
            cursorColor: Theme.of(context).colorScheme.secondary,
            controller: lastNameController,
            decoration: decorationInput('Last name', context, error),
          ),
          const SizedBox(
            height: SizeConstants.paddingMedium,
          ),
          TextFormField(
            cursorColor: Theme.of(context).colorScheme.secondary,
            controller: userNameController,
            decoration: decorationInput('username', context, error),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: SizeConstants.paddingMedium),
            child: TextFormField(
              cursorColor: Theme.of(context).colorScheme.secondary,
              controller: emailController,
              decoration: decorationInput('Enter your email', context, error),
            ),
          ),
          TextFormField(controller: passwordController, obscureText: true, cursorColor: Theme.of(context).colorScheme.secondary, decoration: decorationInput('password', context, error)),
          const SizedBox(
            height: SizeConstants.paddingMedium,
          ),
          TextFormField(controller: password1Controller, obscureText: true, cursorColor: Theme.of(context).colorScheme.secondary, decoration: decorationInput('re enter password', context, error)),
          const SizedBox(height: SizeConstants.paddingLarge),
          MyButton(
            text: 'Sign Up',
            onPressed: registFunc,
          ),
        ],
      ),
    ));
  }

  void registFunc() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      firstName: nameController.text,
      email: emailController.text,
      lastName: lastNameController.text,
      username: userNameController.text,
    );
    String password = passwordController.text;

    authProvider.register(userModel, password, password);
    error = authProvider.error.toString();
    print(error);
    if (authProvider.status == Status.authenticated) {
      print('loged in');
    }
  }
}
