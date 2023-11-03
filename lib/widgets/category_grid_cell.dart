import 'package:flutter/material.dart';
import 'package:meal/model/category.dart';
import 'package:meal/pageWidgets/category_detail.dart';

class CategoryCell extends StatelessWidget {
  final Category category;

  const CategoryCell({
    super.key,
    required this.category,
  });

  void navigateToDetail(BuildContext context) {
    //Navigator.push(context, route)
    Navigator.pushNamed(
      context,
      CategoryDetail.route,
      arguments: this.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToDetail(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                this.category.color.withOpacity(0.7),
                this.category.color,
              ],
            ),
          ),
          //alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 18,
              right: 18,
              bottom: 20,
            ),
            child: Text(
              this.category.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
