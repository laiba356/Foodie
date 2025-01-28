import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../view/onboarding/start_view.dart';

class AlertContainer extends StatelessWidget {
  const AlertContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/hangingwood.png',
            fit: BoxFit.cover,
            width: 300,
            height: 300,
          ),
          Positioned(
            top: 80,
            child: Container(
              height: 150,
              width: 200,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  const Text(
                    'Are you sure?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return const StartView();
                                },
                              ));
                              SystemNavigator.pop();
                            },
                            child: const Text('yes')),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: const Text('No'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
