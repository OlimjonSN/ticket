import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  Widget child;
  HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: GNav(
            rippleColor: Colors.grey[800]!, // tab button ripple color when pressed
            hoverColor: Colors.grey[700]!, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
            tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
            tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)], // tab button shadow
            curve: Curves.linear, // tab animation curves
            duration: const Duration(milliseconds: 200), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color
            activeColor: Theme.of(context).colorScheme.secondary, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1), // selected tab background color
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
            tabs: [
              GButton(
                icon: Icons.event,
                text: 'Events',
                onPressed: () => context.go('/eventsAll'),
              ),
              GButton(
                icon: Icons.event_available_outlined,
                text: 'Create Event',
                onPressed: () => context.go('/eventCreate'),
              ),
              const GButton(
                icon: Icons.confirmation_number_outlined,
                text: 'reservation',
              ),
              const GButton(
                icon: Icons.person_outline,
                text: 'Profile',
              )
            ]),
      ),
    );
  }
}
