import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../pageWidgets/meal_detail.dart';

class MealCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;

  const MealCard({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String getComplexityStr() {
    switch (this.complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
    }
  }

  String getAffordabilityStr() {
    switch (this.affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Expensive";
    }
  }

  void goMealDetail(BuildContext context){
    Navigator.pushNamed(context , MealDetail.route, arguments: this.id);
  }

  @override
  Widget build(BuildContext context) {
    final infoTextStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 18,
        );

    return InkWell(
      onTap: () => this.goMealDetail(context),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 8,
          top: 2,
          right: 10,
          left: 10,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    this.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                  Positioned(
                    bottom: 15,
                    right: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black54,
                      ),
                      child: Text(this.title,
                          softWrap: true,
                          textAlign: TextAlign.end,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 21,
                                    color: Colors.white,
                                    overflow: TextOverflow.fade,
                                  )),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.timer_sharp, size: 30),
                    Text(" " + this.duration.toString() + " min",
                        style: infoTextStyle),
                    Spacer(),
                    Icon(Icons.schedule_outlined, size: 30),
                    Text(" " + this.getComplexityStr(), style: infoTextStyle),
                    Spacer(),
                    Icon(Icons.attach_money_outlined, size: 30),
                    Text(" " + this.getAffordabilityStr(), style: infoTextStyle),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
