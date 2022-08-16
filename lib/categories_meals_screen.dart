import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Container(
        child: const Center(
          child: Text("This is Meal Screen"),
        ),
      ),
    );
  }
}
