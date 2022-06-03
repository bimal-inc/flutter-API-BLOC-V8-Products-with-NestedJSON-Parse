//import http package
import 'package:api_testing/models/user_model.dart';
import 'package:api_testing/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductRepo {
  Future<List<Product>?> productData() async {
    final result = await http.Client().get(Uri.parse(productUrl));

    if (result.statusCode == 200) {
      Iterable models = json.decode(result.body);
      List<Product> productModels = [];
      for (var model in models) {
        Product productModel = Product.fromJson(model);
        productModels.add(productModel);
      }
      return productModels;
    } else {
      return null;
    }
  }
}
