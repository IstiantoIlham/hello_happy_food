import 'package:flutter/material.dart';
import 'package:hello_happy_food/model/food.dart';
import 'package:hello_happy_food/model/foooddetail.dart';
import 'package:hello_happy_food/service/service.dart';
import 'package:hello_happy_food/utility/utils.dart';

class DetailPageScreen extends StatefulWidget {
  final Food food;
  const DetailPageScreen({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailPageScreen> createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Ini Detail Resep!',
          style: blueTitle.copyWith(fontSize: 20.0),
        ),
        elevation: 4.0,
      ),
      body: FutureBuilder(
        future: Recipe.getRecipesDetail(widget.food.key),
        builder: (context, AsyncSnapshot<Results> snapshot) {
          if (snapshot.data != null) {
            var resultData = snapshot.data;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        child: Image.network(
                          resultData!.thumb,
                          height: 200,
                          width: 400,
                          fit: BoxFit.fill,
                          color: Colors.black.withOpacity(0.6),
                          colorBlendMode: BlendMode.dstATop,
                        ),
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                      Positioned(
                          bottom: 10.0,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            width: 300.0,
                            child: Text(
                              resultData.title,
                              style: whiteTitle.copyWith(fontSize: 20.0),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bahan Bahan',
                            style: blueTitle.copyWith(fontSize: 24.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            resultData.ingredient.join("\n"),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Langkah',
                            style: blueTitle.copyWith(fontSize: 24.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            resultData.step.join("\n"),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
