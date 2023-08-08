// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket/features/auth/data/models/user_model.dart';
import 'package:ticket/features/auth/presentation/provider/auth_provider.dart';

import '../../../../core/constants/size_constants.dart';
import '../../../events/presentation/widgets/my_button.dart';
import '../../../widgets/decoration_input.dart';
import '../../../widgets/title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeConstants.paddingLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyTitle(),
              const SizedBox(height: SizeConstants.paddingXXLarge),
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
              MyButton(
                onPressed: loginFunc,
                text: 'Sign In',
              ),
              const SizedBox(height: SizeConstants.paddingMedium),
              TextButton(onPressed: () => context.go('/register'), child: Text('do you hava not account?', style: Theme.of(context).textTheme.subtitle1))
            ],
          ),
        ));
  }

  void loginFunc() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    UserModel(
      firstName: emailController.text,
      email: emailController.text,
    );
    String password = passwordController.text;
    String email = emailController.text;
    await authProvider.login(email, password);
    if (authProvider.status == Status.authenticated) {
      context.go('/eventsAll');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authProvider.error!)));
    }
  }
}
