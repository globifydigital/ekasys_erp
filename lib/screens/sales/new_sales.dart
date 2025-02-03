import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/global.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/customer/customer_model.dart';
import '../../models/products/products_model.dart';
import '../../providers/products/products_provider.dart';
import '../../rest/database.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/ekasys_loader.dart';


@RoutePage()
class NewSalesScreen extends ConsumerStatefulWidget {
  const NewSalesScreen({super.key,});

  @override
  ConsumerState<NewSalesScreen> createState() => _NewSalesScreenState();
}

class _NewSalesScreenState extends ConsumerState<NewSalesScreen> {


  final DatabaseHelper _dbHelper = DatabaseHelper();
  var _search = TextEditingController();

  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  var _cartQuantityItems = 0;
  final Map<int, ExpansionTileController> _controllers = {};

  late List<TextEditingController> _qty;
  late List<TextEditingController> _sellingPrice;
  late Future<List<AllProducts>> _productsFuture;
  List<AllProducts> allProducts = [];
  List<AllProducts> showedProducts = [];
  List<AllProducts> _dbProducts = [];


  Future<List<AllProducts>> _fetchProducts() async {
    _dbProducts = await _dbHelper.getProductsByCustomerId(customerIdGlobal!);
    List<AllProducts> products = await ref.read(productsListProvider).getAllProducts();
    allProducts.clear();
    showedProducts.clear();
    allProducts.addAll(products);
    showedProducts.addAll(products);

    setState(() {
      _qty = List.generate(products.length, (index) {
        TextEditingController controller = TextEditingController();
        controller.text = '1';
        return controller;
      });
      _sellingPrice = List.generate(products.length, (index) {
        TextEditingController controller = TextEditingController();
        controller.text = products[index].sellingPrice.toString();
        return controller;
      });
      _cartQuantityItems = _dbProducts.length;
    });
    await cartKey.currentState!.runCartAnimation((_cartQuantityItems).toString());
    return products;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productsFuture = _fetchProducts();
  }

  Future<bool> _onWillPop() async {
    await context.pushRoute(const CustomerProfileRoute());
    return false;
  }

  void searchProductByName(String searchName) {
    showedProducts = allProducts.where(
            (product) => product.description!.toLowerCase().contains(searchName.toLowerCase())
    ).toList();
  }

  void listClick(GlobalKey widgetKey) async {
    await runAddToCartAnimation(widgetKey);
    await cartKey.currentState!.runCartAnimation((++_cartQuantityItems).toString());
  }

