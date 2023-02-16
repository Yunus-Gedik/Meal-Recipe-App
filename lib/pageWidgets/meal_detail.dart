import 'package:flutter/material.dart';
class MealDetail extends StatelessWidget {
  static const route = "meal_detail";

  MealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("MOCK"),
      ),
    );
  }
}
