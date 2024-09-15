import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "66dff164bedb1f456c73b4b2"
/// data : {"_id":"66dff164bedb1f456c73b4b2","cartOwner":"66d537e4ff2762f6f447fd02","products":[{"count":1,"_id":"66dff164bedb1f456c73b4b3","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-09-10T07:12:36.529Z","updatedAt":"2024-09-10T07:12:36.746Z","__v":0,"totalCartPrice":149}

class AddToCartResponseDto extends AddToCartResponseEntity{
  AddToCartResponseDto({
      super.status,
      super.message,
    this.statusMsg,
      super.numOfCartItems,
      super.cartId,
      super.data,
  });

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddDataCartDto.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

/// _id : "66dff164bedb1f456c73b4b2"
/// cartOwner : "66d537e4ff2762f6f447fd02"
/// products : [{"count":1,"_id":"66dff164bedb1f456c73b4b3","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-09-10T07:12:36.529Z"
/// updatedAt : "2024-09-10T07:12:36.746Z"
/// __v : 0
/// totalCartPrice : 149

class AddDataCartDto extends AddDataCartEntity{
  AddDataCartDto({
      super.id,
      super.cartOwner,
      super.products,
      this.createdAt,
      this.updatedAt,
      super.v,
      super.totalCartPrice,});

  AddDataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? createdAt;
  String? updatedAt;
}

/// count : 1
/// _id : "66dff164bedb1f456c73b4b3"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class AddProductDto extends AddProductEntity{
  AddProductDto({
      super.count,
      super.id,
      super.product,
      super.price,});

  AddProductDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

}