class AllProducts {
  int? customerId;
  int? itemId;
  int? openqty;
  int? stock;
  String? itemCode;
  String? description;
  String? taxName;
  double? sellingPrice;
  double? avgCost;
  String? model1;
  String? model2;
  String? model3;
  int? active;
  String? status;
  int? slno;
  String? unitName;
  String? grpName;
  String? sbgrpName;
  String? categoryName;
  String? subCategoryName;
  int? groupId;
  int? categoryId;

  AllProducts(
      {this.itemId,
        this.openqty,
        this.stock,
        this.itemCode,
        this.description,
        this.taxName,
        this.sellingPrice,
        this.avgCost,
        this.model1,
        this.model2,
        this.model3,
        this.active,
        this.status,
        this.slno,
        this.unitName,
        this.grpName,
        this.sbgrpName,
        this.categoryName,
        this.subCategoryName,
        this.groupId,
        this.categoryId});

  AllProducts.fromJson(Map<String, dynamic> json) {
    itemId = json['ItemId'];
    openqty = json['openqty'];
    stock = json['stock'];
    itemCode = json['ItemCode'];
    description = json['Description'];
    taxName = json['TaxName'];
    sellingPrice = json['SellingPrice'];
    avgCost = json['AvgCost'];
    model1 = json['Model1'];
    model2 = json['Model2'];
    model3 = json['Model3'];
    active = json['Active'];
    status = json['Status'];
    slno = json['Slno'];
    unitName = json['UnitName'];
    grpName = json['GrpName'];
    sbgrpName = json['SbgrpName'];
    categoryName = json['CategoryName'];
    subCategoryName = json['SubCategoryName'];
    groupId = json['GroupId'];
    categoryId = json['CategoryId'];
  }

  AllProducts.fromdbJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    openqty = json['openqty'];
    stock = json['stock'];
    itemCode = json['itemCode'];
    description = json['description'];
    taxName = json['taxName'];
    sellingPrice = json['sellingPrice'];
    avgCost = json['avgCost'];
    model1 = json['model1'] != null ? json['model1'] : "";
    model2 = json['model2'] != null ? json['model2'] : "";
    model3 = json['model3'] != null ? json['model3'] : "";
    active = json['active'];
    status = json['status'];
    slno = json['slno'];
    unitName = json['unitName'];
    grpName = json['grpName'];
    sbgrpName = json['sbgrpName'] != null ? json['sbgrpName'] : "";
    categoryName = json['categoryName'];
    subCategoryName = json['subCategoryName'] != "" ? json['subCategoryName'] : "";
    groupId = json['groupId'];
    categoryId = json['categoryId'];
    customerId = json['customerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemId'] = itemId;
    data['openqty'] = openqty;
    data['stock'] = stock;
    data['ItemCode'] = itemCode;
    data['Description'] = description;
    data['TaxName'] = taxName;
    data['SellingPrice'] = sellingPrice;
    data['AvgCost'] = avgCost;
    data['Model1'] = model1;
    data['Model2'] = model2;
    data['Model3'] = model3;
    data['Active'] = active;
    data['Status'] = status;
    data['Slno'] = slno;
    data['UnitName'] = unitName;
    data['GrpName'] = grpName;
    data['SbgrpName'] = sbgrpName;
    data['CategoryName'] = categoryName;
    data['SubCategoryName'] = subCategoryName;
    data['GroupId'] = groupId;
    data['CategoryId'] = categoryId;
    return data;
  }

  Map<String, dynamic> toDbJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemId'] = itemId;
    data['openqty'] = openqty;
    data['stock'] = stock;
    data['ItemCode'] = itemCode;
    data['Description'] = description;
    data['TaxName'] = taxName;
    data['SellingPrice'] = sellingPrice;
    data['AvgCost'] = avgCost;
    data['Model1'] = model1;
    data['Model2'] = model2;
    data['Model3'] = model3;
    data['Active'] = active;
    data['Status'] = status;
    data['Slno'] = slno;
    data['UnitName'] = unitName;
    data['GrpName'] = grpName;
    data['SbgrpName'] = sbgrpName;
    data['CategoryName'] = categoryName;
    data['SubCategoryName'] = subCategoryName;
    data['GroupId'] = groupId;
    data['CategoryId'] = categoryId;
    data['customerId'] = customerId;
    return data;
  }
}
