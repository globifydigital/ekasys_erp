
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/departments/departments_model.dart';
import '../../rest/rest_client_provider.dart';

final departmentsListProvider = ChangeNotifierProvider<DepartmentsListProvider>(
      (ref) => DepartmentsListProvider(ref),
);

class DepartmentsListProvider extends ChangeNotifier {
  DepartmentsListProvider(this._ref) : _restClient = _ref.read(restClientProvider) {
    getDepartmentList();
  }
  final Ref _ref;
  final RestClient _restClient;



  List<OList> _oList = [];

  List<OList> get listState => _oList;

  Future<Departments> getDepartmentList() async {
    notifyListeners();
    final map = <String, dynamic>{};

    try {
      final response = await _restClient.getDepartments(map);

      // Assuming response is a Map<String, dynamic>
      final departments = Departments.fromJson(response);

      // Update the state with the departments' oList
      _oList = departments.oList ?? []; // Now assigning a List<OList>

      notifyListeners();

      return departments; // Return the Departments object
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      // Return an empty Departments object or handle the error appropriately
      return Departments(oList: []);
    }
  }


}
