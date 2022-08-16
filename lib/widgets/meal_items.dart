import 'package:flutter/material.dart';
import '../routes/meal_item_details_screen.dart';
import '../models/meal.dart';

class MeatItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MeatItems({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  // const MeatItems({super.key});

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetailScreen.routeName, arguments: id);
  }

  String get complexityString {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";
        break;

      case Complexity.challenging:
        return "Challenging";
        break;

      case Complexity.hard:
        return "Hard";
        break;

      default:
        return "Unknown";
    }
  }

  String get affordabilityString {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
        break;

      case Affordability.pricey:
        return "Pricey";
        break;

      case Affordability.luxurious:
        return "Luxurious";
        break;

      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 8,
                  child: Container(
                    width: 280,
                    color: const Color.fromARGB(119, 61, 64, 65),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.av_timer),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.hardware),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityString),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.price_change),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityString),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
