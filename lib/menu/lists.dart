import 'package:flutter/material.dart';
import 'package:foodiee/menu/dessert.dart';
import 'package:foodiee/view/mainview/cart_body.dart';
import 'package:foodiee/view/mainview/discounts_body.dart';
import 'package:foodiee/view/mainview/favourites_body.dart';
import 'package:foodiee/view/mainview/menu_body.dart';
import 'package:foodiee/view/mainview/profile_body.dart';

List<FoodCategory> pizzas = [
  FoodCategory(
    name: "Margherita Pizza",
    description:
        "Combination of mozzarella cheese, fresh basil, and tomato sauce.",
    imageUrl: "assets/images/cheesepizza.png",
    price: 1350,
    originalPrice: 1490,
    discount: 30,
  ),
  FoodCategory(
    name: "Pepperoni Pizza",
    description:
        "Topped with mozzarella cheese, tomato sauce, and spicy pepperoni slices.",
    imageUrl: "assets/images/cheesepizza.png",
    price: 1420,
    originalPrice: 1590,
    discount: 30,
  ),
  FoodCategory(
    name: "BBQ Chicken Pizza",
    description:
        "Combination of grilled chicken, red onions, mozzarella cheese, and tangy BBQ sauce.",
    imageUrl: "assets/images/cheesepizza.png",
    price: 1350,
    originalPrice: 1490,
    discount: 30,
  ),
  FoodCategory(
    name: "Hawaiian Pizza",
    description: "8 Pieces of freshly-baked bread topped with cinnamon.",
    imageUrl: "assets/images/cheesepizza.png",
    price: 1420,
    originalPrice: 1590,
    discount: 30,
  ),
  FoodCategory(
    name: "Meat Lover's Pizza",
    description:
        "Loaded with pepperoni, sausage, ham, bacon, ground beef, and mozzarella cheese.",
    imageUrl: "assets/images/cheesepizza.png",
    price: 1350,
    originalPrice: 1490,
    discount: 30,
  ),
  FoodCategory(
    name: "Vegetarian Pizza",
    description:
        "Combination of bell peppers, mushrooms, red onions, olives, tomatoes, and mozzarella cheese.",
    imageUrl: "assets/images/cheesepizza.png",
    price: 1420,
    originalPrice: 1590,
    discount: 30,
  ),
  FoodCategory(
    name: "Four Cheese Pizza",
    description:
        "Blend of mozzarella, cheddar, parmesan, and feta cheese with a creamy white sauce.",
    imageUrl: "assets/images/cheesepizza.png",
    price: 1350,
    originalPrice: 1490,
    discount: 30,
  ),
  FoodCategory(
    name: "Supreme Pizza",
    description:
        "Topped with pepperoni, sausage, green peppers, onions, mushrooms, olives, and mozzarella cheese.",
    imageUrl: "assets/images/cheesepizza.png",
    price: 1420,
    originalPrice: 1590,
    discount: 30,
  ),
  FoodCategory(
    name: "Buffalo Chicken Pizza",
    description:
        "Spicy buffalo sauce, grilled chicken, mozzarella cheese, and drizzled with ranch dressing.",
    imageUrl: "assets/images/cheesepizza.png",
    price: 1350,
    originalPrice: 1490,
    discount: 30,
  ),
  FoodCategory(
    name: "Seafood Pizza",
    description:
        "Combination of shrimp, calamari, mozzarella cheese, garlic, and creamy white sauce.",
    imageUrl: "assets/images/cheesepizza.png",
    price: 1420,
    originalPrice: 1590,
    discount: 30,
  ),
];

