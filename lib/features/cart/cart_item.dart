import 'package:e_commerce/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Product image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/nike_shoe.png'), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),
            // Product details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nike Air Jordon',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.orange, size: 12),
                      SizedBox(width: 4),
                      Text('Orange | Size: 40',
                          style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'EGP 3,500',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Quantity and delete icon
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // Remove item
                  },
                  icon: Icon(Icons.delete_forever_outlined, color: AppColors.mainColor,
                  size: 30,),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    color: AppColors.mainColor
                  ),

                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Decrease quantity
                        },
                        icon: Icon(Icons.remove_circle_outline, color: AppColors.whiteColor,),
                      ),
                      Text('1',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                      ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Increase quantity
                        },
                        icon: Icon(Icons.add_circle_outline, color: AppColors.whiteColor,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}