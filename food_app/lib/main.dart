import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/screens/category_meal_screen.dart';
import 'package:food_app/screens/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/': (_) => CategoryScreen(),
        CategoryMealScreen.routeName: (_) => CategoryMealScreen()
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
