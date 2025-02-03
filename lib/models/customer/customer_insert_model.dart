class CustomerInsert {
  int? custId;
  int? accountType;
  String? custType;
  int? custAccount;
  String? custName;
  String? tRNNumber;
  String? custStreet1;
  String? custStreet2;
  String? custCity1;
  int? delFlag;
  int? areaId;
  int? phoneNumber;
  String? custEmail;
  int? userId;
  int? deptId;
  String? mapId;

  CustomerInsert(
      {this.custId,
        this.accountType,
        this.custType,
        this.custAccount,
        this.custName,
        this.tRNNumber,
        this.custStreet1,
        this.custStreet2,
        this.custCity1,
        this.delFlag,
        this.areaId,
        this.phoneNumber,
        this.userId,
        this.deptId,
        this.mapId,
      });

  CustomerInsert.fromJson(Map<String, dynamic> json) {
    custId = json['CustId'];
    accountType = json['AccountType'];
    custType = json['CustType'];
    custAccount = json['CustAccount'];
    custName = json['CustName'];
    tRNNumber = json['TRNNumber'];
    custStreet1 = json['CustStreet1'];
    custStreet2 = json['CustStreet2'];
    custCity1 = json['CustCity1'];
    delFlag = json['DelFlag'];
    areaId = json['AreaId'];
    phoneNumber = json['PhoneNumber'];
    custEmail = json['CustEmail'];
    userId = json['UserId'];
    deptId = json['DeptId'];
    mapId = json['MapId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustId'] = this.custId;
    data['AccountType'] = this.accountType;
    data['CustType'] = this.custType;
    data['CustAccount'] = this.custAccount;
    data['CustName'] = this.custName;
    data['TRNNumber'] = this.tRNNumber;
    data['CustStreet1'] = this.custStreet1;
    data['CustStreet2'] = this.custStreet2;
    data['CustCity1'] = this.custCity1;
    data['DelFlag'] = this.delFlag;
    data['AreaId'] = this.areaId;
    data['PhoneNumber'] = this.phoneNumber;
    data['CustEmail'] = this.custEmail;
    data['UserId'] = this.userId;
    data['DeptId'] = this.deptId;
    data['MapId'] = this.mapId;
    return data;
  }
}
