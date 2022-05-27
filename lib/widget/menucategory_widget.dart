import 'package:flutter/material.dart';
import 'package:hello_happy_food/model/food.dart';
import 'package:hello_happy_food/screen/detailpage.dart';
import 'package:hello_happy_food/utility/utils.dart';

class MenuCategory extends StatelessWidget {
  final List<Food> recipe;
  const MenuCategory({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recipe.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPageScreen(food: recipe[index]);
              }));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(recipe[index].thumb),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [
                            0.1,
                            0.9
                          ],
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.1),
                          ]),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 250.0,
                      child: Text(
                        recipe[index].key,
                        style: whiteTitle.copyWith(fontSize: 20.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
