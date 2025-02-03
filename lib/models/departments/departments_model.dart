class Departments {
  List<OList>? oList;
  bool? success;

  Departments({this.oList, this.success});

  Departments.fromJson(Map<String, dynamic> json) {
    if (json['oList'] != null) {
      oList = <OList>[];
      json['oList'].forEach((v) {
        oList!.add(new OList.fromJson(v));
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

class OList {
  String? departmentName;
  String? departmentCode;
  String? departmentDescription;
  int? departmentId;
  int? delFlag;
  Null? status;
  Null? message;
  Null? userId;
  Null? resourceId;
  Null? code;
  Null? account;
  Null? description;
  Null? notes;
  Null? user;

  OList(
      {this.departmentName,
        this.departmentCode,
        this.departmentDescription,
        this.departmentId,
        this.delFlag,
        this.status,
        this.message,
        this.userId,
        this.resourceId,
        this.code,
        this.account,
        this.description,
        this.notes,
        this.user});

  OList.fromJson(Map<String, dynamic> json) {
    departmentName = json['DepartmentName'];
    departmentCode = json['DepartmentCode'];
    departmentDescription = json['DepartmentDescription'];
    departmentId = json['DepartmentId'];
    delFlag = json['DelFlag'];
    status = json['Status'];
    message = json['Message'];
    userId = json['UserId'];
    resourceId = json['ResourceId'];
    code = json['Code'];
    account = json['Account'];
    description = json['Description'];
    notes = json['Notes'];
    user = json['User'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DepartmentName'] = this.departmentName;
    data['DepartmentCode'] = this.departmentCode;
    data['DepartmentDescription'] = this.departmentDescription;
    data['DepartmentId'] = this.departmentId;
    data['DelFlag'] = this.delFlag;
    data['Status'] = this.status;
    data['Message'] = this.message;
    data['UserId'] = this.userId;
    data['ResourceId'] = this.resourceId;
    data['Code'] = this.code;
    data['Account'] = this.account;
    data['Description'] = this.description;
    data['Notes'] = this.notes;
    data['User'] = this.user;
    return data;
  }
}
