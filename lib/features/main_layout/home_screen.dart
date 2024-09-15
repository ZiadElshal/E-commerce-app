import 'package:e_commerce/core/resources/app_colors.dart';
import 'package:e_commerce/core/widget/shared_preference_utils.dart';
import 'package:e_commerce/features/auth.presentation.screen/sign_in/login_screen.dart';
import 'package:e_commerce/features/cart/screens/cart_screen.dart';
import 'package:e_commerce/features/main_layout/cubit/home_states.dart';
import 'package:e_commerce/features/main_layout/cubit/home_view_model.dart';
import 'package:e_commerce/features/product_screen.presentation/cubit/product_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: viewModel,
      builder: (context, state) {
        return  Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset('assets/images/Route_logo.png'),
            ),
            actions: [
              Badge(
                label: Text(ProductScreenViewModel.get(context).numOfCartItems.toString()),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.blue),
                  onPressed: () {
                    // Handle cart action
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.logout, color: Colors.blue),
                onPressed: () {
                  //todo: remove token
                  SharedPreferenceUtils.removeToken(key: "token");
                  //todo: navigate to login screen
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName, (route) => false
                  );
                },
              ),
            ],
          ),
          body: viewModel.tabs[viewModel.currentIndex],
          // SingleChildScrollView(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(16.0),
          //         child: TextField(
          //           decoration: InputDecoration(
          //             prefixIcon: Icon(Icons.search),
          //             hintText: 'What do you search for?',
          //             border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(20),
          //               borderSide: BorderSide.none,
          //             ),
          //             filled: true,
          //             fillColor: Colors.grey[200],
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(20),
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(20),
          //           child: Image.asset(
          //             'assets/images/ad_image1.png',
          //           ),
          //         ),
          //       ),
          //
          //       Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Categories',
          //               style: TextStyle(
          //                 fontSize: 18.0,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             TextButton(
          //               onPressed: () {
          //                 // Handle View All action
          //               },
          //               child: Text('View All'),
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(height: 8.0),
          //       GridView.builder(
          //         physics: NeverScrollableScrollPhysics(),
          //         shrinkWrap: true,
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 4,
          //           childAspectRatio: 0.8,
          //           crossAxisSpacing: 16.0,
          //           mainAxisSpacing: 16.0,
          //         ),
          //         itemCount: categories.length,
          //         itemBuilder: (context, index) {
          //           return Column(
          //             children: [
          //               CircleAvatar(
          //                 radius: 30,
          //                 backgroundImage: AssetImage(categories[index]['image']!),
          //               ),
          //               SizedBox(height: 8.0),
          //               Text(
          //                 categories[index]['name']!,
          //                 style: TextStyle(fontSize: 12.0),
          //                 textAlign: TextAlign.center,
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Brands',
          //               style: TextStyle(
          //                 fontSize: 18.0,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             TextButton(
          //               onPressed: () {
          //                 // Handle View All action
          //               },
          //               child: Text('View All'),
          //             ),
          //           ],
          //         ),
          //       ),
          //       SizedBox(height: 8.0),
          //       GridView.builder(
          //         physics: NeverScrollableScrollPhysics(),
          //         shrinkWrap: true,
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 4,
          //           childAspectRatio: 0.8,
          //           crossAxisSpacing: 16.0,
          //           mainAxisSpacing: 16.0,
          //         ),
          //         itemCount: categories.length,
          //         itemBuilder: (context, index) {
          //           return Column(
          //             children: [
          //               CircleAvatar(
          //                 radius: 30,
          //                 backgroundImage: AssetImage(categories[index]['image']!),
          //               ),
          //               SizedBox(height: 8.0),
          //               Text(
          //                 categories[index]['name']!,
          //                 style: TextStyle(fontSize: 12.0),
          //                 textAlign: TextAlign.center,
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //
          //     ],
          //   ),
          // ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.mainColor,
              currentIndex: viewModel.currentIndex,
              selectedItemColor: AppColors.whiteColor,
              unselectedItemColor: AppColors.whiteColor,
              onTap: (value) => viewModel.changeSelectedIndex(value),

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined,),
                  label: " ",

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border,),
                  label: " ",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.format_list_bulleted_rounded,),
                  label: " ",

                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.person_outline_rounded,),
                //   label: " ",
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// final categories = [
//   {'name': 'Women\'s fashion', 'image': 'assets/women_fashion.png'},
//   {'name': 'Men\'s fashion', 'image': 'assets/men_fashion.png'},
//   {'name': 'Laptops & Electronics', 'image': 'assets/laptop.png'},
//   {'name': 'Baby Toys', 'image': 'assets/baby_toys.png'},
//   {'name': 'Beauty', 'image': 'assets/beauty.png'},
//   {'name': 'Headphones', 'image': 'assets/headphones.png'},
//   {'name': 'Skincare', 'image': 'assets/skincare.png'},
//   {'name': 'Cameras', 'image': 'assets/cameras.png'},
// ];
