import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/resources/app_colors.dart';
import 'package:e_commerce/core/widget/dialog_utils.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/main_layout/home.presentation/cubit/home_tab_states.dart';
import 'package:e_commerce/features/main_layout/home.presentation/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = "home_tab";

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel..getAllCategories()..getAllBrands(),

      listener: (context, state) {
        if(state is HomeCategoriesErrorState){
          DialogUtils.showMessage(context: context, message: state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/ad_image1.png',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      ///category
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle View All action
                        },
                        child: Text('View All'),
                      ),
                    ],
                  ),
                ),
                //state is HomeCategoriesLoadingState
                viewModel.categoryList.isEmpty
                    ? Center(child: CircularProgressIndicator(color: AppColors.mainColor,)
                )
                    :
                Column(
                  children: [
                    SizedBox(height: 8.0),
                    SizedBox(
                      height: 250,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: viewModel.categoryList.length,
                        itemBuilder: (context, index) {
                          print(viewModel.categoryList[index].image);
                          return
                            Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl:viewModel.categoryList[index].image ?? " ",
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.mainColor,
                                      )
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  viewModel.categoryList[index].name ?? " ",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                        },
                      ),
                    ),
                  ],
                ),
                ///brands
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Brands',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle View All action
                        },
                        child: Text('View All'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                //state is HomeBrandsLoadingState
                viewModel.brandsList.isEmpty
                ? Center(child: CircularProgressIndicator(color: AppColors.mainColor,)
                )
                    :
                SizedBox(
                  height: 250,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: viewModel.brandsList.length,
                    itemBuilder: (context, index) {
                      print(viewModel.brandsList[index].image);
                      return
                        Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl:viewModel.brandsList[index].image ?? " ",
                              width: 80,
                              height: 80,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.mainColor,
                                  )
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10,),
                            Text(
                              viewModel.brandsList[index].name ?? " ",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}