import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop/models/model.dart';

class APIService {
  static Future<List<Model>> getModel() async {
    final response = await http.get(
      Uri.parse(
          "https://metaspook.github.io/json_api/json/products_gadget.json"),
    );

    if (response.statusCode == 200) {
      final productModel = [
        for (var model in jsonDecode(response.body)) Model.fromJson(model)
      ];

      return productModel;
    } else {
      throw (Exception("error to load"));
    }
  }
}
