import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(dotenv.env['FOOD_API_BASE_URL'], '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": dotenv.env['FOOD_API_ID'] ?? 'FOOD_API_ID not found',
      "x-rapidapi-host": dotenv.env['FOOD_API_BASE_URL'] ?? 'FOOD_API_BASE_URL not found',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
