import 'package:flutter/material.dart';
import 'package:hello_happy_food/model/food.dart';
import 'package:hello_happy_food/utility/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../screen/detailpage.dart';

class CarouselWidget extends StatefulWidget {
  final List<Food> foodList;
  const CarouselWidget({Key? key, required this.foodList}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imagesSlider;

  @override
  void initState() {
    imagesSlider = widget.foodList.map(
          (food) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPageScreen(
                            food: food,
                          )));
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(food.thumb),
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
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        width: 250.0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.key,
                                style: whiteTitle.copyWith(fontSize: 20.0),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                            ]),
                      ))
                ],
              ),
            ),
          ),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: imagesSlider,
        options: CarouselOptions(autoPlay: true, viewportFraction: 1));
  }
}
