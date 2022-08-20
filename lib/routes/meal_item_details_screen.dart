import 'package:flutter/material.dart';
import '../data/dumy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "mealItem-detail";
  const MealDetailScreen({super.key});

  Widget buildSelectionTitle(BuildContext context, title) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Text(
        "$title",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(BuildContext context, {child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(1.0),
      height: 200,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        dummyMeals.firstWhere((element) => element.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text("${selectedMeal.title}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 3.0)),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  selectedMeal.imageUrl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              buildSelectionTitle(context, "Ingridients"),
              buildContainer(
                context,
                child: ListView.builder(
                  itemBuilder: ((context, index) => Card(
                        //color: Color.fromARGB(255, 127, 202, 129),
                        color: const Color.fromARGB(255, 240, 204, 74),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      )),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSelectionTitle(context, "Steps"),
              buildContainer(
                context,
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 240, 204, 74),
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text("${selectedMeal.steps[index]}"),
                      ),
                      const Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ));
  }
}
