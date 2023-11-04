import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      body: SafeArea(
        bottom: true,
        left: false,
        right: false,
        top: false,
        child: SingleChildScrollView(
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
              MasonryGridView.count(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2
                        : 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                itemCount: this.meal.ingredients.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                      child: Text(
                        this.meal.ingredients[index],
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
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
      ),
    );
  }
}
