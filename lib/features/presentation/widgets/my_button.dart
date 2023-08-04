import 'package:flutter/material.dart';
import 'package:ticket/core/constants/size_constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(SizeConstants.radiusSmall),
        ),
        child: Center(child: Text(text, style: Theme.of(context).textTheme.subtitle2)),
      ),
    );
  }
}
