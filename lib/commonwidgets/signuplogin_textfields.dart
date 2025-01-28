import 'package:flutter/material.dart';

class SignupTextfields extends StatelessWidget {
  final double width;
  final String labelText;
  final bool isObscure;
  final TextEditingController controller;
  final void Function(String?)? onSaved;

  const SignupTextfields({
    super.key,
    required this.width,
    required this.labelText,
    this.isObscure = false,
    required this.controller,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: Colors.grey,
          filled: true,
        ),
        validator: (value) {
          if (labelText == "Email") {
            if (value != null && value.contains('gmail')) {
              return null;
            } else {
              return "Enter a valid email";
            }
          } else if (labelText == "Password") {
            if (value != null && value.length >= 9) {
              return null;
            } else {
              return "Password length too small";
            }
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
