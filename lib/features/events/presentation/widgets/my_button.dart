// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ticket/core/constants/size_constants.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const MyButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(SizeConstants.radiusLarge),
        ),
        child: Center(child: Text(text, style: Theme.of(context).textTheme.subtitle2)),
      ),
    );
  }
}
