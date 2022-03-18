import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/screens/user_product_screen.dart';

import './screens/product_overview_screen.dart';
import './providers/products.dart';
import './screens/user_product_screen.dart';
import './screens/product_edit_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders())
      ],
      child: MaterialApp(
        title: 'Shop app',
        theme: ThemeData(
            fontFamily: 'Lato',
            primarySwatch: Colors.lightGreen,
            accentColor: Colors.deepOrange),
        //home: ProductOverviewScreen(),
        routes: {
          '/': (ctx) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          ProductEditScreen.routeName: (ctx) => ProductEditScreen(),
        },
      ),
    );
  }
}
