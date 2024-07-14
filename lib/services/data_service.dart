import 'package:restaurant/models/recipe.dart';
import 'package:restaurant/services/http_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();
  final HTTPService _httpService = HTTPService();

  factory DataService() {
    return _singleton;
  }
  DataService._internal();
  Future<List<Recipe>?> getRecipes(String filter) async {
    String path = "recipes/";
    if (filter.isNotEmpty) {
      path += "meal-type/$filter";
    }
    var respone = await _httpService.get(path);
    if (respone?.statusCode == 200 && respone?.data != null) {
      // print(respone!.data);
      List data = respone!.data["recipes"];
      List<Recipe> recipes = data.map((e) => Recipe.fromJson(e)).toList();
      print(recipes);
      return recipes;
    }
  }
}
