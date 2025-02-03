import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:ekasys/global.dart';
import 'package:ekasys/models/sales/sale_order_insert_model.dart';
import 'package:ekasys/providers/saleOrder/saleOrderProvider.dart';
import 'package:ekasys/rest/hive_repo.dart';
import 'package:ekasys/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../models/customer/customer_model.dart';
import '../../models/products/products_model.dart';
import '../../rest/database.dart';
import '../../widgets/custom_button.dart';


@RoutePage()
class ReviewOrdersScreen extends ConsumerStatefulWidget {
  const ReviewOrdersScreen({super.key});

  @override
  ConsumerState<ReviewOrdersScreen> createState() => _ReviewOrdersScreenState();
}

class _ReviewOrdersScreenState extends ConsumerState<ReviewOrdersScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<AllProducts> _products = [];
  double _totalAmount = 0;
  double _fixedTotalAmount = 0;
  bool showSuccessAnimation = false;
  var _search = TextEditingController();
  final now = DateTime.now();
  final formatter = DateFormat('dd/MM/yyyy');

  final Map<int, ExpansionTileController> _controllers = {};

  List<SaleOrderInsert> saleOrders = [];

  late List<TextEditingController> _qty;
  late List<TextEditingController> _sellingPrice;
  var _discountPercentage  = TextEditingController();

  Future<void> _fetchProducts() async {
    _products = await _dbHelper.getProductsByCustomerId(customerIdGlobal!);

    setState(() {
      _qty = List.generate(_products.length, (index) {
        TextEditingController controller = TextEditingController();
        controller.text = _products[index].openqty.toString();
        return controller;
      });

      _sellingPrice = List.generate(_products.length, (index) {
        TextEditingController controller = TextEditingController();
        controller.text = _products[index].sellingPrice.toString();
        return controller;
      });
      getTotalAmount();
    });
  }

  getTotalAmount(){
    _totalAmount = 0;
    _fixedTotalAmount = 0;
    for(int i=0; i<_products.length; i++){
      _totalAmount += (double.parse(_qty[i].text.isNotEmpty ? _qty[i].text : "0") * double.parse(_sellingPrice[i].text.isNotEmpty ? _sellingPrice[i].text : "0"));
      _fixedTotalAmount = _totalAmount;
      _calculatePercentage();
    }
  }

  void _calculatePercentage() {
    String percentageText = _discountPercentage.text;
    double percentage = double.tryParse(percentageText) ?? 0;

    if(percentage != 0){
      setState(() {
        _totalAmount = (_fixedTotalAmount * percentage) / 100;
        _totalAmount = _fixedTotalAmount - _totalAmount;
        _totalAmount = double.parse(_totalAmount.toStringAsFixed(2));
      });
    }else{
      setState(() {
        _totalAmount = _fixedTotalAmount;
        _totalAmount = double.parse(_totalAmount.toStringAsFixed(2));
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchProducts();
  }

  Future<bool> _onWillPop() async {
    await context.pushRoute(const NewSalesRoute());
    return false;
  }

  _ReviewOrdersScreenState();
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
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          leading: GestureDetector(
            onTap: (){
              context.pushRoute(NewSalesRoute());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(Icons.arrow_back_ios, color: Colors.black,),
            ),
          ),
          centerTitle: true,
          title: const Text("Review Orders", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: (!showSuccessAnimation)?SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Items", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                      GestureDetector(
                          onTap: (){
                            context.pushRoute(NewSalesRoute());
                          },
                          child: Text("+ Add Item", style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w500),)),
                    ],
                  )
                ),
                SizedBox(height: 10,),
                ListView.builder(
                  itemCount: _products.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index){
                    _controllers[index] ??= ExpansionTileController();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
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
                          height: MediaQuery.of(context).size.height * 0.13,
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
                                  child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: Opacity(
                                          opacity: 0.5,
                                          child: Image.asset("assets/images/noimage.png", fit: BoxFit.cover,))
                                  )),
                              const SizedBox(width: 10,),
                              Flexible(
                                flex: 8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _products[index].description ?? "",
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          Text(
                                            _products[index].itemCode ?? "",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Selling Price : ',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '₹${_products[index].sellingPrice ?? ""}',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Qty : ${_qty[index].text}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Item Total : ',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '₹${(double.parse(_qty[index].text.isNotEmpty ? _qty[index].text : "0") * double.parse(_sellingPrice[index].text.isNotEmpty ? _sellingPrice[index].text : "0"))}',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.blue,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'MRP : ₹${_products[index].model3 ?? ""}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,)
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
                                                getTotalAmount();
                                              });
                                            }
                                          },
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.green,
                                            child: Text("-", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.18,
                                          height: 150,
                                          child: TextFormField(
                                            controller: _qty[index],
                                            textAlign: TextAlign.center,
                                            maxLength: 3,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                            onChanged: (v){
                                              setState(() {
                                                _qty[index].text = v;
                                                getTotalAmount();
                                              });
                                            },
                                            decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                                              prefixIconConstraints: BoxConstraints(minWidth: 50),
                                              filled: true,
                                              fillColor: Colors.white,
                                              counterText: '',
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              _qty[index].text = (int.parse(_qty[index].text) + 1).toString();
                                              getTotalAmount();
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
                                        onChanged: (v){
                                          _sellingPrice[index].text = v.toString();
                                          getTotalAmount();
                                        },
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
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.1,
                                      child: ElevatedButton(
                                        onPressed: () async{
                                          await _dbHelper.deleteSingleProduct(_products[index].customerId!, _products[index].itemId!);
                                          _fetchProducts();
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                          minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.4, 40)),
                                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8)),
                                        ),
                                        child: Icon(Icons.delete_outline, color: Colors.white,),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20,),
                const Text("Payment Details", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: Card(
                    color: Colors.green.shade50,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Taxable Amount", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),),
                              Text(
                                '₹0',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("GST", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),),
                              Text(
                                '₹0',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Discount Percentage", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextFormField(
                                  controller: _discountPercentage,
                                  textAlign: TextAlign.center,
                                  maxLength: 4,
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
                                      labelText: ""
                                  ),
                                  onChanged: (v){
                                    _discountPercentage.text = v.toString();
                                    getTotalAmount();
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Amount", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                              Text(
                                '₹$_totalAmount',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100,),
              ],
            ),
          ): Center(
            child: Lottie.asset("assets/lotties/successanimationlottie.json", repeat: false,),
          ),
        ),
        bottomSheet: (!showSuccessAnimation)?Container(
          color: Color(0XFFBBFFC7),
          height: MediaQuery.of(context).size.height * 0.07,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${_products.length} Items',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      color: Colors.black,
                      height: MediaQuery.of(context).size.height * 0.035,
                      width: 2,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      '₹$_totalAmount',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.047,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        color: Colors.transparent,
                        elevation: 5,
                        child: CustomButton(
                          title: "Place Order",
                          fontSize: 22,
                          showActions: false,
                          onPressed: () async{
                            await _insertSale();
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ):SizedBox(),
      ),
    );
  }

  Future<void> _insertSale() async {
    // setState(() {
    //   submitting = true;
    // });

    if(_products.isNotEmpty){
      final formattedDate = formatter.format(now);
      for(int i=0; i<_products.length; i++){
        SaleOrderInsert saleOrderInsert = SaleOrderInsert();
        saleOrderInsert.productId = _products[i].itemId.toString();
        saleOrderInsert.productCode = _products[i].itemCode.toString();
        saleOrderInsert.productDescr = _products[i].description.toString();
        saleOrderInsert.orderNo = 0;
        saleOrderInsert.unitId =  1;
        saleOrderInsert.unitName = _products[i].unitName.toString();
        saleOrderInsert.prodQty = _qty[i].text.toString();
        saleOrderInsert.prodRate = _sellingPrice[i].text.toString();
        saleOrderInsert.fcProdRate = _sellingPrice[i].text.toString();
        saleOrderInsert.prodDisc = 0;
        saleOrderInsert.fcProdDisc = 0;
        saleOrderInsert.taxableAmount = 0;
        saleOrderInsert.fCTaxableAmount = 0;
        saleOrderInsert.taxId = 0;
        saleOrderInsert.taxPercent = 0;
        saleOrderInsert.taxAmount = 0;
        saleOrderInsert.fCTaxAmount = 0;
        saleOrderInsert.amount = (double.parse(_qty[i].text) * double.parse(_sellingPrice[i].text)).toString();
        saleOrderInsert.fCAmount = (double.parse(_qty[i].text) * double.parse(_sellingPrice[i].text)).toString();
        saleOrderInsert.locnId = customersGlobal!.areaId;
        saleOrderInsert.batchSNo = 1;
        saleOrderInsert.batch = "";
        saleOrderInsert.payType = 1;
        saleOrderInsert.lPONumber = 0;
        saleOrderInsert.custId = customerIdGlobal.toString();
        saleOrderInsert.custName = customersGlobal!.custName;
        saleOrderInsert.custAddress = customersGlobal!.custStreet1;
        saleOrderInsert.invDate = formattedDate;
        saleOrderInsert.invTerms = "";
        saleOrderInsert.expectedDate = "";
        saleOrderInsert.locId = customersGlobal!.areaId;
        saleOrderInsert.salesManId = int.parse(HiveRepo.instance.user!.oList![0].userId.toString());
        saleOrderInsert.areaId = customersGlobal!.areaId;
        saleOrderInsert.currencyId = 1;
        saleOrderInsert.currencyRate = 1;
        saleOrderInsert.jobNumber = 0;
        saleOrderInsert.grandTotal = "";
        saleOrderInsert.roundGrandTotal = (_totalAmount).round();
        saleOrderInsert.fCGrandTotal = "";
        saleOrderInsert.roundFCGrandTotal = 0;
        saleOrderInsert.totalDiscount = 0;
        saleOrderInsert.fCTotalDiscount = 0;
        saleOrderInsert.totalTaxable = 0;
        saleOrderInsert.fCTotTaxable = 0;
        saleOrderInsert.totalTax = 0;
        saleOrderInsert.fCTotTax = 0;
        saleOrderInsert.remarks = "";
        saleOrderInsert.deptId = int.parse(HiveRepo.instance.user!.oList![0].deptId.toString());
        saleOrderInsert.userId = int.parse(HiveRepo.instance.user!.oList![0].userId.toString());
        saleOrderInsert.delFlag = 1;
        saleOrderInsert.attention = "";
        saleOrderInsert.subject = "";
        saleOrderInsert.comments = "";
        saleOrderInsert.delivery = 0;
        saleOrderInsert.qtnNo = 0;
        saleOrderInsert.enqNo = 0;
        saleOrderInsert.salesNo = 0;
        saleOrderInsert.billSeriesId = 0;
        saleOrderInsert.qtnSubId = 0;
        saleOrders.add(saleOrderInsert);
      }
      try {
        bool data = await ref.read(saleOrderProvider).insertSaleOrder(saleOrders);
        if (data) {
          setState(() {
            showSuccessAnimation = true;
          });
          await _dbHelper.deleteProductsByCustomerId(customerIdGlobal!);
          Timer(const Duration(seconds: 3), () {
            context.pushRoute(const NewSalesRoute());
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sale order failed.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        // ignore: use_build_context_synchronously
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select products'),
          duration: Duration(milliseconds: 600),),
      );
    }
    // setState(() {
    //   submitting = false;
    // });
  }
}
