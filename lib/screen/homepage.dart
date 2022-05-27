import 'package:flutter/material.dart';
import 'package:hello_happy_food/model/food.dart';
import 'package:hello_happy_food/model/foodcategory.dart';
import 'package:hello_happy_food/screen/recipepage.dart';
import 'package:hello_happy_food/service/service.dart';
import 'package:hello_happy_food/utility/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<List<dynamic>> _getData() async {
    var recipeData = await Recipe.getNewRecipe();
    var recipeCategoryData = await Recipe.getRecipesCategory();

    return [recipeData, recipeCategoryData];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Happy Food!',
                style: blueTitle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 4,
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var args = snapshot.data as List<dynamic>;
          return RecipePage(
            food: args[0] as List<Food>,
            foodCategory: args[1] as List<FoodCategory>,
          );
        },
      ),
    );
  }
}
