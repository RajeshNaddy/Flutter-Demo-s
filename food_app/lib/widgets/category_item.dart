import 'package:flutter/material.dart';
import '../screens/category_meal_screen.dart';
import '../screens/category_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color bgColor;
  final String id;

  CategoryItem(
      {@required this.id, @required this.title, @required this.bgColor});

  void selectCategory(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //   return CategoryMealScreen(id, title);
    // }));
    final args = {'id': id, 'title': title};

    Navigator.of(context)
        .pushNamed(CategoryMealScreen.routeName, arguments: args);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [bgColor.withOpacity(0.7), bgColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
