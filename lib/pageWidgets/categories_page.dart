import 'package:flutter/material.dart';
import '/model/category.dart';
import '../data/mock_data.dart';
import '../widgets/category_grid_cell.dart';

class Categories extends StatefulWidget {
  const Categories();

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal"),
      ),
      body: GridView(
        padding: EdgeInsets.all(10).copyWith(
          top: 14,
          bottom: 14,
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (Category category) => CategoryCell(
                category: category,
                key: ValueKey(category.id),
              ),
            )
            .toList(),
      ),
    );
  }
}
