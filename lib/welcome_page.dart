import 'package:flutter/material.dart';
import 'package:ticket/core/constants/size_constants.dart';
import 'package:ticket/features/auth/widgets/title.dart';
import 'package:ticket/features/presentation/widgets/my_button.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTitle(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConstants.paddingMedium),
            child: MyButton(text: 'Login'),
          ),
          MyButton(text: 'Sign Up'),
        ],
      )),
    ));
  }
}
