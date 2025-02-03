import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/global.dart';
import 'package:ekasys/providers/customer/customer_provider.dart';
import 'package:ekasys/providers/locations/location_provider.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/customer/customer_model.dart';
import '../../models/locations/locations_model.dart';

@RoutePage()
class CustomerListingScreen extends ConsumerStatefulWidget {
  const CustomerListingScreen({super.key});

  @override
  ConsumerState<CustomerListingScreen> createState() => _CustomerListingScreenState();
}

class _CustomerListingScreenState extends ConsumerState<CustomerListingScreen> {

  var _search = TextEditingController();

  String selectedLocation = "Choose Location";
  int? selectedLocationId;

  List<LocationList> locations = [];
  List<CustomerList> allCustomerList = [];
  List<CustomerList> filteredCustomerList = [];

  Future<bool> _onWillPop() async {
    await context.pushRoute(const HomeRoute());
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchCustomers();
    getAllLocations();
  }
  @override
  Widget build(BuildContext context) {
    final provider = ref.read(customerListProvider);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 30,
          forceMaterialTransparency: true,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.11,
          leading: GestureDetector(
            onTap: (){
              context.pushRoute(const HomeRoute());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(Icons.arrow_back_ios, color: Colors.black,),
            ),
          ),
          title: TextFormField(
            controller: _search,
            decoration: const InputDecoration(
              hintText: 'Search Customer',
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(vertical: 16.0),
              prefixIconConstraints: BoxConstraints(minWidth: 50),
            ),
            onChanged: (v){
              if(v.isNotEmpty){
                setState(() {
                  searchCustomerByName(v);
                });
              }else{
               setState(() {
                 filteredCustomerList.clear();
                 filteredCustomerList = allCustomerList;
               });
              }
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                  onTap: (){
                    context.pushRoute(AddCustomerRoute(isUpdate: false));
                  },
                  child: Icon(Icons.person_add_alt_1_outlined, color: Colors.blueAccent,)),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0), // Adjust the height as needed
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  GestureDetector(
                    onTap: (){
                      showBS(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 12.0,
                      ).copyWith(
                        right: 12.0,
                        left: 4.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFADADAD),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            selectedLocation,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 12.0,
                      ).copyWith(
                        right: 12.0,
                        left: 4.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFADADAD),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "To Pay",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        ),

        body: (filteredCustomerList.isNotEmpty)?ListView.builder(
            itemCount: filteredCustomerList.length,
            itemBuilder: (BuildContext context, int index){
              String firstLetter = filteredCustomerList[index].custName!.isNotEmpty
                  ? filteredCustomerList[index].custName![0].toUpperCase()
                  : '';
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
                child: GestureDetector(
                  onTap: (){
                    customerIdGlobal = filteredCustomerList[index].custId;
                    customersGlobal = filteredCustomerList[index];
                    context.pushRoute(CustomerProfileRoute());
                  },
                  child: Card(
                    elevation: 0,
                    color: const Color(0xfff0f5ff),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 10.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                child: Text(firstLetter, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                            ),
                          ),
                          SizedBox(width: 20,),
                          Flexible(
                              flex: 10,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(filteredCustomerList[index].custName.toString(), style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                                  Text(filteredCustomerList[index].phoneNumber.toString(), style: TextStyle(color: Colors.black, fontSize: 12,),),
                                ],
                              )
                          ),
                          SizedBox(width: 10,),
                          Flexible(
                              flex: 4,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('₹ 1000', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                                  Card(
                                    color: (index == 2)?Colors.red.shade400: Colors.green.shade400,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 13.0, right: 13.0, bottom: 5.0, top: 5.0),
                                      child: Text((index == 2)?"To pay":"To get", style: TextStyle(color: Colors.white),),
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        ):const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  Future<void> showBS(BuildContext context) async {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0).copyWith(bottom: 10.0),
                  child: Text(
                    "Locations",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: locations.length,
                  itemBuilder: (context, index) => TextButton(
                    onPressed: () {
                      setState(() {
                        selectedLocation = locations[index].areaName.toString();
                        selectedLocationId = locations[index].areaId;
                        searchCustomerByAreaId(selectedLocationId!);
                      });
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0,
                      ),
                      backgroundColor: Colors.grey.shade100,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          locations[index].areaName.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                         if(selectedLocation == locations[index].areaName.toString())const Icon(
                          Icons.check_rounded,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 5,)
                )
              ],
            ),
          ),
        );
      }
    );
  }

  void searchCustomerByAreaId(int areaId) {
    filteredCustomerList = allCustomerList.where(
            (customer) => customer.areaId == areaId
    ).toList();
  }

  void searchCustomerByName(String searchName) {
    filteredCustomerList = allCustomerList.where(
            (customer) => customer.custName!.toLowerCase().contains(searchName.toLowerCase())
    ).toList();
  }

  Future<List<CustomerList>> _fetchCustomers() async {
    allCustomerList = await ref.read(customerListProvider).getCustomerList();
    setState(() {
      filteredCustomerList = allCustomerList;
    });
    return allCustomerList;
  }

  getAllLocations () async {
    locations = await ref.read(locationsListProvider).getLocationsList();
  }
}
