import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../login/signin_view.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() {
    return StartViewState();
  }
}

class StartViewState extends State<StartView> with TickerProviderStateMixin {
  late Animation _textAnimation;
  late AnimationController _textAnimationController;

  late AnimationController _textAnimationController2;
  late Animation _textAnimation2;
  String oneLiner1 = "ᗩᖇE YOᑌ ᗩ ᖴOOᗪIE TOO?";
  String oneLiner2 = "ᗯE GOTᑕᕼᗩ!!";

  @override
  void initState() {
    super.initState();
    _textAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 100 * oneLiner1.length));
    _textAnimation = StepTween(begin: 0, end: oneLiner1.length)
        .animate(_textAnimationController);
    _textAnimationController2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 100 * oneLiner2.length));
    _textAnimation2 = StepTween(begin: 0, end: oneLiner2.length)
        .animate(_textAnimationController2);
    _textAnimationController.forward().then((_) {
      _textAnimationController2.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _textAnimationController.dispose();
    _textAnimationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          //child 1
          Container(
            color: Colors.black,
          ),
          //child 2
          Center(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //child 1 of coloum
                  SizedBox(
                      height: size.height * 0.6,
                      child: Container(
                        child: Lottie.asset('assets/animations/Animations.json',
                            repeat: false),
                      )),
                  //child 2 of column
                  const Text(
                    "Foodie",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.orange),
                  ),
                  //child 3 of coloum
                  AnimatedBuilder(
                      animation: _textAnimation,
                      builder: ((context, builder) {
                        return Text(
                          oneLiner1.substring(0, _textAnimation.value),
                          style: const TextStyle(
                              //fontFamily: "Roboto",
                              fontSize: 20,
                              color: Colors.white),
                        );
                      })),
                  //child 4 of coloum
                  AnimatedBuilder(
                      animation: _textAnimation2,
                      builder: ((context, builder) {
                        return Text(
                          oneLiner2.substring(0, _textAnimation2.value),
                          style: const TextStyle(
                              //fontFamily: "Roboto",
                              fontSize: 20,
                              color: Colors.orange),
                        );
                      })),
                  //sizedbox between animated text and button
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  //child 4 of colum
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: _elevatedButtonPress,
                      child: const Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _elevatedButtonPress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SigninView()));
  }
}
