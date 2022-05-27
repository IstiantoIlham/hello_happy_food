import 'package:flutter/material.dart';
import 'package:hello_happy_food/model/food.dart';
import 'package:hello_happy_food/model/foodcategory.dart';
import 'package:hello_happy_food/service/service.dart';
import 'package:hello_happy_food/utility/utils.dart';
import 'package:hello_happy_food/widget/menucategory_widget.dart';

class CategoryPage extends StatelessWidget {
  final FoodCategory food;
  const CategoryPage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Ini ' + food.category + '!', style: blueTitle.copyWith()),
      ),
      body: FutureBuilder(
        future: Recipe.getRecipeByCategory(food.key),
        builder: (context, snapShot) {
          return snapShot.data != null
              ? MenuCategory(recipe: snapShot.data as List<Food>)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
