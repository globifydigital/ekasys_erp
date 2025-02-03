import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/global.dart';
import 'package:ekasys/models/customer/customer_model.dart';
import 'package:ekasys/providers/customer/customer_provider.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';


@RoutePage()
class CustomerProfileScreen extends ConsumerStatefulWidget {
  const CustomerProfileScreen({super.key });
  @override
  ConsumerState<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends ConsumerState<CustomerProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> _onWillPop() async {
    await context.pushRoute(const CustomerListingRoute());
    return false;
  }
  _CustomerProfileScreenState();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.maxFinite,
                      padding: EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Color(0xFF3B74ED), Color(0xFF37EB58)],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: GestureDetector(
                                onTap: (){
                                  context.pushRoute(const CustomerListingRoute());
                                },
                                child: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
                          ),
                          Container(
                            width: double.maxFinite,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(customersGlobal!.custName.toString(),style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                                Text(customersGlobal!.tRNNumber.toString(),style: TextStyle(color: Colors.white, fontSize: 16),),
                                Text(customersGlobal!.phoneNumber.toString(),style: TextStyle(color: Colors.white, fontSize: 13),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){

                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.13,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: Card(
                                    color: Color(0xFFF1F5FF),
                                    elevation: 0,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/locationicon.png"),
                                        Text("Mark Visit", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.07,),
                              GestureDetector(
                                onTap: (){
                                  context.pushRoute(NewSalesRoute());
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.13,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: Card(
                                    color: Color(0xffffe99e),
                                    elevation: 0,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/newsaleicon.png"),
                                        Text("New Order", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.13,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Card(
                                  color: Color(0xffc6ffc9),
                                  elevation: 0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/paymenticon.png"),
                                      Text("Payments", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.07,),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.13,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Card(
                                  color: Color(0xffbfffef),
                                  elevation: 0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/transactions.png",height: 50,),
                                      Text("Transactions", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.13,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Card(
                                  color: Color(0xffc6ffc9),
                                  elevation: 0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.27,
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Card(
                      color: Colors.white,
                      elevation: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () async {
                                    final Uri url = Uri(
                                      scheme: 'tel',
                                      path: customersGlobal!.phoneNumber.toString()
                                    );
                                    if(await canLaunchUrl(url)){
                                      await launchUrl(url);
                                    }else{
                                      print("cannot launch this $url");
                                    }
                                  },
                                  child: Icon(Icons.call, color: Colors.blueAccent,size: 45,)),
                              const Text("Call", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)
                            ],
                          ),
                          Container(width: 1,height: 50,color: Colors.black,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: ()async{
                                    String url = customersGlobal!.mapId.toString();
                                    bool canLaunchUrl = await canLaunch(url);
                                    if (canLaunchUrl) {
                                      await launch(url);
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('No location found!'),
                                          content: const Text('Could not open Google Maps.'),
                                          actions: <Widget>[
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.green.shade300, // Blue background color
                                              ),
                                              onPressed: () {
                                                context.pushRoute(AddCustomerRoute(isUpdate: true));
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.only(left: 10.0 , right: 10.0),
                                                child: Text(
                                                  'Add location',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.blue, // Blue background color
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'OK',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: Icon(Icons.location_on_outlined, color: Colors.blueAccent,size: 45,)),
                              Text("Location", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)
                            ],
                          ),
                          Container(width: 1,height: 50,color: Colors.black,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    context.pushRoute(AddCustomerRoute(isUpdate: true));
                                  },
                                  child: Icon(Icons.edit_note_outlined, color: Colors.blueAccent,size: 45,)),
                              Text("Edit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]
          )
      ),
    );
  }
}