//2
List<FoodCategory> burgers = [
  FoodCategory(
    name: "Classic Cheeseburger",
    description:
        "Juicy beef patty topped with American cheese, lettuce, tomato, pickles, onions, and a tangy burger sauce on a toasted bun.",
    imageUrl: "assets/images/burger.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Bacon Cheeseburger",
    description:
        "Beef patty topped with crispy bacon, cheddar cheese, lettuce, tomato, and smoky BBQ sauce.",
    imageUrl: "assets/images/burger.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Mushroom Burger",
    description:
        "Beef patty topped with sautéed mushrooms, melted Swiss cheese, and creamy garlic aioli.",
    imageUrl: "assets/images/burger.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "BBQ Burger",
    description:
        "Grilled beef patty with cheddar cheese, crispy onion rings, lettuce, and a rich BBQ sauce.",
    imageUrl: "assets/images/burger.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Spicy Jalapeño Burger",
    description:
        "Beef patty topped with pepper jack cheese, fresh jalapeños, spicy mayo, lettuce, and onions.",
    imageUrl: "assets/images/burger.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Veggie Burger",
    description:
        "Plant-based patty with lettuce, tomato, avocado, cheddar cheese, and a zesty chipotle mayo.",
    imageUrl: "assets/images/burger.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Chicken Burger",
    description:
        "Crispy or grilled chicken breast topped with lettuce, tomato, cheddar cheese, and mayonnaise on a soft bun.",
    imageUrl: "assets/images/burger.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Fish Burger",
    description:
        "Crispy battered fish fillet topped with lettuce, tartar sauce, and pickles on a toasted bun.",
    imageUrl: "assets/images/burger.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Pulled Pork Burger",
    description:
        "Soft pulled pork marinated in BBQ sauce, topped with coleslaw and pickles on a brioche bun.",
    imageUrl: "assets/images/burger.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Double Beef Burger",
    description:
        "Two juicy beef patties layered with melted cheddar cheese, lettuce, tomatoes, onions, and burger sauce.",
    imageUrl: "assets/images/burger.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
];

//3
List<FoodCategory> drinks = [
  FoodCategory(
    name: "PEPSI",
    description: "Pepsi\nAvailable in 1.5L and 2L",
    imageUrl: "assets/images/pepsi2.jpg",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "7UP",
    description: "7up\nAvailable in 1.5L and 2L",
    imageUrl: "assets/images/7up.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "MIRINDA",
    description: "Mirinda\nAvailable in 1.5L and 2L",
    imageUrl: "assets/images/mirinda.jpg",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "COKE",
    description: "Coke\nAvailable in 1.5L and 2L",
    imageUrl: "assets/images/coke.jpg",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
];

//4

List<FoodCategory> desserts = [
  FoodCategory(
    name: "Brownies",
    description:
        "Rich, fudgy chocolate squares that can be enhanced with nuts, chocolate chips, or caramel drizzle.",
    imageUrl: "assets/images/brownie.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Cheesecake",
    description:
        "A creamy dessert with a graham cracker crust, often topped with fruit, chocolate, or caramel.",
    imageUrl: "assets/images/cheesecake.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Chocolate Lava Cake",
    description:
        "A warm chocolate cake with a gooey molten center, served with a scoop of vanilla ice cream",
    imageUrl: "assets/images/moltenlava.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Red Velvet Cake",
    description:
        "A soft and moist cake with a hint of cocoa, characterized by its deep red color and cream cheese frosting.",
    imageUrl: "assets/images/redvelvet.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Vanilla cake",
    description:
        "A classic dessert made with spiced apples baked in a flaky pie crust.",
    imageUrl: "assets/images/vanilacake.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Swiss Roll",
    description:
        "A rolled sponge cake filled with cream or jam, sliced into spirals.",
    imageUrl: "assets/images/swissroll.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Black Forest Cake",
    description:
        "A German classic layered with chocolate sponge, whipped cream, and cherries.",
    imageUrl: "assets/images/blackforest.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Ice Cream Sundae",
    description:
        "A customizable treat with scoops of ice cream, topped with sauces, whipped cream, nuts, and a cherry.",
    imageUrl: "assets/images/icecreamsundae.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
];
//5
List<FoodCategory> sushi = [
  FoodCategory(
    name: "Dragon Roll",
    description:
        "Sushi roll with eel, cucumber, and crab stick, topped with thin avocado slices, eel sauce, and sesame seeds.",
    imageUrl: "assets/images/dragonroll.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Spicy Tuna Roll",
    description:
        "Sushi roll filled with fresh tuna, spicy mayo, and cucumber, wrapped in nori with a sprinkle of sesame seeds.",
    imageUrl: "assets/images/tunaroll.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Salmon Nigiri",
    description:
        "Slice of fresh salmon placed on a small bed of seasoned sushi rice with a touch of wasabi.",
    imageUrl: "assets/images/nigri.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Philadelphia Roll",
    description:
        "Sushi roll filled with smoked salmon, cream cheese, cucumber, and seasoned rice, wrapped in nori.",
    imageUrl: "assets/images/Philadelphia.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "California Roll",
    description:
        "Sushi roll with crab stick, avocado, cucumber, and seasoned rice, wrapped in nori and topped with sesame seeds.",
    imageUrl: "assets/images/californiaroll.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Shrimp Tempura Roll",
    description:
        "Crispy tempura shrimp, avocado, and cucumber rolled with seasoned rice and nori, topped with a drizzle of eel sauce.",
    imageUrl: "assets/images/sushi.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Rainbow Roll",
    description:
        "California roll topped with assorted fresh sashimi slices, including salmon, tuna, and yellowtail, with avocado.",
    imageUrl: "assets/images/rainbowroll.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Eel (Unagi) Nigiri",
    description:
        "Grilled eel glazed with sweet eel sauce, served on top of seasoned sushi rice.",
    imageUrl: "assets/images/unagi.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
  FoodCategory(
    name: "Vegetable Roll",
    description:
        "Sushi roll filled with cucumber, avocado, carrots, and bell peppers, wrapped in nori and topped with sesame seeds.",
    imageUrl: "assets/images/vegetableroll.png",
    price: 350,
    originalPrice: 490,
    discount: 30,
  ),
  FoodCategory(
    name: "Spicy Salmon Roll",
    description:
        "Fresh salmon mixed with spicy mayo and scallions, rolled with cucumber and seasoned rice, wrapped in nori.",
    imageUrl: "assets/images/salmonroll.png",
    price: 420,
    originalPrice: 590,
    discount: 30,
  ),
];

//scrolling images on home page
List<Image> scrollableImages = [
  Image.asset(
    'assets/images/images5.jpg',
    // height: 100,
    fit: BoxFit.cover,
  ),
  //2
  Image.asset(
    'assets/images/images2.jpg',
    // height: 100,
    fit: BoxFit.cover,
  ),
  //3
  Image.asset(
    'assets/images/images3.jpg',
    // height: 100,
    fit: BoxFit.cover,
  ),
  //4
  Image.asset(
    'assets/images/images4.jpg',
    // height: 100,
    fit: BoxFit.cover,
  ),
  //5
  Image.asset(
    'assets/images/images1.jpg',
    // height: 100,
    fit: BoxFit.cover,
  ),
];

// navbar item click corresponding oages list
List listOfPages = [
  const HomeBody(),
  const ProfileBody(),
  const QRCodeScanner(),
  const FavouritesBody(),
  const CartBody()
];

// Map to store email as key and list of orders as value
final Map<String, List<Map<String, dynamic>>> ordersMap = {};

List<Map<String, dynamic>> userOrders = [];

// Map to store email as key and list of favourites as value
final Map<String, List<Map<String, dynamic>>> favouritesMap = {};

List<Map<String, dynamic>> listOfFavourites = [];
