import 'package:flutter/material.dart';

import '../../../../core/constants/size_constants.dart';
import '../../../events/presentation/widgets/my_button.dart';
import '../../widgets/decoration_input.dart';
import '../../widgets/title.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  // void registFunc() async {
  //   final authProvider = Provider.of<AuthProvider>(context, listen: false);

  //   UserModel userModel = UserModel(
  //     firstName: nameController.text,
  //     email: emailController.text,
  //   );
  //   String password = passwordController.text;
  //   authProvider.register(userModel, password, password);
  // }
}
