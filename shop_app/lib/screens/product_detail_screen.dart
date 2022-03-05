import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);

    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedProduct = products.findById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProduct.title),
      ),
      body: Column(
        children: [
          Image.network(selectedProduct.imageUrl),
          SizedBox(
            height: 10,
          ),
          Text(
            selectedProduct.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(selectedProduct.description),
        ],
      ),
    );
  }
}
