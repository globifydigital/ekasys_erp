import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/models/customer/customer_insert_model.dart';
import 'package:ekasys/models/locations/locations_model.dart';
import 'package:ekasys/providers/customer/customer_provider.dart';
import 'package:ekasys/rest/hive_repo.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../global.dart';
import '../../providers/locations/location_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/login_button.dart';


@RoutePage()
class AddCustomerScreen extends ConsumerStatefulWidget {
  final bool isUpdate;
  const AddCustomerScreen({super.key, required this.isUpdate});

  @override
  ConsumerState<AddCustomerScreen> createState() => _AddCustomerScreenState(isUpdate);
}

class _AddCustomerScreenState extends ConsumerState<AddCustomerScreen> {

  bool? isUpdate;

  CustomerInsert customer = CustomerInsert();

  final _formKey = GlobalKey<FormState>();
  final _areaFormKey = GlobalKey<FormState>();
  int? _selectedAreaId;

  var _businessName = TextEditingController();
  var _mobile = TextEditingController();
  var _email = TextEditingController();
  var _gst = TextEditingController();
  var _city = TextEditingController();
  var _mapUrl = TextEditingController();
  var _area = TextEditingController();

  var _newAreaName = TextEditingController();
  var _newAreaCode = TextEditingController();

  List<LocationList> locations = [];

  bool showLocationLoader = false;


