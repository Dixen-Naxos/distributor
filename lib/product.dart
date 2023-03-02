import 'package:distributor/dto/distributor.dart';
import 'package:distributor/dto/product.dart';
import 'package:distributor/service/service_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();

}

class _ProductState extends State<Product> {

  Distributor distributor = Distributor("", "", "", <ProductModel>[]);

  @override
  Widget build(BuildContext context) {

    final service = ServiceAPI();
    service.getDistributor().then((value) => distributorResponse(value));

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Center(
        child: FutureBuilder(
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
      ),
    );
  }

  void distributorResponse(Distributor distributor) {
    this.distributor = distributor;
    print(distributor.products.toString());
  }
}
