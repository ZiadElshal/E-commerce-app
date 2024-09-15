/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "66dff164bedb1f456c73b4b2"
/// data : {"_id":"66dff164bedb1f456c73b4b2","cartOwner":"66d537e4ff2762f6f447fd02","products":[{"count":1,"_id":"66dff164bedb1f456c73b4b3","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-09-10T07:12:36.529Z","updatedAt":"2024-09-10T07:12:36.746Z","__v":0,"totalCartPrice":149}

class AddToCartResponseEntity {
  AddToCartResponseEntity({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  AddDataCartEntity? data;

}

/// _id : "66dff164bedb1f456c73b4b2"
/// cartOwner : "66d537e4ff2762f6f447fd02"
/// products : [{"count":1,"_id":"66dff164bedb1f456c73b4b3","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-09-10T07:12:36.529Z"
/// updatedAt : "2024-09-10T07:12:36.746Z"
/// __v : 0
/// totalCartPrice : 149

class AddDataCartEntity {
  AddDataCartEntity({
      this.id, 
      this.cartOwner, 
      this.products,
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<AddProductEntity>? products;
  num? v;
  num? totalCartPrice;

}

/// count : 1
/// _id : "66dff164bedb1f456c73b4b3"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class AddProductEntity {
  AddProductEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  String? product;
  num? price;

}