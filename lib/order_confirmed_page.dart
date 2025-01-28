import 'package:flutter/material.dart';
import 'package:foodiee/view/mainview/home.dart';
import 'package:foodiee/view/onboarding/start_view.dart';
import 'package:lottie/lottie.dart';

class OrderConfirmedPage extends StatefulWidget {
  const OrderConfirmedPage({super.key});

  @override
  State<OrderConfirmedPage> createState() => _PizzaOrderStatusState();
}

class _PizzaOrderStatusState extends State<OrderConfirmedPage>
    with TickerProviderStateMixin {
  bool move = false; // Controls visibility of the bottom container
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 2), // Match this to your animation duration
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          move = true; // Show the bottom container after animation completes
        });
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var Size(:height, :width) = size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Stack(
            children: [
              // Lottie Animation
              Positioned(
                top: height * 0.03, // Move the animation further up
                left: 0,
                right: 0,
                child: Center(
                  child: Lottie.asset(
                    'assets/animations/confirmed.json', // Replace with your Lottie file path
                    controller: _animationController,
                    width: width * 0.8,
                    height: height * 0.5,
                    fit: BoxFit.contain,
                    onLoaded: (composition) {
                      _animationController.duration = composition.duration;
                      _animationController.forward();
                    },
                  ),
                ),
              ),
              // Animated Bottom Container
              AnimatedPositioned(
                duration: const Duration(milliseconds: 600),
                bottom: move
                    ? 0
                    : -height * 0.5, // Appears after animation completes
                left: 0,
                right: 0,
                child: Container(
                  height: 350,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.check,
                          color: Colors.orange,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Your Order is Ready!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Yay, It looks beautiful. Wanna go back and checkout our amazing deal?.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              return _showLogoutDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('Log Out'),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return const HomePage();
                                },
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text("Home"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
