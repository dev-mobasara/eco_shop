import 'package:flutter/material.dart';
import 'package:shop/models/model.dart';

class CController extends ChangeNotifier {
  final List<Model> _product = [];
  List<Model> get product => _product;

  addToCart(Model product) {
    _product.add(product);
    notifyListeners();
  }

  removeToCart(Model product) {
    _product.remove(product);
    notifyListeners();
  }
}
