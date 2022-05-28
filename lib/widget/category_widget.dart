// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hello_happy_food/model/foodcategory.dart';
import 'package:hello_happy_food/screen/categorypage.dart';
import 'package:hello_happy_food/utility/utils.dart';

class CategoryWidget extends StatelessWidget {
  final int index;
  final FoodCategory food;
  const CategoryWidget({Key? key, required this.food, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryPage(food: food)));
      },
      child: SizedBox(
        height: 100.0,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/${index}.jpeg'),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                ),
              ),
            ),
            Center(
              child: Text(
                food.category + '!',
                style: whiteTitle.copyWith(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