  _NewSalesScreenState();
  @override
  Widget build(BuildContext context) {
    final provider = ref.read(productsListProvider);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: AddToCartAnimation(
        cartKey: cartKey,
        height: 30,
        width: 30,
        opacity: 0.85,
        dragAnimation: const DragToCartAnimationOptions(
          rotation: true,
        ),
        jumpAnimation: const JumpAnimationOptions(),
        createAddToCartAnimation: (runAddToCartAnimation) {
          this.runAddToCartAnimation = runAddToCartAnimation;
        },
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
                context.pushRoute(CustomerProfileRoute());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Icon(Icons.arrow_back_ios, color: Colors.black,),
              ),
            ),
            centerTitle: true,
            title: const Text("Orders", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: GestureDetector(
                    onTap: (){
                      context.pushRoute(ReviewOrdersRoute());
                    },
                    child: AddToCartIcon(
                      key: cartKey,
                      icon: const Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.black,),
                      badgeOptions: const BadgeOptions(
                        active: true,
                        backgroundColor: Colors.red,
                      ),
                    ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: TextFormField(
                    controller: _search,
                    decoration: const InputDecoration(
                        hintText: 'Search Products',
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        prefixIconConstraints: BoxConstraints(minWidth: 50),
                        suffixIcon: Icon(Icons.menu)
                    ),
                    onChanged: (v){
                      if(v.isNotEmpty){
                        setState(() {
                          searchProductByName(v);
                        });
                      }else{
                        setState(() {
                          showedProducts.clear();
                          showedProducts = allProducts;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Flexible(
                  flex: 25,
                  child: FutureBuilder<List<AllProducts>>(
                    future: _productsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        } else if (snapshot.hasData) {
                          List<AllProducts>? products = snapshot.data;
                          if (products == null || products.isEmpty) {
                            return const Center(child: Text("No data available"));
                          }
                          return ListView.builder(
                            itemCount: showedProducts.length,
                            itemBuilder: (BuildContext context, int index) {
                              _controllers[index] ??= ExpansionTileController();
                              AllProducts product = showedProducts[index];
                              return productListForOrder(product, index, showedProducts.length);
                            },
                          );
                        } else {
                          return const Center(child: Text("No data available"));
                        }
                      } else {
                        return Center(child: CustomLoader(height: 50, width: 50,));
                      }
                    },
                  )
                )
              ],
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.045,
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                elevation: 2,
                onPressed: () {
                },
                child: CustomButton(
                  title: "Place Order",
                  showActions: false,
                  onPressed: () {
                    context.pushRoute(ReviewOrdersRoute());
                  },
                )
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }

  Widget productListForOrder(AllProducts allProduct, int index, int lastIndex) {
    final GlobalKey widgetKey = GlobalKey();
    return Padding(
      padding: EdgeInsets.only(bottom: index != lastIndex-1 ? 8.0 : 75.0),
      child: ExpansionTile(
        controller: _controllers[index],
        tilePadding: EdgeInsets.zero,
        initiallyExpanded: false,
        maintainState: true,
        childrenPadding: EdgeInsets.zero,
        backgroundColor: Color(0XFFF1F5FF),
        collapsedBackgroundColor: Color(0XFFF1F5FF),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        onExpansionChanged: (isExpanded) {
          setState(() {
            if (isExpanded) {
              _controllers.forEach((key, controller) {
                if (key != index) controller.collapse();
              });
            }
          });
        },
        title: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          width: double.maxFinite,
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            // color: Color(0XFFF1F5FF),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.shade300,
            //     spreadRadius: 1,
            //     blurRadius: 5,
            //     offset: Offset(0, 3),
            //   ),
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 2,
                  child: Container(
                      key: widgetKey,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Opacity(
                          opacity: 0.5,
                          child: Image.asset("assets/images/noimage.png", fit: BoxFit.cover,))),
              ),
              const SizedBox(width: 10,),
              Flexible(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            allProduct.description ?? "",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            allProduct.itemCode ?? "",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'MRP : ₹${allProduct.model3 ?? '0'}',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '₹${allProduct.sellingPrice ?? '0'}',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff4F82EF),
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,)
            ],
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(_qty[index].text != "0"){
                              setState(() {
                                _qty[index].text = (int.parse(_qty[index].text) - 1).toString();
                              });
                            }
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Text("-", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 150,
                          child: TextFormField(
                            controller: _qty[index],
                            textAlign: TextAlign.center,
                            maxLength: 3,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                              prefixIconConstraints: BoxConstraints(minWidth: 50),
                              filled: true,
                              fillColor: Colors.white,
                              counterText: '',
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _qty[index].text = (int.parse(_qty[index].text) + 1).toString();
                            });
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Text("+", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 150,
                      child: TextFormField(
                        controller: _sellingPrice[index],
                        textAlign: TextAlign.center,
                        maxLength: 7,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                            prefixIconConstraints: BoxConstraints(minWidth: 50),
                            filled: true,
                            fillColor: Colors.white,
                            counterText: '',
                            labelText: "Selling Price"
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: ElevatedButton(
                            onPressed: () async{
                              await _insertProduct(allProduct,customerIdGlobal!, int.parse(_qty[index].text), double.parse(_sellingPrice[index].text));
                              listClick(widgetKey);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                              minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.4, 40)),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8)),
                            ),
                            child: Icon(Icons.forward, color: Colors.white,)
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _insertProduct(AllProducts products, int customerId, int qty, double price) async {
    products.customerId = customerId;
    products.openqty = qty;
    products.sellingPrice = price;
    AllProducts product = AllProducts();
    product = products;
    await _dbHelper.insertProduct(product);
  }
}
