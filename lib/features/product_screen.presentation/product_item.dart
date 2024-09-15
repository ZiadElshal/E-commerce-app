
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce/features/product_screen.presentation/cubit/product_screen_view_model.dart';
import 'package:e_commerce/features/product_screen.presentation/product_details.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  ProductEntity productEntity;
  ProductItem({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ProductDetails.routeName);
      },
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: Color(0xff004182).withOpacity(0.3),
                width: 2
            )
        ),
        height: 400,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      height: 80,
                      width: double.infinity,
                      imageUrl:
                      productEntity.images!.first,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    )),
                Text(productEntity.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(productEntity.description!,
                  style: TextStyle(fontSize: 10),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                Text("EGP ${productEntity.price.toString()}"),
                Row(
                  children: [
                    Text("Review (${productEntity.ratingsAverage}) "),
                    Icon(Icons.star,color: Color(0xffFDD835),)
                  ],
                ),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xff004182),
                    size: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Color(0xff004182),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: (){
                      //todo: add to cart
                      ProductScreenViewModel.get(context).addToCart(
                        productEntity.id ?? ""
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}