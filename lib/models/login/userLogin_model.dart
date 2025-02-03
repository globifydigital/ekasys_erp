class UserLoginModel {
  List<userDetailsList>? oList;
  bool? success;

  UserLoginModel({this.oList, this.success});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    if (json['oList'] != null) {
      oList = <userDetailsList>[];
      json['oList'].forEach((v) {
        oList!.add(new userDetailsList.fromJson(v));
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

class userDetailsList {
  String? dSalesPrintId;
  String? dSalesReturnPrintId;
  String? dVoucherPrintId;
  String? dQuotationPrintId;
  String? dPrintColor;
  String? userId;
  int? userLoginId;
  String? deptId;
  int? userDeptId;
  int? userDivId;
  String? divId;
  String? locationID;
  String? userName;
  Null? password;
  String? departmentName;
  String? userMenu;
  String? flag;
  bool? persist;
  Null? empCode;
  Null? empName;
  Null? inTime;
  Null? outTime;
  Null? atendanceDate;
  int? totalWorkingHrs;
  Null? fromDate;
  Null? toDate;
  Null? totalWorkHrs;
  String? dCompanyName;
  String? dAddress;
  String? dPhoneNo;
  String? dEmail;
  String? dFax;
  String? dTRNNo;

  userDetailsList(
      {this.dSalesPrintId,
        this.dSalesReturnPrintId,
        this.dVoucherPrintId,
        this.dQuotationPrintId,
        this.dPrintColor,
        this.userId,
        this.userLoginId,
        this.deptId,
        this.userDeptId,
        this.userDivId,
        this.divId,
        this.locationID,
        this.userName,
        this.password,
        this.departmentName,
        this.userMenu,
        this.flag,
        this.persist,
        this.empCode,
        this.empName,
        this.inTime,
        this.outTime,
        this.atendanceDate,
        this.totalWorkingHrs,
        this.fromDate,
        this.toDate,
        this.totalWorkHrs,
        this.dCompanyName,
        this.dAddress,
        this.dPhoneNo,
        this.dEmail,
        this.dFax,
        this.dTRNNo});

  userDetailsList.fromJson(Map<String, dynamic> json) {
    dSalesPrintId = json['D_SalesPrintId'];
    dSalesReturnPrintId = json['D_SalesReturnPrintId'];
    dVoucherPrintId = json['D_VoucherPrintId'];
    dQuotationPrintId = json['D_QuotationPrintId'];
    dPrintColor = json['D_PrintColor'];
    userId = json['UserId'];
    userLoginId = json['UserLoginId'];
    deptId = json['DeptId'];
    userDeptId = json['UserDeptId'];
    userDivId = json['UserDivId'];
    divId = json['DivId'];
    locationID = json['LocationID'];
    userName = json['UserName'];
    password = json['Password'];
    departmentName = json['DepartmentName'];
    userMenu = json['UserMenu'];
    flag = json['flag'];
    persist = json['Persist'];
    empCode = json['EmpCode'];
    empName = json['EmpName'];
    inTime = json['InTime'];
    outTime = json['OutTime'];
    atendanceDate = json['AtendanceDate'];
    totalWorkingHrs = json['TotalWorkingHrs'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    totalWorkHrs = json['TotalWorkHrs'];
    dCompanyName = json['DCompanyName'];
    dAddress = json['DAddress'];
    dPhoneNo = json['DPhoneNo'];
    dEmail = json['DEmail'];
    dFax = json['DFax'];
    dTRNNo = json['DTRNNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['D_SalesPrintId'] = this.dSalesPrintId;
    data['D_SalesReturnPrintId'] = this.dSalesReturnPrintId;
    data['D_VoucherPrintId'] = this.dVoucherPrintId;
    data['D_QuotationPrintId'] = this.dQuotationPrintId;
    data['D_PrintColor'] = this.dPrintColor;
    data['UserId'] = this.userId;
    data['UserLoginId'] = this.userLoginId;
    data['DeptId'] = this.deptId;
    data['UserDeptId'] = this.userDeptId;
    data['UserDivId'] = this.userDivId;
    data['DivId'] = this.divId;
    data['LocationID'] = this.locationID;
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    data['DepartmentName'] = this.departmentName;
    data['UserMenu'] = this.userMenu;
    data['flag'] = this.flag;
    data['Persist'] = this.persist;
    data['EmpCode'] = this.empCode;
    data['EmpName'] = this.empName;
    data['InTime'] = this.inTime;
    data['OutTime'] = this.outTime;
    data['AtendanceDate'] = this.atendanceDate;
    data['TotalWorkingHrs'] = this.totalWorkingHrs;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['TotalWorkHrs'] = this.totalWorkHrs;
    data['DCompanyName'] = this.dCompanyName;
    data['DAddress'] = this.dAddress;
    data['DPhoneNo'] = this.dPhoneNo;
    data['DEmail'] = this.dEmail;
    data['DFax'] = this.dFax;
    data['DTRNNo'] = this.dTRNNo;
    return data;
  }
}
