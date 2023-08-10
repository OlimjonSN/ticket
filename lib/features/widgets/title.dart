// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ticket Booking',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700, color: Colors.orange),
          ),
          Text(
            '- BUY EMOTION, NOT TICKET -',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
