import 'package:flutter/material.dart';
import '../routes/tabs_screen.dart';
import '../routes/categories_meals_screen.dart';
import '../routes/categories_screen.dart';
import '../routes/meal_item_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        canvasColor: const Color.fromARGB(255, 129, 92, 25),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoriesMealScreen.routeName: (ctx) => const CategoriesMealScreen(),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
      },
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      }),
      onGenerateRoute: ((settings) {
        //return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
        print(settings.arguments);
      }),
    );
  }
}
