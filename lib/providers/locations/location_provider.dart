
import 'package:collection/collection.dart';
import 'package:ekasys/models/locations/locations_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/departments/departments_model.dart';
import '../../rest/rest_client_provider.dart';

final locationsListProvider = ChangeNotifierProvider<LocationListProvider>(
      (ref) => LocationListProvider(ref),
);

class LocationListProvider extends ChangeNotifier {
  LocationListProvider(this._ref) : _restClient = _ref.read(restClientProvider) {
    getLocationsList();
  }
  final Ref _ref;
  final RestClient _restClient;



  List<LocationList> location = [];

  List<LocationList> get locationList => location;

  Future <List<LocationList>> getLocationsList() async {
    notifyListeners();
    final map = <String, dynamic>{};

    try {
      final response = await _restClient.getAllLocations(map);

      final locations = Locations.fromJson(response);

      location = locations.oList ?? [];

      notifyListeners();

      return location;
    } catch (e, stack) {
      print(e);
      print(stack);
      notifyListeners();
      return [];
    }
  }

  Future<void> insertAndUpdateArea(String areaName, String areaCode) async {
    final map = <String, dynamic>{};

    map.putIfAbsent("AreaId", () => 0);
    map.putIfAbsent("AreaName", () => areaName);
    map.putIfAbsent("AreaGrpId", () => 1);
    map.putIfAbsent("AreaCode", () => areaCode);
    map.putIfAbsent("DelFlag", () => 1);

    await _restClient.areaInsertAndUpdate(map);
  }


}
