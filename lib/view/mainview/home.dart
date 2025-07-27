import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodiee/menu/drawer.dart';
import 'package:foodiee/menu/lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController _pageController;
  int pageNumber = 0;
  late String listName;
  late AnimationController _scalAnimationController;
  late Animation<Offset> _scaleanimation;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    listName = "Pizzas";
    _scalAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
//
    _scaleanimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _scalAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    _scalAnimationController.forward();
//
    _pageController = PageController(initialPage: 0);
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        if (pageNumber < 5) {
          pageNumber++;
        } else {
          pageNumber = 0;
        }

        _pageController.animateToPage(pageNumber,
            duration: const Duration(milliseconds: 500), curve: Curves.linear);
      });
    });
  }

  @override
  void dispose() {
    _scalAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var Size(:height, :width) = size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          children: [
            Text(
              "No Address Selected",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "My Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: "Discount",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "My Cart",
          ),
        ],
      ),
      drawer: const DrawerClass(),
      body: listOfPages[_selectedIndex],
    );
  }
}
