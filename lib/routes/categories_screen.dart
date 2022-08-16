import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../data/dumy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal_Deal"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          ...dummyCategories
              .map((eachCategory) => CategoryItem(
                  eachCategory.id, eachCategory.title, eachCategory.color))
              .toList(),
        ],
      ),
    );
  }
}
