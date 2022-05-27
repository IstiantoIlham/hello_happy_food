import 'package:flutter/widgets.dart';
import 'package:hello_happy_food/model/food.dart';
import 'package:hello_happy_food/model/foodcategory.dart';
import 'package:hello_happy_food/utility/utils.dart';
import 'package:hello_happy_food/widget/carousel_widget.dart';
import 'package:hello_happy_food/widget/category_widget.dart';

class RecipePage extends StatefulWidget {
  final List<Food> food;
  final List<FoodCategory> foodCategory;
  const RecipePage({Key? key, required this.food, required this.foodCategory})
      : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                child: Text(
                  'Makanan Baru!',
                  style: blueTitle.copyWith(fontSize: 24),
                ),
              ),
              CarouselWidget(foodList: widget.food),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                child: Text(
                  'Cari Category!',
                  style: blueTitle.copyWith(fontSize: 24),
                ),
              ),
            ] +
            [
              for (var item in widget.foodCategory)
                CategoryWidget(
                  index: widget.foodCategory.indexOf(item) + 1,
                  food: item,
                )
            ],
      ),
    );
  }
}
