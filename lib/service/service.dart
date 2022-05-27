import 'dart:convert';
import 'package:hello_happy_food/model/food.dart';
import 'package:hello_happy_food/model/foodcategory.dart';
import 'package:hello_happy_food/model/foooddetail.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://masak-apa-tomorisakura.vercel.app";

class Recipe {
  static Future<List<Food>?> getNewRecipe() async {
    List<Food>? list;
    String url = '$baseUrl/api/recipes';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['results'] as List;
      list = result.map((json) => Food.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception('Tidak dapat mengambil data makanan');
    }
  }

  static Future<List<FoodCategory>?> getRecipesCategory() async {
    List<FoodCategory>? list;
    String url = '$baseUrl/api/categorys/recipes';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['results'] as List;
      list = result.map((json) => FoodCategory.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception('Tidak dapat mengambil data makanan');
    }
  }

  static Future<Results>getRecipesDetail(String key) async {
    Results data;
    String url = '$baseUrl/api/recipe/$key';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['results'];
      data = Results.fromJson(result);
      print(response.body);
      return data;
    } else {
      throw Exception('Tidak dapat mengambil data makanan');
    }
  }

  static Future<List<Food>?> getRecipeByCategory(String key) async {
    List<Food>? list;
    String url = '$baseUrl/api/categorys/recipes/$key	';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['results'] as List;
      list = result.map((json) => Food.fromJson(json)).toList();
      print(response.body);
      return list;
    } else {
      throw Exception('Tidak dapat mengambil data makanan');
    }
  }
}
