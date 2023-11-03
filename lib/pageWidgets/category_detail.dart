import 'package:flutter/material.dart';
import 'package:meal/data/mock_data.dart';
import 'package:meal/model/category.dart';

import '../model/meal.dart';
import '../widgets/meal_card.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail();
  static const route = "category_detail";

  @override
  Widget build(BuildContext context) {
    final Category inputCategory =
        ModalRoute.of(context)!.settings.arguments as Category;
    final List<Meal> meals = DUMMY_MEALS.where((element) {
      return element.categories.contains(inputCategory.id);
    }).toList();

    return Scaffold( 
      appBar: AppBar(
        title: Text(
          inputCategory.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 12),
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return MealCard(
                id: meals[index].id,
                title: meals[index].title,
                affordability: meals[index].affordability,
                complexity: meals[index].complexity,
                duration: meals[index].duration,
                imageUrl: meals[index].imageUrl,
              );
            }),
            itemCount: meals.length,
          )),
    );
  }
}
