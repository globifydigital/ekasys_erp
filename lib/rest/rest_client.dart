import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {required String baseUrl}) = _RestClient;

  @POST('Master/DepartmentGetandGets')
  Future<dynamic> getDepartments(@Body() Map<String, dynamic> body);

  @POST('Login/UserLoginCheck?')
  Future<dynamic> userLoginCheck(@Body() Map<String, dynamic> body);

  @POST('Master/ItemGetAll?dummy=1')
  Future<dynamic> getAllProducts(@Body() Map<String, dynamic> body);

  @POST('Master/CustomerGetandGets?custid=0')
  Future<dynamic> getAllCustomers(@Body() Map<String, dynamic> body);

  @POST('Master/CustomerInsertandUpdate?')
  Future<dynamic> customerInsertAndUpdate(@Body() Map<String, dynamic> body);

  @POST('Master/AreaGetandGets?AreaId=0')
  Future<dynamic> getAllLocations(@Body() Map<String, dynamic> body);

  @POST('Master/AreaInsertandUpdate?')
  Future<dynamic> areaInsertAndUpdate(@Body() Map<String, dynamic> body);

  @POST('SalesInvoice/SalesOrderInsertandUpdate?')
  Future<dynamic> salesOrderInsert(@Body() List<Map<String, dynamic>> body);

  @POST('SalesInvoice/SalesOrderGetList?FromDate=01/01/2000&ToDate=31/12/2030&')
  Future<dynamic> getSalesOrders(@Body() Map<String, dynamic> body);

  @POST('Purchaseandsalesreports/FastMovingItemsDashboard?number=1&Qty=5')
  Future<dynamic> getTopSellingProducts(@Body() Map<String, dynamic> body);
}