  Future<void> _getCurrentLocation() async {
    try {
      setState(() {
        showLocationLoader = true;
      });
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        setState(() {
          showLocationLoader = false;
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      String url = 'https://www.google.com/maps?q=${position.latitude},${position.longitude}';

      setState(() {
        _mapUrl.text = url;
        showLocationLoader = false;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Current Location'),
          content: Text('Google Maps URL: $url'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );

    } catch (e) {
      print('Error: $e');
      // Handle the error accordingly
    }
  }

  getData(){
    if(isUpdate == true){
      _businessName.text = customersGlobal!.custName.toString();
      _mobile.text = customersGlobal!.phoneNumber.toString();
      _email.text = customersGlobal!.emailId.toString();
      _gst.text = customersGlobal!.tRNNumber.toString();
      _city.text = customersGlobal!.custStreet1.toString();
      _mapUrl.text = customersGlobal!.mapId.toString();
      if(customersGlobal!.areaId != null && customersGlobal!.areaId != 0) {
        _selectedAreaId = customersGlobal!.areaId;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllLocations();
    getData();
  }

  Future<bool> _onWillPop() async {
    if(isUpdate == false)await context.pushRoute(const CustomerListingRoute());
    if(isUpdate == true)await context.pushRoute(const CustomerProfileRoute());

    return false;
  }

  _AddCustomerScreenState(this.isUpdate);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 30,
          forceMaterialTransparency: true,
          centerTitle: true,
          elevation: 0,
          leading:  Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: GestureDetector(
                onTap: (){
                  if(isUpdate == false) context.pushRoute(const CustomerListingRoute());
                  if(isUpdate == true) context.pushRoute(const CustomerProfileRoute());
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
          ),
          title: const Text("Add Customer",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),)
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _businessName,
                    decoration: const InputDecoration(
                      hintText: 'Business Name',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      prefixIconConstraints: BoxConstraints(minWidth: 50),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Business name cannot be empty';
                      }
                      return null;
                    },
                    onChanged: (v){
                      _businessName.text = v.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _mobile,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      prefixIconConstraints: BoxConstraints(minWidth: 50),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mobile number cannot be empty';
                      }
                      return null;
                    },
                    onChanged: (v){
                      _mobile.text = v.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: 'Email (optional)',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      prefixIconConstraints: BoxConstraints(minWidth: 50),
                    ),
                    onChanged: (v){
                      _email.text = v.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _gst,
                    decoration: const InputDecoration(
                      hintText: 'GSTIN (optional)',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      prefixIconConstraints: BoxConstraints(minWidth: 50),
                    ),
                    onChanged: (v){
                      _gst.text = v.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _city,
                    decoration: const InputDecoration(
                      hintText: 'City (optional)',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      prefixIconConstraints: BoxConstraints(minWidth: 50),
                    ),
                    onChanged: (v){
                      _city.text = v.toString();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 7,
                        child: TextFormField(
                          controller: _mapUrl,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: 'Google map link',
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                            prefixIconConstraints: BoxConstraints(minWidth: 50),
                          ),
                          onChanged: (v){
                            _mapUrl.text = v.toString();
                          },
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: (showLocationLoader == false)?SizedBox(
                            height: 45,
                            child: CustomButton(
                              onPressed: _getCurrentLocation,
                              title:'Get Current\nLocation',
                              fontSize: 10,
                              showActions: false,
                            ),
                          ):const Center(child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey.shade100,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: DropdownButton(
                        value: _selectedAreaId,
                        dropdownColor: Colors.white,
                        menuMaxHeight: MediaQuery.of(context).size.height * 0.4,
                        underline: SizedBox(),
                        hint: const Text('Select an area'),
                        items: locations.map((LocationList location) {
                          return DropdownMenuItem(
                            value: location.areaId,
                            child: Text(location.areaName ?? ''),
                          );
                        }).toList(),
                        onChanged: (int? newValue) {
                          setState(() {
                            _selectedAreaId = newValue;
                          });
                        },
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                        iconSize: 24,
                        isExpanded: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: (){
                      _showPopup(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Add new area", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                        SizedBox(width: 5,),
                        Icon(Icons.add, color: Colors.blueAccent,size: 18,)
                      ],
                    ),
                  )
                ),
                SizedBox(height: 70),
              ],
            ),
          )
        ),
        bottomSheet:  Container(
          height: MediaQuery.of(context).size.height * 0.07,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 40.0, right: 40.0),
            child: CustomButton(
              title: "Save",
              showActions: false,
              onPressed: () {
                _saveCustomer();
              },
            ),
          ),
        ),
      ),
    );
  }

  getAllLocations () async {
    locations = await ref.read(locationsListProvider).getLocationsList();
    setState(() {});
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Add new location', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20 ),)),
          content: Form(
            key: _areaFormKey,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  SizedBox(height: 25,),
                  TextFormField(
                    controller: _newAreaName,
                    decoration: const InputDecoration(
                      hintText: 'Area name',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      prefixIconConstraints: BoxConstraints(minWidth: 50),
                    ),
                    validator: (v){
                      if(_newAreaName.text.isEmpty){
                        return "Please enter area name";
                      }
                      return null;
                    },
                    onChanged: (v){
                      _newAreaName.text = v.toString();
                    },
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: _newAreaCode,
                    decoration: const InputDecoration(
                      hintText: 'Area code (optional)',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      prefixIconConstraints: BoxConstraints(minWidth: 50),
                    ),
                    onChanged: (v){
                      _newAreaCode.text = v.toString();
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.045,
                width: MediaQuery.of(context).size.width * 0.5,
                child: CustomButton(
                  title: "Add",
                  showActions: false,
                  onPressed: () {
                    _saveArea();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveArea() async {
    if (!_areaFormKey.currentState!.validate()) return;
    // setState(() {
    //   submitting = true;
    // });

    if(_newAreaName.text.isNotEmpty){
      try {
        var area = await ref.read(locationsListProvider).insertAndUpdateArea(_newAreaName.text, _newAreaCode.text ?? "");
        getAllLocations();
        Navigator.pop(context);
      } catch (e) {
        // ignore: use_build_context_synchronously
      }

    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter area name'),
          duration: Duration(milliseconds: 600),),
      );
    }
    // setState(() {
    //   submitting = false;
    // });
  }


  Future<void> _saveCustomer() async {
    if (!_formKey.currentState!.validate()) return;
    // setState(() {
    //   submitting = true;
    // });

    if(_selectedAreaId != null){
      String deptId = HiveRepo.instance.user!.oList![0].deptId.toString();
      CustomerInsert customerInsert = CustomerInsert();
      customerInsert.custName = _businessName.text;
      customerInsert.phoneNumber = int.parse(_mobile.text);
      customerInsert.areaId = _selectedAreaId;
      customerInsert.custEmail = _email.text;
      customerInsert.tRNNumber = _gst.text??"";
      customerInsert.custId = (isUpdate == true)?customersGlobal!.custId : 0;
      customerInsert.accountType = (isUpdate == true)?customersGlobal!.accountType : 10;
      customerInsert.custType = "C";
      customerInsert.custAccount = (isUpdate == true)?int.parse(customersGlobal!.custAccount.toString()) : 0;
      customerInsert.custStreet1 = _city.text;
      customerInsert.custStreet2 = _city.text;
      customerInsert.custCity1 = _city.text;
      customerInsert.delFlag = 1;
      customerInsert.userId = (isUpdate == true)?customersGlobal!.userId : 1;
      customerInsert.deptId = int.parse(deptId);
      customerInsert.mapId = _mapUrl.text;
      try {
        var userDetails = await ref.read(customerListProvider).insertAndUpdateCustomer(customerInsert);
        context.pushRoute(const CustomerListingRoute());
        // ignore: use_build_context_synchronously
        // Navigator.pop(context);
      } catch (e) {
        // ignore: use_build_context_synchronously
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select area'),
          duration: Duration(milliseconds: 600),),
      );
    }
    // setState(() {
    //   submitting = false;
    // });
  }
}
