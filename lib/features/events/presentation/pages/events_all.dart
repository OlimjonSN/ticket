import 'package:flutter/material.dart';

class EventsAll extends StatelessWidget {
  const EventsAll({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(height: MediaQuery.of(context).size.height, child: const Text('All Events'))
    );
  }
}
