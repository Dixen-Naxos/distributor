import 'product.dart';
import 'dart:convert';

class Distributor {

  String _id;
  String name;
  String room;
  List<ProductModel> products;

  Distributor(this._id, this.name, this.room, this.products);

  factory Distributor.fromJson(dynamic json) {

    List<ProductModel> products = <ProductModel>[];

    for (int i = 0; i < json["products"].length; i++) {
      products.add(ProductModel.fromJson(json["products"][i]));
    }

    return Distributor(json["_id"], json["name"], json["room"], products);
  }
}