import 'package:flutter/material.dart';
import 'package:foodiee/Database/users_database_service.dart';
import 'package:foodiee/Database/users_model_class.dart';
import 'package:foodiee/auth/auth_service.dart';
import 'package:foodiee/commonwidgets/logo_container.dart';
import 'package:foodiee/commonwidgets/signuplogin_textfields.dart';
import 'package:foodiee/commonwidgets/sizedbox_btwsignup_tfields.dart';
import 'package:foodiee/menu/global_variables.dart';
import 'package:foodiee/view/mainview/home.dart';

import 'login_view.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => LoginPageState();
}

class LoginPageState extends State<SigninView> {
  final _auth = AuthService();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool move = false;
  //double bottom = 0;
  final _formKey = GlobalKey<FormState>();

  //
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  String? gender;
  String? password;
  //

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        move = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // First child of Stack
          Container(
            color: Colors.black,
          ),
          // Second child of Stack
          Positioned(
            top: size.height * 0.08,
            left: 0,
            right: 0,
            child: const LogoContainer(),
          ),
          // Third child of Stack
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            // Container animation from bottom handling
            bottom: move ? 0 : -size.height * 0.78,
            left: 0, // Added left and right properties to align it properly
            right: 0,
            child: Container(
              height: size.height * 0.78,
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      // SizedBox above SIGN IN text
                      const SizedBox(
                        height: 35,
                      ),
                      // Child 1 of column
                      const Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white),
                      ),
                      // SizedBox between SIGN IN and first text field
                      const SizedBox(
                        height: 20,
                      ),
                      // Child 2 of column
                      SignupTextfields(
                        width: size.width * 0.7,
                        labelText: "First Name",
                        controller: firstNameController,
                        onSaved: (value) {
                          firstName = value;
                        },
                      ),
                      // SizedBox between two text fields
                      const SizedboxBtwsignupTfields(),
                      // Child 3 of
                      SignupTextfields(
                        width: size.width * 0.7,
                        labelText: "Last Name",
                        controller: lastNameController,
                        onSaved: (value) {
                          lastName = value;
                        },
                      ),
                      // SizedBox between two text fields
                      const SizedboxBtwsignupTfields(),
                      //
                      SignupTextfields(
                        width: size.width * 0.7,
                        labelText: "Email",
                        controller: emailController,
                        onSaved: (value) {
                          email = value;
                        },
                      ),
                      // SizedBox between two text fields
                      const SizedboxBtwsignupTfields(),
                      // Child 4 of column
                      SignupTextfields(
                        width: size.width * 0.7,
                        labelText: "Mobile No",
                        controller: mobileController,
                        onSaved: (value) {
                          phoneNumber = value;
                        },
                      ),
                      // SizedBox between two text fields
                      const SizedboxBtwsignupTfields(),
                      // Child 5 of column
                      SignupTextfields(
                        width: size.width * 0.7,
                        labelText: "Password",
                        isObscure: true,
                        controller: passwordController,
                        onSaved: (value) {
                          password = value;
                        },
                      ),
                      // SizedBox between two text fields
                      const SizedboxBtwsignupTfields(),
                      // Child 6 of column
                      SignupTextfields(
                        width: size.width * 0.7,
                        labelText: "Confirm Password",
                        isObscure: true,
                        controller: confirmPasswordController,
                      ),
                      // SizedBox between text fields and elevated button
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      // Child 7 of column
                      ElevatedButton(
                          onPressed: _elevatedButtonPress,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          )),
                      // SizedBox between button and last text
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      // Child 8 of column
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          GestureDetector(
                            onTap: _logInTextPress,
                            child: const Text(
                              "Log In",
                              style: TextStyle(color: Colors.orange),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _elevatedButtonPress() async {
    setState(() {
      globleemail = emailController.text;
    });
    print('Globle email: $globleemail');
    final user = await _auth.createUserWithEmailAndPassword(
        emailController.text, passwordController.text);
    if (user != null &&
        _formKey.currentState != null &&
        _formKey.currentState!.validate()) {
      _formKey.currentState?.save(); // Save the form data
      setState(() {
        // Print or use the saved variables
        print('First Name: $firstName');
        print('Last Name: $lastName');
        print('Email: $email');
        print('Phone Number: $phoneNumber');
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    //
    UsersModelClass users = UsersModelClass(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        dateOfBirth: '',
        gender: '');
    UsersDatabaseService usersDatabaseService = UsersDatabaseService();
    await usersDatabaseService.insert(users);
  }

  void _logInTextPress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginView()));
  }
}
