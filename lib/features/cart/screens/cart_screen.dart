// import 'package:flutter/material.dart';
//
// class CartScreen extends StatelessWidget {
//   static const String routeName = "cart_screen";
//   const CartScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart"),
//         centerTitle: true,
//
//       ),
//     );
//   }
// }

import 'package:e_commerce/core/resources/app_colors.dart';
import 'package:e_commerce/features/cart/cart_item.dart';
import 'package:e_commerce/features/cart/total_price_section.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "cart_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(color: AppColors.mainColor)),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: AppColors.mainColor),
        //   onPressed: () {
        //     // Go back or any other function
        //   },
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.mainColor),
            onPressed: () {
              // Search function
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: AppColors.mainColor),
            onPressed: () {
              // Cart function
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 1, // Number of items in the cart
                itemBuilder: (context, index) {
                  return CartItemCard();
                },
              ),
            ),
            Divider(),
            TotalPriceSection(),
          ],
        ),
      ),
    );
  }
}

