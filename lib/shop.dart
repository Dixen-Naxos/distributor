import 'dart:convert';

import 'package:distributor/dto/user.dart';
import 'package:distributor/product.dart';
import 'package:distributor/service/service_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

import 'dto/distributor.dart';
import 'dto/product.dart';

class Shop extends StatefulWidget {
  String tag;

  Shop({Key? key, required this.tag}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  String textHolder = "";
  Distributor distributor = Distributor("", "", "", <ProductModel>[]);
  User user = User("", "", "", 0, "", "", false);

  @override
  Widget build(BuildContext context) {

    final service = ServiceAPI();
    service.getDistributor().then((value) => distributorResponse(value));
    service.getUser(jsonDecode(widget.tag)["id"]).then((value) => userResponse(value));

    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Text("Coins : " + user.coins.toString(), style: TextStyle(fontSize: 16),),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(child: Text('List Products'), onPressed: moveToProductList),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(textHolder, style: TextStyle(fontSize: 32)),
            ),
            Expanded(
              child: GridButton(
                onPressed: (dynamic value) {
                  gridTap(value);
                },
                items: const [
                  [
                    GridButtonItem(title: "1"),
                    GridButtonItem(title: "2"),
                    GridButtonItem(title: "3"),
                  ],
                  [
                    GridButtonItem(title: "4"),
                    GridButtonItem(title: "5"),
                    GridButtonItem(title: "6"),
                  ],
                  [
                    GridButtonItem(title: "7"),
                    GridButtonItem(title: "8"),
                    GridButtonItem(title: "9"),
                  ],
                  [
                    GridButtonItem(title: "Return"),
                    GridButtonItem(title: "0"),
                    GridButtonItem(title: "Enter"),
                  ],
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  void moveToProductList() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Product()));
  }

  void distributorResponse(Distributor distributor) {
    this.distributor = distributor;
  }

  void userResponse(User user) {
    setState(() {
      this.user = user;
    });
  }

  void gridTap(String value) {
    if (value == "Return") {
      setState(() {
        textHolder = textHolder.substring(0, textHolder.length - 1);
      });
    } else if (value == "Enter") {
      if (distributor.products.length <= int.parse(textHolder)) return;

      ProductModel productModel = distributor.products[int.parse(textHolder)];
      if (productModel.price > user.coins) {
        return;
      }

      final service = ServiceAPI();
      service.buyProduct(jsonDecode(widget.tag)["id"],
          distributor.products[int.parse(textHolder)].id).then((value) =>
          Navigator.pop(context));

      setState(() {
        textHolder = "";
      });
    } else {
      setState(() {
        if (textHolder.length < 2)
          textHolder += value;
      });
    }
  }
}
