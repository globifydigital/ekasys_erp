
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:ekasys/models/locations/locations_model.dart';
import 'package:ekasys/models/sales/sale_order_insert_model.dart';
import 'package:ekasys/models/sales/sale_order_list_model.dart';
import 'package:ekasys/rest/hive_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/departments/departments_model.dart';
import '../../rest/rest_client_provider.dart';

final saleOrderProvider = ChangeNotifierProvider<SaleOrderProvider>(
      (ref) => SaleOrderProvider(ref),
);

class SaleOrderProvider extends ChangeNotifier {
  SaleOrderProvider(this._ref) : _restClient = _ref.read(restClientProvider) {
    // getLocationsList();
  }
  final Ref _ref;
  final RestClient _restClient;



  List<SalesOrderList> salesOrders = [];

  List<SalesOrderList> get salesOrdersList => salesOrders;

  Future <List<SalesOrderList>> getSalesOrdersList() async {
    notifyListeners();
    final map = <String, dynamic>{};

    map.putIfAbsent("DeptId", () => HiveRepo.instance.user!.oList![0].deptId);
    map.putIfAbsent("UserId", () => HiveRepo.instance.user!.oList![0].userId);

    try {
      final response = await _restClient.getSalesOrders(map);

      final salesList = (response as List)
          .map((item) => SalesOrderList.fromJson(item))
          .toList();
      salesOrders = salesList;

      notifyListeners();

      return salesOrders;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return [];
    }
  }

  Future<bool> insertSaleOrder(List<SaleOrderInsert> saleOrdersList) async {
    final List<Map<String, dynamic>> jsonBody = saleOrdersList.map((order) => order.toJson()).toList();

    try {
      final response = await _restClient.salesOrderInsert(jsonBody);

      final List<dynamic> orderList = response['oList'] ?? [];

      return orderList.isNotEmpty;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
