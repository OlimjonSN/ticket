import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket/core/constants/size_constants.dart';
import 'package:ticket/features/widgets/title.dart';
import 'package:ticket/features/events/presentation/widgets/my_button.dart';

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
      child: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MyTitle(),
            const SizedBox(
              height: SizeConstants.paddingXLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: SizeConstants.paddingMedium),
              child: MyButton(text: 'Login', onPressed: () => context.go('/welcome/login')),
            ),
            MyButton(text: 'Sign Up', onPressed: () => context.go('/welcome/register')),
          ],
        ),
      ),
    ));
  }
}
