class Customers {
  List<CustomerList>? oList;
  bool? success;

  Customers({this.oList, this.success});

  Customers.fromJson(Map<String, dynamic> json) {
    if (json['oList'] != null) {
      oList = <CustomerList>[];
      json['oList'].forEach((v) {
        oList!.add(new CustomerList.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.oList != null) {
      data['oList'] = this.oList!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class CustomerList {
  int? iDCUST;
  int? iDSUPP;
  Null? custcode;
  Null? supplierCode;
  Null? supplierName;
  int? linkCode;
  int? accid;
  Null? licenseNo;
  int? userId;
  int? deptId;
  Null? curdate;
  int? custId;
  int? supplierid;
  int? accountType;
  Null? custType;
  String? custAccount;
  String? custName;
  num? openBalance;
  int? dueDays;
  num? creditLimit;
  int? custTermsId;
  int? custTerms;
  String? tRNNumber;
  int? salesmanId;
  int? salesmanName;
  String? salesMan;
  int? priceGroupId;
  Null? priceGroup;
  int? currencyId;
  String? currencyType;
  int? areaId;
  Null? area;
  int? custStatusId;
  Null? custStatus;
  String? custStreet1;
  String? custStreet2;
  String? custCity1;
  String? custCity2;
  String? custState1;
  String? custState2;
  String? custPin1;
  String? custPin2;
  String? custCountry1;
  String? custCountry2;
  String? custNotes;
  String? custContactName1;
  String? custContactNo1;
  String? custContactName2;
  String? custContactNo2;
  String? custContactName3;
  String? custContactNo3;
  String? custEmailId;
  String? emailId;
  String? mapId;
  int? delFlag;
  Null? status;
  int? cstyp;
  String? phoneNumber;

  CustomerList(
      {this.iDCUST,
        this.iDSUPP,
        this.custcode,
        this.supplierCode,
        this.supplierName,
        this.linkCode,
        this.accid,
        this.licenseNo,
        this.userId,
        this.deptId,
        this.curdate,
        this.custId,
        this.supplierid,
        this.accountType,
        this.custType,
        this.custAccount,
        this.custName,
        this.openBalance,
        this.dueDays,
        this.creditLimit,
        this.custTermsId,
        this.custTerms,
        this.tRNNumber,
        this.salesmanId,
        this.salesmanName,
        this.salesMan,
        this.priceGroupId,
        this.priceGroup,
        this.currencyId,
        this.currencyType,
        this.areaId,
        this.area,
        this.custStatusId,
        this.custStatus,
        this.custStreet1,
        this.custStreet2,
        this.custCity1,
        this.custCity2,
        this.custState1,
        this.custState2,
        this.custPin1,
        this.custPin2,
        this.custCountry1,
        this.custCountry2,
        this.custNotes,
        this.custContactName1,
        this.custContactNo1,
        this.custContactName2,
        this.custContactNo2,
        this.custContactName3,
        this.custContactNo3,
        this.custEmailId,
        this.emailId,
        this.mapId,
        this.delFlag,
        this.status,
        this.cstyp,
        this.phoneNumber});

  CustomerList.fromJson(Map<String, dynamic> json) {
    iDCUST = json['IDCUST'];
    iDSUPP = json['IDSUPP'];
    custcode = json['Custcode'];
    supplierCode = json['SupplierCode'];
    supplierName = json['SupplierName'];
    linkCode = json['LinkCode'];
    accid = json['Accid'];
    licenseNo = json['licenseNo'];
    userId = json['UserId'];
    deptId = json['DeptId'];
    curdate = json['Curdate'];
    custId = json['CustId'];
    supplierid = json['supplierid'];
    accountType = json['AccountType'];
    custType = json['CustType'];
    custAccount = json['CustAccount'];
    custName = json['CustName'];
    openBalance = json['OpenBalance'];
    dueDays = json['DueDays'];
    creditLimit = json['CreditLimit'];
    custTermsId = json['CustTermsId'];
    custTerms = json['CustTerms'];
    tRNNumber = json['TRNNumber'];
    salesmanId = json['SalesmanId'];
    salesmanName = json['SalesmanName'];
    salesMan = json['SalesMan'];
    priceGroupId = json['PriceGroupId'];
    priceGroup = json['PriceGroup'];
    currencyId = json['CurrencyId'];
    currencyType = json['CurrencyType'];
    areaId = json['AreaId'];
    area = json['Area'];
    custStatusId = json['CustStatusId'];
    custStatus = json['CustStatus'];
    custStreet1 = json['CustStreet1'];
    custStreet2 = json['CustStreet2'];
    custCity1 = json['CustCity1'];
    custCity2 = json['CustCity2'];
    custState1 = json['CustState1'];
    custState2 = json['CustState2'];
    custPin1 = json['CustPin1'];
    custPin2 = json['CustPin2'];
    custCountry1 = json['CustCountry1'];
    custCountry2 = json['CustCountry2'];
    custNotes = json['CustNotes'];
    custContactName1 = json['CustContactName1'];
    custContactNo1 = json['CustContactNo1'];
    custContactName2 = json['CustContactName2'];
    custContactNo2 = json['CustContactNo2'];
    custContactName3 = json['CustContactName3'];
    custContactNo3 = json['CustContactNo3'];
    custEmailId = json['CustEmailId'];
    emailId = json['EmailId'];
    mapId = json['MapId'];
    delFlag = json['DelFlag'];
    status = json['Status'];
    cstyp = json['cstyp'];
    phoneNumber = json['PhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDCUST'] = this.iDCUST;
    data['IDSUPP'] = this.iDSUPP;
    data['Custcode'] = this.custcode;
    data['SupplierCode'] = this.supplierCode;
    data['SupplierName'] = this.supplierName;
    data['LinkCode'] = this.linkCode;
    data['Accid'] = this.accid;
    data['licenseNo'] = this.licenseNo;
    data['UserId'] = this.userId;
    data['DeptId'] = this.deptId;
    data['Curdate'] = this.curdate;
    data['CustId'] = this.custId;
    data['supplierid'] = this.supplierid;
    data['AccountType'] = this.accountType;
    data['CustType'] = this.custType;
    data['CustAccount'] = this.custAccount;
    data['CustName'] = this.custName;
    data['OpenBalance'] = this.openBalance;
    data['DueDays'] = this.dueDays;
    data['CreditLimit'] = this.creditLimit;
    data['CustTermsId'] = this.custTermsId;
    data['CustTerms'] = this.custTerms;
    data['TRNNumber'] = this.tRNNumber;
    data['SalesmanId'] = this.salesmanId;
    data['SalesmanName'] = this.salesmanName;
    data['SalesMan'] = this.salesMan;
    data['PriceGroupId'] = this.priceGroupId;
    data['PriceGroup'] = this.priceGroup;
    data['CurrencyId'] = this.currencyId;
    data['CurrencyType'] = this.currencyType;
    data['AreaId'] = this.areaId;
    data['Area'] = this.area;
    data['CustStatusId'] = this.custStatusId;
    data['CustStatus'] = this.custStatus;
    data['CustStreet1'] = this.custStreet1;
    data['CustStreet2'] = this.custStreet2;
    data['CustCity1'] = this.custCity1;
    data['CustCity2'] = this.custCity2;
    data['CustState1'] = this.custState1;
    data['CustState2'] = this.custState2;
    data['CustPin1'] = this.custPin1;
    data['CustPin2'] = this.custPin2;
    data['CustCountry1'] = this.custCountry1;
    data['CustCountry2'] = this.custCountry2;
    data['CustNotes'] = this.custNotes;
    data['CustContactName1'] = this.custContactName1;
    data['CustContactNo1'] = this.custContactNo1;
    data['CustContactName2'] = this.custContactName2;
    data['CustContactNo2'] = this.custContactNo2;
    data['CustContactName3'] = this.custContactName3;
    data['CustContactNo3'] = this.custContactNo3;
    data['CustEmailId'] = this.custEmailId;
    data['EmailId'] = this.emailId;
    data['MapId'] = this.mapId;
    data['DelFlag'] = this.delFlag;
    data['Status'] = this.status;
    data['cstyp'] = this.cstyp;
    data['PhoneNumber'] = this.phoneNumber;
    return data;
  }
}
