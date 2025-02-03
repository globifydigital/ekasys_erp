
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/models/login/userLogin_model.dart';
import 'package:ekasys/rest/hive_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../routes/app_router.gr.dart';

@RoutePage()
class MenuTab extends ConsumerStatefulWidget {
  const MenuTab({super.key});

  @override
  ConsumerState<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends ConsumerState<MenuTab>
    with AutomaticKeepAliveClientMixin {

  UserLoginModel userLoginModel = UserLoginModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userLoginModel = HiveRepo.instance.user!;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
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
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                        Row(
                          children: [
                            Image.asset('assets/images/locationrooticon.png',height:  MediaQuery.of(context).size.height * 0.03),
                            SizedBox(width: 10,),
                            Text("Kazhakkottam",style: TextStyle(color: Colors.white, fontSize: 16),)
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.height * 0.08,
                              child: Card(
                                color: Colors.white,
                                child: Icon(Icons.person, size: 70,color: Colors.grey,),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    userLoginModel.oList![0].dCompanyName.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    userLoginModel.oList![0].dAddress.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Text(userLoginModel.oList![0].dPhoneNo != null ? userLoginModel.oList![0].dPhoneNo.toString() : "",style: TextStyle(color: Colors.white, fontSize: 13),),
                              ],
                            )
                          ],
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
                                context.pushRoute(CustomerListingRoute());
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.13,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Card(
                                  color: Color(0xFFF1F5FF),
                                  elevation: 0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Lottie.asset('assets/lotties/cutomerlottiejson.json',height:  MediaQuery.of(context).size.height * 0.08),
                                        Text("Customers", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)
                                      ]
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.07,),
                            GestureDetector(
                              onTap: (){
                                context.pushRoute(const ProductsListingRoute());
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.13,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Card(
                                  color: const Color(0xffffe99e),
                                  elevation: 0,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Lottie.asset('assets/lotties/productlottiejson.json',height:  MediaQuery.of(context).size.height * 0.08),
                                        Text("Products", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)
                                      ]
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
                            GestureDetector(
                              onTap: (){
                                context.pushRoute(TransactionListingRoute());
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.13,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Card(
                                  color: Color(0xffE1D3FF),
                                  elevation: 0,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Lottie.asset('assets/lotties/transactionlottie.json',height:  MediaQuery.of(context).size.height * 0.08),
                                        Text("Transactions", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)
                                      ]
                                  ),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Lottie.asset('assets/lotties/attendencelottiejson.json',height:  MediaQuery.of(context).size.height * 0.08,),
                                      Text("Attendance", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)
                                    ]
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                context.pushRoute(const SaleOrdersListingRoute());
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.13,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Card(
                                  color: Color(0xffc6ffc9),
                                  elevation: 0,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Lottie.asset('assets/lotties/salesorderlottiejson.json',height:  MediaQuery.of(context).size.height * 0.08),
                                        Text("Sales Orders", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),)
                                      ]
                                  ),
                                ),
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
                  ),
                ),
              ),
            ]
        )
    );
  }

  @override
  bool get wantKeepAlive => true;
}