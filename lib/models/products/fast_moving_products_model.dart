class FastMovingProducts {
  Null? condition;
  Null? dateFrom;
  Null? dateTo;
  Null? number;
  String? itemCode;
  String? itemDesc;
  int? groupId;
  Null? subGroupId;
  int? categoryId;
  Null? subCategoryId;
  Null? groupName;
  Null? subGroupName;
  String? categoryName;
  String? subCategoryName;
  String? qty;
  String? avgCost;
  Null? rate;
  String? amount;
  Null? userId;
  String? stock;
  Null? importDate;
  Null? localDate;
  Null? type;
  Null? fromDate;
  Null? toDate;

  FastMovingProducts(
      {this.condition,
        this.dateFrom,
        this.dateTo,
        this.number,
        this.itemCode,
        this.itemDesc,
        this.groupId,
        this.subGroupId,
        this.categoryId,
        this.subCategoryId,
        this.groupName,
        this.subGroupName,
        this.categoryName,
        this.subCategoryName,
        this.qty,
        this.avgCost,
        this.rate,
        this.amount,
        this.userId,
        this.stock,
        this.importDate,
        this.localDate,
        this.type,
        this.fromDate,
        this.toDate});

  FastMovingProducts.fromJson(Map<String, dynamic> json) {
    condition = json['Condition'];
    dateFrom = json['DateFrom'];
    dateTo = json['DateTo'];
    number = json['Number'];
    itemCode = json['ItemCode'];
    itemDesc = json['ItemDesc'];
    groupId = json['GroupId'];
    subGroupId = json['SubGroupId'];
    categoryId = json['CategoryId'];
    subCategoryId = json['SubCategoryId'];
    groupName = json['GroupName'];
    subGroupName = json['SubGroupName'];
    categoryName = json['CategoryName'];
    subCategoryName = json['SubCategoryName'];
    qty = json['Qty'];
    avgCost = json['AvgCost'];
    rate = json['Rate'];
    amount = json['Amount'];
    userId = json['UserId'];
    stock = json['Stock'];
    importDate = json['ImportDate'];
    localDate = json['LocalDate'];
    type = json['Type'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Condition'] = this.condition;
    data['DateFrom'] = this.dateFrom;
    data['DateTo'] = this.dateTo;
    data['Number'] = this.number;
    data['ItemCode'] = this.itemCode;
    data['ItemDesc'] = this.itemDesc;
    data['GroupId'] = this.groupId;
    data['SubGroupId'] = this.subGroupId;
    data['CategoryId'] = this.categoryId;
    data['SubCategoryId'] = this.subCategoryId;
    data['GroupName'] = this.groupName;
    data['SubGroupName'] = this.subGroupName;
    data['CategoryName'] = this.categoryName;
    data['SubCategoryName'] = this.subCategoryName;
    data['Qty'] = this.qty;
    data['AvgCost'] = this.avgCost;
    data['Rate'] = this.rate;
    data['Amount'] = this.amount;
    data['UserId'] = this.userId;
    data['Stock'] = this.stock;
    data['ImportDate'] = this.importDate;
    data['LocalDate'] = this.localDate;
    data['Type'] = this.type;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    return data;
  }
}
