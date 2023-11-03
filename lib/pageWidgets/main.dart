import 'package:flutter/material.dart';
import 'package:meal/pageWidgets/meal_detail.dart';
//import 'package:meal/pageWidgets/categories_page.dart';
import 'package:meal/pageWidgets/category_detail.dart';
import 'package:meal/pageWidgets/tab_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TabPage(),
      routes: {
        CategoryDetail.route: (context) {
          return CategoryDetail();
        },
        MealDetail.route: (context) {
          return MealDetail();
        }
      },
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.copyWith( 
              titleMedium: TextStyle(
                fontFamily: "Raleway",
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
            .copyWith(secondary: Colors.pink),
      ),
    );
  }
}
