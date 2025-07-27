import 'package:flutter/material.dart';
import 'package:foodiee/Database/users_database_service.dart';
import 'package:foodiee/Database/users_model_class.dart';
import 'package:foodiee/auth/auth_service.dart';
import 'package:foodiee/commonwidgets/logo_container.dart';
import 'package:foodiee/commonwidgets/signuplogin_textfields.dart';
import 'package:foodiee/commonwidgets/sizedbox_btwsignup_tfields.dart';
import 'package:foodiee/menu/global_variables.dart';
import 'package:foodiee/view/mainview/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginView> {
  final _auth = AuthService();
  bool move = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailEntered;
  String? passwordEntered;
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
      body: Stack(
        children: [
          // First child of Stack
          Container(
            color: Colors.black,
          ),
          // Second child of Stack
          Positioned(
            top: size.height * 0.1,
            left: 0,
            right: 0,
            child: const LogoContainer(),
          ),
          // Third child of Stack
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            bottom: move ? 0 : -size.height * 0.7,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.7,
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Center(
                child: Column(
                  children: [
                    // SizedBox above LOG IN text
                    const SizedBox(
                      height: 35,
                    ),
                    // Child 1 of column
                    const Text(
                      "LOG IN",
                      style: TextStyle(color: Colors.orange),
                    ),
                    // SizedBox between LOG IN and first text field
                    const SizedBox(
                      height: 20,
                    ),
                    // Child 2 of column
                    SignupTextfields(
                      width: size.width * 0.7,
                      labelText: "Email",
                      controller: emailController,
                    ),
                    // Sizedbox between two text fields
                    const SizedboxBtwsignupTfields(),
                    // Child 3 of column
                    SignupTextfields(
                      width: size.width * 0.7,
                      labelText: "Password",
                      controller: passwordController,
                      isObscure: true,
                    ),
                    // SizedBox between text fields and elevated button
                    const SizedBox(
                      height: 20,
                    ),
                    // Child 4 of column
                    ElevatedButton(
                      onPressed: _elevatedButtonPress,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      child: const Text(
                        "Log In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // Sizedbox between elevated button and clickable text
                    const SizedBox(
                      height: 15,
                    ),
                    // Child 5 of column
                    Center(
                      child: GestureDetector(
                        onTap: _forgotPassTextPress,
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Child 6 of column
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Don't have an account? Sign up",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//for email
  Future<bool> doesEmailExist(String email) async {
    UsersDatabaseService usersDatabaseService = UsersDatabaseService();
    List<UsersModelClass> users = await usersDatabaseService.fetch();
    return users.any((user) => user.email == email);
  }

  //for password
  // Future<bool> doesPasswordExist(String password) async {
  //   UsersDatabaseService usersDatabaseService = UsersDatabaseService();
  //   List<UsersModelClass> users = await usersDatabaseService.fetch();
  //   return users.any((user) => user.password == password);
  // }

  void _elevatedButtonPress() async {
    setState(() {
      globleemail = emailController.text;
    });
    print('Globle email: $globleemail'); // Debugging log
    emailEntered = emailController.text;
    passwordEntered = passwordController.text;
    final user = await _auth.loginUserWithEmailAndPassword(
        emailEntered!, passwordEntered!);
    if (user != null) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomePage(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween<Offset>(begin: const Offset(-1, -1), end: Offset.zero),
              ),
              child: child,
            );
          },
        ),
      );
    } else {
      _showNotSignedUpDialog(context);
    }
  }

  void _showNotSignedUpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Oops!'),
          content: const Text('Looks like you are not signed up.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPasswordIncorrectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Oops!'),
          content: const Text('Incorrect Password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _forgotPassTextPress() {}
}
