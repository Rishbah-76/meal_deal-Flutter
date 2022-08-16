import 'package:flutter/material.dart';
import 'package:meal_deal/widgets/meal_items.dart';
import '../data/dumy_data.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  const CategoriesMealScreen({super.key});

  // final String id;
  // final String title;
  // final String color;
  // const CategoriesMealScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categorizedMeals = dummyMeals.where((eachMeal) {
      return eachMeal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: categorizedMeals.length,
        itemBuilder: (context, index) {
          return MeatItems(
              title: categorizedMeals[index].title,
              imageURL: categorizedMeals[index].imageUrl,
              duration: categorizedMeals[index].duration,
              complexity: categorizedMeals[index].complexity,
              affordability: categorizedMeals[index].affordability);
        },
      ),
    );
  }
}
