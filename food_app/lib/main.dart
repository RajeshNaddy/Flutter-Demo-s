import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/dummy_data.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/screens/category_meal_screen.dart';
import 'package:food_app/screens/category_screen.dart';
import 'package:food_app/screens/filters_screen.dart';
import 'package:food_app/screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void setFilter(Map<String, bool> filtered) {
    setState(() {
      _filters = filtered;

      availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFav(String mealID) {
    final index = favoriteMeals.indexWhere((element) => element.id == mealID);

    if (index >= 0) {
      setState(() {
        favoriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    }
  }

  bool isMealFavourite(String mealID) {
    return favoriteMeals.any((element) => element.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline1: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      //home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (_) => TabsScreen(favoriteMeals),
        CategoryMealScreen.routeName: (_) => CategoryMealScreen(availableMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(toggleFav, isMealFavourite),
        FiltersScreen.routeName: (_) => FiltersScreen(setFilter, _filters)
      },
      onGenerateRoute: (settings) {},
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          CategoryScreen();
        });
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key, @required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: const Center(child: Text('Food APP')),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
