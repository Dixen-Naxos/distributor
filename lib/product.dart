import 'package:distributor/dto/distributor.dart';
import 'package:distributor/dto/product.dart';
import 'package:distributor/service/service_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dto/tuple.dart';

class Product extends StatefulWidget {
  List<Tuple> productsMap;

  Product({Key? key, required this.productsMap}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();

}

class _ProductState extends State<Product> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: widget.productsMap.length,
          itemBuilder: (context, index) {

            Tuple item = widget.productsMap[index];

            return ListTile(
              leading: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(index.toString(), style: TextStyle(fontSize: 20),),
              ),
              title: Text(item.productModel.name + "     x " + item.count.toString()),
              subtitle: Text((item == null) ? "": item.productModel.price.toString() + " points"),
            );
          },
        )
      ),
    );
  }
}

/*
FutureBuilder(
          future: service.getDistributor(),
          builder: (BuildContext context, AsyncSnapshot<Distributor> distributor) {
            if (distributor.hasData) {
              return ListView.builder(
                itemCount: distributor.data?.products.length,
                itemBuilder: (context, index) {
                  final item = distributor.data?.products[index];

                  return ListTile(
                    leading: Text(index.toString()),
                    title: Text((item == null) ? "": item.name),
                    subtitle: Text((item == null) ? "": item.price.toString() + " points"),
                  );
                },
              );
            } else if (distributor.hasError) {
              return Text("error");
            } else {
              return Text("loading");
            }
          },
        )
 */
