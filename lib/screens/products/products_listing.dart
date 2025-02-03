import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ekasys/providers/products/products_provider.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/products/products_model.dart';


@RoutePage()
class ProductsListingScreen extends ConsumerStatefulWidget {
  const ProductsListingScreen({super.key});

  @override
  ConsumerState<ProductsListingScreen> createState() => _ProductsListingScreenState();
}

class _ProductsListingScreenState extends ConsumerState<ProductsListingScreen> {

  TextEditingController _search = TextEditingController();

  Future<bool> _onWillPop() async {
    await context.pushRoute(const HomeRoute());
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(productsListProvider);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 30,
          forceMaterialTransparency: true,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          centerTitle: true,
          leading: GestureDetector(
              onTap: (){
                context.pushRoute(HomeRoute());
              },
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
          title: const Text("Products", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),),
        ),
        body: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _search,
                  decoration: const InputDecoration(
                    hintText: 'Search Products',
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                    prefixIconConstraints: BoxConstraints(minWidth: 50),
                    suffixIcon: Icon(Icons.menu)
                  ),
                ),
                SizedBox(height: 10,),
                Flexible(
                  flex: 25,
                  child: FutureBuilder<List<AllProducts>>(
                    future: ref.read(productsListProvider).getAllProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        } else if (snapshot.hasData) {
                          List<AllProducts>? products = snapshot.data;

                          if (products == null || products.isEmpty) {
                            return Center(child: Text("No data available"));
                          }

                          return GridView.builder(
                            itemCount: products.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0,
                              childAspectRatio: 0.9,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final product = products[index];

                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/noimage.png'),
                                      opacity: 0.15,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        product.description ?? '',
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        product.itemCode ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height * 0.03,
                                        width: MediaQuery.of(context).size.width * 0.3,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15.0),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            '₹${product.sellingPrice ?? '0'}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(child: Text("No data available"));
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                    },
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
