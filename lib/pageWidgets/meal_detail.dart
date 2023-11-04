import 'package:flutter/material.dart';
import 'package:meal/data/mock_data.dart';
import 'package:collection/collection.dart';

import '../model/meal.dart';

class MealDetail extends StatelessWidget {
  static const route = "meal_detail";

  late final Meal meal;

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
      body: SingleChildScrollView(
        child: Column(
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
            GridView.builder(
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,3,10,3),
                    child: Text(
                      this.meal.ingredients[index],
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 3,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: this.meal.ingredients.length,
              shrinkWrap: true,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Steps",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ...this
                .meal
                .steps
                .mapIndexed(
                  (index, _) => Container(
                    //height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.fromLTRB(
                      15,
                      index == 0 ? 15 : 5,
                      15,
                      index == this.meal.steps.length - 1 ? 15 : 5,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          this.meal.steps[index],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
