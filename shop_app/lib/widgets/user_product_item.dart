import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_edit_screen.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageURL;
  final String id;

  UserProductItem(this.id, this.title, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageURL),
      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ProductEditScreen.routeName, arguments: id);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  Provider.of<Products>(context, listen: false)
                      .deleteProduct(id);
                },
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
