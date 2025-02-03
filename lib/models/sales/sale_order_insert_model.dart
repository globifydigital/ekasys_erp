class SaleOrderInsert {
  String? productId;
  String? productCode;
  String? productDescr;
  int? orderNo;
  int? unitId;
  String? unitName;
  String? prodQty;
  String? prodRate;
  String? fcProdRate;
  int? prodDisc;
  int? fcProdDisc;
  int? taxableAmount;
  int? fCTaxableAmount;
  int? taxId;
  int? taxPercent;
  int? taxAmount;
  int? fCTaxAmount;
  String? amount;
  String? fCAmount;
  int? locnId;
  int? batchSNo;
  String? batch;
  int? payType;
  int? lPONumber;
  String? custId;
  String? custName;
  String? custAddress;
  String? invDate;
  String? invTerms;
  String? expectedDate;
  int? locId;
  int? salesManId;
  int? areaId;
  int? currencyId;
  int? currencyRate;
  int? jobNumber;
  String? grandTotal;
  int? roundGrandTotal;
  String? fCGrandTotal;
  int? roundFCGrandTotal;
  int? totalDiscount;
  int? fCTotalDiscount;
  int? totalTaxable;
  int? fCTotTaxable;
  int? totalTax;
  int? fCTotTax;
  String? remarks;
  int? deptId;
  int? userId;
  int? delFlag;
  String? attention;
  String? subject;
  String? comments;
  int? delivery;
  int? qtnNo;
  int? enqNo;
  int? salesNo;
  int? billSeriesId;
  int? qtnSubId;

  SaleOrderInsert(
      {this.productId,
        this.productCode,
        this.productDescr,
        this.orderNo,
        this.unitId,
        this.unitName,
        this.prodQty,
        this.prodRate,
        this.fcProdRate,
        this.prodDisc,
        this.fcProdDisc,
        this.taxableAmount,
        this.fCTaxableAmount,
        this.taxId,
        this.taxPercent,
        this.taxAmount,
        this.fCTaxAmount,
        this.amount,
        this.fCAmount,
        this.locnId,
        this.batchSNo,
        this.batch,
        this.payType,
        this.lPONumber,
        this.custId,
        this.custName,
        this.custAddress,
        this.invDate,
        this.invTerms,
        this.expectedDate,
        this.locId,
        this.salesManId,
        this.areaId,
        this.currencyId,
        this.currencyRate,
        this.jobNumber,
        this.grandTotal,
        this.roundGrandTotal,
        this.fCGrandTotal,
        this.roundFCGrandTotal,
        this.totalDiscount,
        this.fCTotalDiscount,
        this.totalTaxable,
        this.fCTotTaxable,
        this.totalTax,
        this.fCTotTax,
        this.remarks,
        this.deptId,
        this.userId,
        this.delFlag,
        this.attention,
        this.subject,
        this.comments,
        this.delivery,
        this.qtnNo,
        this.enqNo,
        this.salesNo,
        this.billSeriesId,
        this.qtnSubId});

  SaleOrderInsert.fromJson(Map<String, dynamic> json) {
    productId = json['ProductId'];
    productCode = json['ProductCode'];
    productDescr = json['ProductDescr'];
    orderNo = json['OrderNo'];
    unitId = json['UnitId'];
    unitName = json['UnitName'];
    prodQty = json['ProdQty'];
    prodRate = json['ProdRate'];
    fcProdRate = json['FcProdRate'];
    prodDisc = json['ProdDisc'];
    fcProdDisc = json['FcProdDisc'];
    taxableAmount = json['TaxableAmount'];
    fCTaxableAmount = json['FCTaxableAmount'];
    taxId = json['TaxId'];
    taxPercent = json['TaxPercent'];
    taxAmount = json['TaxAmount'];
    fCTaxAmount = json['FCTaxAmount'];
    amount = json['Amount'];
    fCAmount = json['FCAmount'];
    locnId = json['LocnId'];
    batchSNo = json['BatchSNo'];
    batch = json['Batch'];
    payType = json['PayType'];
    lPONumber = json['LPONumber'];
    custId = json['CustId'];
    custName = json['CustName'];
    custAddress = json['CustAddress'];
    invDate = json['InvDate'];
    invTerms = json['InvTerms'];
    expectedDate = json['ExpectedDate'];
    locId = json['LocId'];
    salesManId = json['SalesManId'];
    areaId = json['AreaId'];
    currencyId = json['CurrencyId'];
    currencyRate = json['CurrencyRate'];
    jobNumber = json['JobNumber'];
    grandTotal = json['GrandTotal'];
    roundGrandTotal = json['RoundGrandTotal'];
    fCGrandTotal = json['FCGrandTotal'];
    roundFCGrandTotal = json['RoundFCGrandTotal'];
    totalDiscount = json['TotalDiscount'];
    fCTotalDiscount = json['FCTotalDiscount'];
    totalTaxable = json['TotalTaxable'];
    fCTotTaxable = json['FCTotTaxable'];
    totalTax = json['TotalTax'];
    fCTotTax = json['FCTotTax'];
    remarks = json['Remarks'];
    deptId = json['DeptId'];
    userId = json['UserId'];
    delFlag = json['DelFlag'];
    attention = json['Attention'];
    subject = json['Subject'];
    comments = json['Comments'];
    delivery = json['Delivery'];
    qtnNo = json['QtnNo'];
    enqNo = json['EnqNo'];
    salesNo = json['SalesNo'];
    billSeriesId = json['BillSeriesId'];
    qtnSubId = json['QtnSubId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['ProductCode'] = this.productCode;
    data['ProductDescr'] = this.productDescr;
    data['OrderNo'] = this.orderNo;
    data['UnitId'] = this.unitId;
    data['UnitName'] = this.unitName;
    data['ProdQty'] = this.prodQty;
    data['ProdRate'] = this.prodRate;
    data['FcProdRate'] = this.fcProdRate;
    data['ProdDisc'] = this.prodDisc;
    data['FcProdDisc'] = this.fcProdDisc;
    data['TaxableAmount'] = this.taxableAmount;
    data['FCTaxableAmount'] = this.fCTaxableAmount;
    data['TaxId'] = this.taxId;
    data['TaxPercent'] = this.taxPercent;
    data['TaxAmount'] = this.taxAmount;
    data['FCTaxAmount'] = this.fCTaxAmount;
    data['Amount'] = this.amount;
    data['FCAmount'] = this.fCAmount;
    data['LocnId'] = this.locnId;
    data['BatchSNo'] = this.batchSNo;
    data['Batch'] = this.batch;
    data['PayType'] = this.payType;
    data['LPONumber'] = this.lPONumber;
    data['CustId'] = this.custId;
    data['CustName'] = this.custName;
    data['CustAddress'] = this.custAddress;
    data['InvDate'] = this.invDate;
    data['InvTerms'] = this.invTerms;
    data['ExpectedDate'] = this.expectedDate;
    data['LocId'] = this.locId;
    data['SalesManId'] = this.salesManId;
    data['AreaId'] = this.areaId;
    data['CurrencyId'] = this.currencyId;
    data['CurrencyRate'] = this.currencyRate;
    data['JobNumber'] = this.jobNumber;
    data['GrandTotal'] = this.grandTotal;
    data['RoundGrandTotal'] = this.roundGrandTotal;
    data['FCGrandTotal'] = this.fCGrandTotal;
    data['RoundFCGrandTotal'] = this.roundFCGrandTotal;
    data['TotalDiscount'] = this.totalDiscount;
    data['FCTotalDiscount'] = this.fCTotalDiscount;
    data['TotalTaxable'] = this.totalTaxable;
    data['FCTotTaxable'] = this.fCTotTaxable;
    data['TotalTax'] = this.totalTax;
    data['FCTotTax'] = this.fCTotTax;
    data['Remarks'] = this.remarks;
    data['DeptId'] = this.deptId;
    data['UserId'] = this.userId;
    data['DelFlag'] = this.delFlag;
    data['Attention'] = this.attention;
    data['Subject'] = this.subject;
    data['Comments'] = this.comments;
    data['Delivery'] = this.delivery;
    data['QtnNo'] = this.qtnNo;
    data['EnqNo'] = this.enqNo;
    data['SalesNo'] = this.salesNo;
    data['BillSeriesId'] = this.billSeriesId;
    data['QtnSubId'] = this.qtnSubId;
    return data;
  }
}
