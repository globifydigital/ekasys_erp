
import 'package:collection/collection.dart';
import 'package:ekasys/models/products/fast_moving_products_model.dart';
import 'package:ekasys/models/products/products_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/departments/departments_model.dart';
import '../../rest/rest_client_provider.dart';

final productsListProvider = ChangeNotifierProvider<ProductsListProvider>(
      (ref) => ProductsListProvider(ref),
);

class ProductsListProvider extends ChangeNotifier {
  ProductsListProvider(this._ref) : _restClient = _ref.read(restClientProvider) {
    getAllProducts();
    getTopSellingProducts();
  }
  final Ref _ref;
  final RestClient _restClient;



  List<AllProducts> _products = [];
  List<FastMovingProducts> _fastMovinfProducts = [];

  Future<List<AllProducts>> getAllProducts() async {
    notifyListeners();
    final map = <String, dynamic>{};

    try {
      final response = await _restClient.getAllProducts(map);

      // Assuming response is a List<dynamic> from JSON
      final List<dynamic> jsonList = response;

      // Parse the JSON into a list of AllProducts
      final List<AllProducts> products = jsonList
          .map((jsonItem) => AllProducts.fromJson(jsonItem))
          .toList();

      // Update the state with the list of products
      _products = products;

      notifyListeners();

      return products;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return []; // Return an empty list in case of an error
    }
  }


  Future<List<FastMovingProducts>> getTopSellingProducts() async {
    notifyListeners();
    final map = <String, dynamic>{};

    try {
      final response = await _restClient.getTopSellingProducts(map);

      // Assuming response is a List<dynamic> from JSON
      final List<dynamic> jsonList = response;

      // Parse the JSON into a list of AllProducts
      final List<FastMovingProducts> products = jsonList
          .map((jsonItem) => FastMovingProducts.fromJson(jsonItem))
          .toList();

      // Update the state with the list of products
      _fastMovinfProducts = products;

      notifyListeners();

      return products;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return []; // Return an empty list in case of an error
    }
  }


}
