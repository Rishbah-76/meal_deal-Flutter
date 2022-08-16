import 'package:flutter/material.dart';
import '../routes/categories_screen.dart';
import '../routes/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (ctx1) {
    //       return CategoriesMealScreen(id, title);
    //     },
    //   ),
    // );

    Navigator.of(ctx).pushNamed(
      CategoriesMealScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color,
              color.withOpacity(0.6),
              color.withOpacity(0.8),
              color
            ],
            end: Alignment.bottomRight,
            begin: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
