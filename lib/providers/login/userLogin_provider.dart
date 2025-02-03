
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/login/userLogin_model.dart';
import '../../rest/rest_client_provider.dart';

final userDetailsProvider = ChangeNotifierProvider<UserDetailsProvider>(
      (ref) => UserDetailsProvider(ref),
);

class UserDetailsProvider extends ChangeNotifier {
  UserDetailsProvider(this._ref) : _restClient = _ref.read(restClientProvider) {
    // getDepartmentList();
  }
  final Ref _ref;
  final RestClient _restClient;



  List<userDetailsList> _userDetailsList = [];

  List<userDetailsList> get listState => _userDetailsList;

  Future<UserLoginModel> registerUser({
    required String UserLoginId,
    required String UserName,
    required String Password,
    required String DeptID,
}) async {

    final map = {
      "UserLoginId": UserLoginId,
      "UserName": UserName,
      "Password": Password,
      "DeptID": DeptID,
    };

    notifyListeners();

    try {
      final response = await _restClient.userLoginCheck(map);


      final userDetails = UserLoginModel.fromJson(response);


      _userDetailsList = userDetails.oList ?? [];

      notifyListeners();

      return userDetails;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return UserLoginModel(oList: []);
    }
  }


}
