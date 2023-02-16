import 'package:flutter/material.dart';
import 'package:meal/data/mock_data.dart';

import '../model/meal.dart';

class MealDetail extends StatelessWidget {
  static const route = "meal_detail";

  late Meal meal;

  MealDetail();

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;

    this.meal = DUMMY_MEALS.firstWhere((Meal meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.meal.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          Image.network(
            this.meal.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Container(
            height: 240,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Center(
                    child: Text(
                      this.meal.ingredients[index],
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
              itemCount: this.meal.ingredients.length,
            ),
          )
        ],
      ),
    );
  }
}
