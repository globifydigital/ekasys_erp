class SalesOrderList {
  int? salesOrderMainId;
  int? salesOrderSubId;
  int? billSlNo;
  int? billSeriesId;
  Null? blSlNo;
  Null? blSeriesId;
  int? orderNo;
  Null? ordNo;
  Null? billDescription;
  Null? payType;
  String? lPONumber;
  int? custId;
  String? custAddress;
  String? custName;
  String? invDate;
  Null? invTerms;
  Null? expectedDate;
  int? locId;
  int? salesManId;
  int? areaId;
  int? currencyId;
  int? currencyRate;
  int? jobNumber;
  Null? jobCode;
  int? grandTotal;
  double? fCGrandTotal;
  int? totalDiscount;
  int? fCTotalDiscount;
  int? totalTaxable;
  int? fCTotTaxable;
  int? totalTax;
  int? fCTotTax;
  Null? remarks;
  int? deptId;
  int? userId;
  Null? currentDate;
  int? productId;
  Null? productCode;
  Null? productDescr;
  int? unitId;
  Null? unitName;
  int? prodQty;
  int? prodRate;
  int? fcProdRate;
  int? prodDisc;
  int? fcProdDisc;
  int? taxableAmount;
  int? fCTaxableAmount;
  int? taxPercent;
  int? taxId;
  int? taxAmount;
  int? fCTaxAmount;
  int? amount;
  int? fCAmount;
  int? locnId;
  int? batchSNo;
  Null? batch;
  int? sumtotqty;
  int? lPCost;
  int? avgCost;
  int? lastSellingPrice;
  Null? locationstock;
  Null? custstats;
  int? roundGrandTotal;
  int? roundFCGrandTotal;
  int? custLastSellingPrice;
  int? delFlag;
  Null? status;
  Null? attention;
  Null? subject;
  Null? comments;
  Null? delivery;
  int? qtnNo;
  int? enqNo;
  int? salesNo;
  Null? salesMan;
  Null? area;
  Null? currency;
  String? location;
  Null? fromDate;
  Null? toDate;
  int? qtnSubId;
  Null? startTime;
  Null? endTime;
  int? designRate;
  Null? lOTNo;
  Null? phoneNumber;
  String? departmentName;
  Null? binA;
  Null? binB;
  Null? binC;
  Null? binD;
  Null? binE;
  Null? binF;
  Null? binG;
  Null? binH;
  int? belowCostFlag;

  SalesOrderList(
      {this.salesOrderMainId,
        this.salesOrderSubId,
        this.billSlNo,
        this.billSeriesId,
        this.blSlNo,
        this.blSeriesId,
        this.orderNo,
        this.ordNo,
        this.billDescription,
        this.payType,
        this.lPONumber,
        this.custId,
        this.custAddress,
        this.custName,
        this.invDate,
        this.invTerms,
        this.expectedDate,
        this.locId,
        this.salesManId,
        this.areaId,
        this.currencyId,
        this.currencyRate,
        this.jobNumber,
        this.jobCode,
        this.grandTotal,
        this.fCGrandTotal,
        this.totalDiscount,
        this.fCTotalDiscount,
        this.totalTaxable,
        this.fCTotTaxable,
        this.totalTax,
        this.fCTotTax,
        this.remarks,
        this.deptId,
        this.userId,
        this.currentDate,
        this.productId,
        this.productCode,
        this.productDescr,
        this.unitId,
        this.unitName,
        this.prodQty,
        this.prodRate,
        this.fcProdRate,
        this.prodDisc,
        this.fcProdDisc,
        this.taxableAmount,
        this.fCTaxableAmount,
        this.taxPercent,
        this.taxId,
        this.taxAmount,
        this.fCTaxAmount,
        this.amount,
        this.fCAmount,
        this.locnId,
        this.batchSNo,
        this.batch,
        this.sumtotqty,
        this.lPCost,
        this.avgCost,
        this.lastSellingPrice,
        this.locationstock,
        this.custstats,
        this.roundGrandTotal,
        this.roundFCGrandTotal,
        this.custLastSellingPrice,
        this.delFlag,
        this.status,
        this.attention,
        this.subject,
        this.comments,
        this.delivery,
        this.qtnNo,
        this.enqNo,
        this.salesNo,
        this.salesMan,
        this.area,
        this.currency,
        this.location,
        this.fromDate,
        this.toDate,
        this.qtnSubId,
        this.startTime,
        this.endTime,
        this.designRate,
        this.lOTNo,
        this.phoneNumber,
        this.departmentName,
        this.binA,
        this.binB,
        this.binC,
        this.binD,
        this.binE,
        this.binF,
        this.binG,
        this.binH,
        this.belowCostFlag});

  SalesOrderList.fromJson(Map<String, dynamic> json) {
    salesOrderMainId = json['SalesOrderMainId'];
    salesOrderSubId = json['SalesOrderSubId'];
    billSlNo = json['BillSlNo'];
    billSeriesId = json['BillSeriesId'];
    blSlNo = json['BlSlNo'];
    blSeriesId = json['BlSeriesId'];
    orderNo = json['OrderNo'];
    ordNo = json['OrdNo'];
    billDescription = json['BillDescription'];
    payType = json['PayType'];
    lPONumber = json['LPONumber'];
    custId = json['CustId'];
    custAddress = json['CustAddress'];
    custName = json['CustName'];
    invDate = json['InvDate'];
    invTerms = json['InvTerms'];
    expectedDate = json['ExpectedDate'];
    locId = json['LocId'];
    salesManId = json['SalesManId'];
    areaId = json['AreaId'];
    currencyId = json['CurrencyId'];
    currencyRate = json['CurrencyRate'];
    jobNumber = json['JobNumber'];
    jobCode = json['JobCode'];
    grandTotal = json['GrandTotal'];
    fCGrandTotal = json['FCGrandTotal'];
    totalDiscount = json['TotalDiscount'];
    fCTotalDiscount = json['FCTotalDiscount'];
    totalTaxable = json['TotalTaxable'];
    fCTotTaxable = json['FCTotTaxable'];
    totalTax = json['TotalTax'];
    fCTotTax = json['FCTotTax'];
    remarks = json['Remarks'];
    deptId = json['DeptId'];
    userId = json['UserId'];
    currentDate = json['CurrentDate'];
    productId = json['ProductId'];
    productCode = json['ProductCode'];
    productDescr = json['ProductDescr'];
    unitId = json['UnitId'];
    unitName = json['UnitName'];
    prodQty = json['ProdQty'];
    prodRate = json['ProdRate'];
    fcProdRate = json['FcProdRate'];
    prodDisc = json['ProdDisc'];
    fcProdDisc = json['FcProdDisc'];
    taxableAmount = json['TaxableAmount'];
    fCTaxableAmount = json['FCTaxableAmount'];
    taxPercent = json['TaxPercent'];
    taxId = json['TaxId'];
    taxAmount = json['TaxAmount'];
    fCTaxAmount = json['FCTaxAmount'];
    amount = json['Amount'];
    fCAmount = json['FCAmount'];
    locnId = json['LocnId'];
    batchSNo = json['BatchSNo'];
    batch = json['Batch'];
    sumtotqty = json['Sumtotqty'];
    lPCost = json['LPCost'];
    avgCost = json['AvgCost'];
    lastSellingPrice = json['LastSellingPrice'];
    locationstock = json['Locationstock'];
    custstats = json['custstats'];
    roundGrandTotal = json['RoundGrandTotal'];
    roundFCGrandTotal = json['RoundFCGrandTotal'];
    custLastSellingPrice = json['CustLastSellingPrice'];
    delFlag = json['DelFlag'];
    status = json['Status'];
    attention = json['Attention'];
    subject = json['Subject'];
    comments = json['Comments'];
    delivery = json['Delivery'];
    qtnNo = json['QtnNo'];
    enqNo = json['EnqNo'];
    salesNo = json['SalesNo'];
    salesMan = json['SalesMan'];
    area = json['Area'];
    currency = json['Currency'];
    location = json['Location'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    qtnSubId = json['QtnSubId'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    designRate = json['DesignRate'];
    lOTNo = json['LOTNo'];
    phoneNumber = json['PhoneNumber'];
    departmentName = json['DepartmentName'];
    binA = json['Bin_A'];
    binB = json['Bin_B'];
    binC = json['Bin_C'];
    binD = json['Bin_D'];
    binE = json['Bin_E'];
    binF = json['Bin_F'];
    binG = json['Bin_G'];
    binH = json['Bin_H'];
    belowCostFlag = json['BelowCostFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SalesOrderMainId'] = this.salesOrderMainId;
    data['SalesOrderSubId'] = this.salesOrderSubId;
    data['BillSlNo'] = this.billSlNo;
    data['BillSeriesId'] = this.billSeriesId;
    data['BlSlNo'] = this.blSlNo;
    data['BlSeriesId'] = this.blSeriesId;
    data['OrderNo'] = this.orderNo;
    data['OrdNo'] = this.ordNo;
    data['BillDescription'] = this.billDescription;
    data['PayType'] = this.payType;
    data['LPONumber'] = this.lPONumber;
    data['CustId'] = this.custId;
    data['CustAddress'] = this.custAddress;
    data['CustName'] = this.custName;
    data['InvDate'] = this.invDate;
    data['InvTerms'] = this.invTerms;
    data['ExpectedDate'] = this.expectedDate;
    data['LocId'] = this.locId;
    data['SalesManId'] = this.salesManId;
    data['AreaId'] = this.areaId;
    data['CurrencyId'] = this.currencyId;
    data['CurrencyRate'] = this.currencyRate;
    data['JobNumber'] = this.jobNumber;
    data['JobCode'] = this.jobCode;
    data['GrandTotal'] = this.grandTotal;
    data['FCGrandTotal'] = this.fCGrandTotal;
    data['TotalDiscount'] = this.totalDiscount;
    data['FCTotalDiscount'] = this.fCTotalDiscount;
    data['TotalTaxable'] = this.totalTaxable;
    data['FCTotTaxable'] = this.fCTotTaxable;
    data['TotalTax'] = this.totalTax;
    data['FCTotTax'] = this.fCTotTax;
    data['Remarks'] = this.remarks;
    data['DeptId'] = this.deptId;
    data['UserId'] = this.userId;
    data['CurrentDate'] = this.currentDate;
    data['ProductId'] = this.productId;
    data['ProductCode'] = this.productCode;
    data['ProductDescr'] = this.productDescr;
    data['UnitId'] = this.unitId;
    data['UnitName'] = this.unitName;
    data['ProdQty'] = this.prodQty;
    data['ProdRate'] = this.prodRate;
    data['FcProdRate'] = this.fcProdRate;
    data['ProdDisc'] = this.prodDisc;
    data['FcProdDisc'] = this.fcProdDisc;
    data['TaxableAmount'] = this.taxableAmount;
    data['FCTaxableAmount'] = this.fCTaxableAmount;
    data['TaxPercent'] = this.taxPercent;
    data['TaxId'] = this.taxId;
    data['TaxAmount'] = this.taxAmount;
    data['FCTaxAmount'] = this.fCTaxAmount;
    data['Amount'] = this.amount;
    data['FCAmount'] = this.fCAmount;
    data['LocnId'] = this.locnId;
    data['BatchSNo'] = this.batchSNo;
    data['Batch'] = this.batch;
    data['Sumtotqty'] = this.sumtotqty;
    data['LPCost'] = this.lPCost;
    data['AvgCost'] = this.avgCost;
    data['LastSellingPrice'] = this.lastSellingPrice;
    data['Locationstock'] = this.locationstock;
    data['custstats'] = this.custstats;
    data['RoundGrandTotal'] = this.roundGrandTotal;
    data['RoundFCGrandTotal'] = this.roundFCGrandTotal;
    data['CustLastSellingPrice'] = this.custLastSellingPrice;
    data['DelFlag'] = this.delFlag;
    data['Status'] = this.status;
    data['Attention'] = this.attention;
    data['Subject'] = this.subject;
    data['Comments'] = this.comments;
    data['Delivery'] = this.delivery;
    data['QtnNo'] = this.qtnNo;
    data['EnqNo'] = this.enqNo;
    data['SalesNo'] = this.salesNo;
    data['SalesMan'] = this.salesMan;
    data['Area'] = this.area;
    data['Currency'] = this.currency;
    data['Location'] = this.location;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['QtnSubId'] = this.qtnSubId;
    data['StartTime'] = this.startTime;
    data['EndTime'] = this.endTime;
    data['DesignRate'] = this.designRate;
    data['LOTNo'] = this.lOTNo;
    data['PhoneNumber'] = this.phoneNumber;
    data['DepartmentName'] = this.departmentName;
    data['Bin_A'] = this.binA;
    data['Bin_B'] = this.binB;
    data['Bin_C'] = this.binC;
    data['Bin_D'] = this.binD;
    data['Bin_E'] = this.binE;
    data['Bin_F'] = this.binF;
    data['Bin_G'] = this.binG;
    data['Bin_H'] = this.binH;
    data['BelowCostFlag'] = this.belowCostFlag;
    return data;
  }
}
