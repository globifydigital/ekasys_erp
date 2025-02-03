
import 'package:collection/collection.dart';
import 'package:ekasys/models/customer/customer_insert_model.dart';
import 'package:ekasys/models/customer/customer_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/departments/departments_model.dart';
import '../../rest/rest_client_provider.dart';

final customerListProvider = ChangeNotifierProvider<CustomerListProvider>(
      (ref) => CustomerListProvider(ref),
);

class CustomerListProvider extends ChangeNotifier {
  CustomerListProvider(this._ref) : _restClient = _ref.read(restClientProvider) {
    getCustomerList();
  }
  final Ref _ref;
  final RestClient _restClient;



  List<CustomerList> _oList = [];

  List<CustomerList> get listState => _oList;

  Future<List<CustomerList>> getCustomerList() async {
    notifyListeners();
    final map = <String, dynamic>{};

    try {
      final response = await _restClient.getAllCustomers(map);

      final customers = Customers.fromJson(response);

      _oList = customers.oList ?? [];

      notifyListeners();

      return _oList;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return [];
    }
  }

  Future<void> insertAndUpdateCustomer(CustomerInsert customerInsert) async {
    final map = <String, dynamic>{};

    map.putIfAbsent("CustId", () => customerInsert.custId);
    map.putIfAbsent("AccountType", () => customerInsert.accountType);
    map.putIfAbsent("CustType", () => customerInsert.custType);
    map.putIfAbsent("CustAccount", () => customerInsert.custAccount);
    map.putIfAbsent("CustName", () => customerInsert.custName);
    map.putIfAbsent("TRNNumber", () => customerInsert.tRNNumber);
    map.putIfAbsent("CustStreet1", () => customerInsert.custStreet1);
    map.putIfAbsent("CustStreet2", () => customerInsert.custStreet2);
    map.putIfAbsent("CustCity1", () => customerInsert.custCity1);
    map.putIfAbsent("DelFlag", () => customerInsert.delFlag);
    map.putIfAbsent("AreaId", () => customerInsert.areaId);
    map.putIfAbsent("PhoneNumber", () => customerInsert.phoneNumber);
    map.putIfAbsent("CustEmail", () => customerInsert.custEmail);
    map.putIfAbsent("EmailId", () => customerInsert.custEmail);
    map.putIfAbsent("UserId", () => customerInsert.userId);
    map.putIfAbsent("DeptId", () => customerInsert.deptId);
    map.putIfAbsent("MapId", () => customerInsert.mapId);

    await _restClient.customerInsertAndUpdate(map);
  }

}
