import 'package:auto_route/auto_route.dart';
import 'package:ekasys/models/sales/sale_order_list_model.dart';
import 'package:ekasys/providers/saleOrder/saleOrderProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global.dart';
import '../../models/customer/customer_model.dart';
import '../../providers/customer/customer_provider.dart';
import '../../routes/app_router.gr.dart';


@RoutePage()
class SaleOrdersListingScreen extends ConsumerStatefulWidget {
  const SaleOrdersListingScreen({super.key});

  @override
  ConsumerState<SaleOrdersListingScreen> createState() => _SaleOrdersListingScreenState();
}

class _SaleOrdersListingScreenState extends ConsumerState<SaleOrdersListingScreen> {


  var _search = TextEditingController();

  List<SalesOrderList> allSalesOrdersList = [];
  List<SalesOrderList> filteredSalesOrdersList = [];

  Future<bool> _onWillPop() async {
    await context.pushRoute(const HomeRoute());
    return false;
  }

  Future<List<SalesOrderList>> _fetchCustomers() async {
    allSalesOrdersList = await ref.read(saleOrderProvider).getSalesOrdersList();
    setState(() {
      filteredSalesOrdersList = allSalesOrdersList;
    });
    return allSalesOrdersList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchCustomers();
  }
  @override
  Widget build(BuildContext context) {
    final provider = ref.read(saleOrderProvider);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 30,
          forceMaterialTransparency: true,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          leading: GestureDetector(
            onTap: (){
              context.pushRoute(HomeRoute());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(Icons.arrow_back_ios, color: Colors.black,),
            ),
          ),
          centerTitle: true,
          title: const Text("Sale Orders", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),),
        ),

        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: _search,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                  prefixIconConstraints: BoxConstraints(minWidth: 50),
                ),
                onChanged: (v){
                  if(v.isNotEmpty){
                    setState(() {
                      searchSalesOrderByName(v);
                    });
                  }else{

                    setState(() {
                      filteredSalesOrdersList.clear();
                      filteredSalesOrdersList = allSalesOrdersList;
                    });
                  }
                },
              ),
              const SizedBox(height: 10,),
              Flexible(
                flex: 25,
                child: (filteredSalesOrdersList.isNotEmpty)?ListView.builder(
                    itemCount: filteredSalesOrdersList.length,
                    itemBuilder: (BuildContext context, int index){
                      String firstLetter = filteredSalesOrdersList[index].custName!.isNotEmpty
                          ? filteredSalesOrdersList[index].custName![0].toUpperCase()
                          : '';
                      return Card(
                        elevation: 0,
                        color: const Color(0xfff0f5ff),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15.0, bottom: 15.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      flex: 7,
                                      fit: FlexFit.tight,
                                      child: Row(
                                        children: [
                                          Icon(Icons.person, color: Colors.blueAccent,),
                                          SizedBox(width: 5,),
                                          Text(filteredSalesOrdersList[index].custName.toString(), style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                                        ],
                                      )
                                  ),
                                  Flexible(
                                      flex: 3,
                                      child: Text("Bill No : ${filteredSalesOrdersList[index].orderNo.toString()}", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),)
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      flex: 5,
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_month, color: Colors.grey,),
                                          SizedBox(width: 5,),
                                          Text(filteredSalesOrdersList[index].invDate.toString(), style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
                                        ],
                                      )),
                                  Flexible(
                                      flex: 5,
                                      child: Text('Total Amount : ₹ ${filteredSalesOrdersList[index].roundGrandTotal.toString()}', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ):const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              )
            ]
          ),
        )
      ),
    );
  }

  void searchSalesOrderByName(String searchName) {
    filteredSalesOrdersList = allSalesOrdersList.where(
            (customer) => customer.custName!.toLowerCase().contains(searchName.toLowerCase())
    ).toList();
  }
}
