import 'dart:convert';

class ProductModel {

  String _id;
  String name;
  int price;

  ProductModel(this._id, this.name, this.price);

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(json["_id"], json["name"], json["price"]);
  }
}