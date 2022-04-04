import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/product_edit_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {
    Products products = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Your Products'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProductEditScreen.routeName);
                },
                icon: Icon(Icons.add))
          ],
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
            itemCount: products.items.length,
            itemBuilder: (ctx, index) {
              return UserProductItem(products.items[index].id,
                  products.items[index].title, products.items[index].imageUrl);
            }));
  }
}
