import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //child 1
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: const Image(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.fill,
            ),
          ),
          //sizedbox
          const SizedBox(
            height: 10,
          ),
          //child 2
          const Text(
            "FOODIE",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
