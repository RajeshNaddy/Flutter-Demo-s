import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String id;
  // final String title;

  // CategoryMealScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeArgs['id'];
    final String title = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text('Recipes for the category')),
    );
  }
}
