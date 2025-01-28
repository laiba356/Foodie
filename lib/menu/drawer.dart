import 'package:flutter/material.dart';
import 'package:foodiee/feedback.dart';
import 'package:foodiee/terms_and_conditions.dart';
import 'package:foodiee/view/onboarding/start_view.dart';

class DrawerClass extends StatelessWidget {
  const DrawerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Image.asset("assets/images/logo.png")),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Person"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("About Us"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.abc),
            title: const Text("Terms and Conditions"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const TermsAndConditions();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const FeedbackPage();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              _showLogoutDialog(context);
            },
          )
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return const StartView();
                  },
                ));
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
