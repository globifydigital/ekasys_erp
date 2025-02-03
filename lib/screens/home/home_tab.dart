
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/models/products/fast_moving_products_model.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gif/gif.dart';

import '../../models/customer/customer_model.dart';
import '../../providers/customer/customer_provider.dart';
import '../../providers/products/products_provider.dart';
import '../../widgets/chart_sale_orders.dart';
import '../../widgets/pi_chart_products.dart';

@RoutePage()
class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});

  @override
  ConsumerState<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab>
    with AutomaticKeepAliveClientMixin,SingleTickerProviderStateMixin  {

  late GifController _gifController;

  List<CustomerList> allCustomerList = [];
  List<FastMovingProducts> topSellingProducts = [];
  List<Sector> sectors = [];

  @override
  void initState() {
    super.initState();
    _fetchCustomers();
    _fetchTopSellingProducts();
    _gifController = GifController(vsync: this);
    // _gifController.repeat(min: 0, max: 30, period: Duration(seconds: 2));
  }

  Future<List<FastMovingProducts>> _fetchTopSellingProducts() async {
    List<FastMovingProducts> products = await ref.read(productsListProvider).getTopSellingProducts();
    topSellingProducts.addAll(products);
      sectors = [
        if(topSellingProducts.isNotEmpty)Sector(color: Color(0xFFF1F5FF), value: double.parse(topSellingProducts[0].qty.toString()), name: topSellingProducts[0].itemDesc.toString()),
        if(topSellingProducts.length>1)Sector(color: Color(0xffffe99e), value: double.parse(topSellingProducts[1].qty.toString()), name: topSellingProducts[1].itemDesc.toString()),
        if(topSellingProducts.length>2)Sector(color: Color(0xffE1D3FF), value: double.parse(topSellingProducts[2].qty.toString()), name: topSellingProducts[2].itemDesc.toString()),
        if(topSellingProducts.length>3)Sector(color: Color(0xffbfffef), value: double.parse(topSellingProducts[3].qty.toString()), name: topSellingProducts[3].itemDesc.toString()),
      ];
      setState(() {});
    return products;
  }



  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/ekasyslogo1.png", height: 35,),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Container(
                        height: 100,
                        child: Card(
                          color: Colors.blueAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.card_travel, color: Colors.white,),
                                    SizedBox(width: 5,),
                                    Text("Sale Orders", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              Text("12", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: GestureDetector(
                        onTap: (){
                          context.pushRoute(CustomerListingRoute());
                        },
                        child: Container(
                          height: 100,
                          child: Card(
                            color: Color(0xffc6ffc9),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person, color: Colors.black,),
                                      SizedBox(width: 5,),
                                        Text("Customers", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                ),
                                Text(allCustomerList.length.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Top Selling Products", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    PieChartWidget(sectors),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sale Orders Chart", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    SizedBox(
                        height: 250,
                        child: LineChartContent(values: [10,20,30,35,50,20,30],)
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  Future<List<CustomerList>> _fetchCustomers() async {
    allCustomerList = await ref.read(customerListProvider).getCustomerList();
    setState(() {});
    return allCustomerList;
  }

  @override
  bool get wantKeepAlive => true;
}