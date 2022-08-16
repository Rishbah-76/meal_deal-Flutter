import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "mealItem-detail";
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: Text("thid is meal" + mealId),
    );
  }
}
