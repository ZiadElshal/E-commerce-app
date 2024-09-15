import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/resources/app_colors.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/product_screen.presentation/cubit/product_screen_states.dart';
import 'package:e_commerce/features/product_screen.presentation/cubit/product_screen_view_model.dart';
import 'package:e_commerce/features/product_screen.presentation/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = "product_screen";
  ProductScreen({super.key});

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var viewModel = ProductScreenViewModel.get(context);
    ProductScreenViewModel viewModel = getIt<ProductScreenViewModel>();

    return
        Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'What do you search for?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),

        BlocBuilder<ProductScreenViewModel, ProductScreenStates>(
          bloc: ProductScreenViewModel.get(context)..getAllProducts(),
          builder: (context, state) {
            if (state is ProductSuccessState) {
              return Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.productResponseEntity.data!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: ProductItem(
                          productEntity: state.productResponseEntity.data![index],
                        ),
                      );
                    },
                  ));
            } else if (state is ProductErrorState) {
              return Text(state.failures.errorMessage);

            } else {
              return
                Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
            }
          },
        )

          ],
        ),
      );
    //   BlocBuilder<ProductScreenViewModel, ProductScreenStates>(
    //   bloc: ProductScreenViewModel.get(context),
    //   builder: (context, state) {
    //     if (state is ProductSuccessState) {
    //       return Expanded(
    //           child: GridView.builder(
    //         padding: EdgeInsets.zero,
    //         itemCount: viewModel.productsList.length,
    //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             mainAxisSpacing: 10,
    //             crossAxisSpacing: 10
    //         ),
    //         itemBuilder: (context, index) {
    //           return InkWell(
    //             onTap: () {},
    //             child: ProductItem(
    //               productEntity: viewModel.productsList[index],
    //             ),
    //           );
    //         },
    //       ));
    //     } else if (state is ProductErrorState) {
    //       return Text(state.failures.errorMessage);
    //
    //     } else {
    //       return
    //         Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
    //     }
    //   },
    // );
  }
}
