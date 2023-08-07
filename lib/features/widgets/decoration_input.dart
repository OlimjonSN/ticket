// ignore_for_file: unnecessary_import, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/size_constants.dart';

InputDecoration decorationInput(String text, BuildContext context, [String error = '']) {
  return InputDecoration(
    hintText: text,
    hintStyle: Theme.of(context).textTheme.subtitle1,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeConstants.radiusLarge),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeConstants.radiusLarge),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeConstants.radiusLarge),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 2),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeConstants.radiusLarge),
    ),
  );
}
