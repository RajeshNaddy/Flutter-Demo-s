import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';
import '../widgets/product_item.dart';
import '../widgets/products_grid.dart';

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOptions selected) {
                setState(() {
                  if (selected == FilterOptions.Favourites) {
                    showOnlyFavourites = true;
                  } else {
                    showOnlyFavourites = false;
                  }
                });
              },
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: Text('Only favourites'),
                      value: FilterOptions.Favourites,
                    ),
                    PopupMenuItem(
                      child: Text('Show all'),
                      value: FilterOptions.All,
                    )
                  ])
        ],
      ),
      body: ProductsGrid(showOnlyFavourites),
    );
  }
}

enum FilterOptions { Favourites, All }
