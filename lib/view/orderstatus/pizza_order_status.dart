import 'package:flutter/material.dart';
import '../../commonwidgets/alert_container.dart';

class PizzaOrderStatus extends StatefulWidget {
  final String name;
  final String image;
  const PizzaOrderStatus({super.key, required this.name, required this.image});

  @override
  State<PizzaOrderStatus> createState() => _PizzaOrderStatusState();
}

class _PizzaOrderStatusState extends State<PizzaOrderStatus>
    with TickerProviderStateMixin {
  String image = 'assets/images/complete2.jpg';
  bool shrink = true;
  bool move = false;
  bool move2 = false;
  //late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // _animation =
    //  Tween<double>(begin: 0.0, end: pi).animate(_animationController);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        move = true;
        image = 'assets/images/complete2.png';
        shrink = false;
      });
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
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    //1

                    Positioned(
                      top: height * 0.1,
                      left: width * 0.14,
                      child: Container(
                        width: 230,
                        height: 230,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    if (shrink)
                      Positioned(
                        top: 150,
                        left: 100,
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: Hero(
                            tag: widget.name,
                            child: Image.asset(
                              widget.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 600),
                bottom: move ? 0 : -height * 0.5,
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
                        'Your Pizza is Ready!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Yay, It looks beautiful. You can always check your order in the "Orders" section under profile.',
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
                              setState(() {
                                move2 = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('Exit'),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () {},
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
              //3
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                top: move2 ? 0 : -height * 0.3,
                left: 0,
                right: 0,
                child: const AlertContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
