class Locations {
  List<LocationList>? oList;
  bool? success;

  Locations({this.oList, this.success});

  Locations.fromJson(Map<String, dynamic> json) {
    if (json['oList'] != null) {
      oList = <LocationList>[];
      json['oList'].forEach((v) {
        oList!.add(new LocationList.fromJson(v));
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

class LocationList {
  int? driverId;
  Null? driverName;
  int? eRPDeptId;
  Null? address;
  Null? phoneNumber;
  Null? licenceNumber;
  Null? status;
  int? delFlag;
  int? nodeId;
  Null? nodeName;
  int? acntcode;
  int? nodePrevid;
  String? areaName;
  String? groupName;
  String? areaCode;
  String? description;
  int? areaId;
  int? defaultArea;
  int? areaGrpId;
  Null? message;
  int? userId;

  LocationList(
      {this.driverId,
        this.driverName,
        this.eRPDeptId,
        this.address,
        this.phoneNumber,
        this.licenceNumber,
        this.status,
        this.delFlag,
        this.nodeId,
        this.nodeName,
        this.acntcode,
        this.nodePrevid,
        this.areaName,
        this.groupName,
        this.areaCode,
        this.description,
        this.areaId,
        this.defaultArea,
        this.areaGrpId,
        this.message,
        this.userId});

  LocationList.fromJson(Map<String, dynamic> json) {
    driverId = json['DriverId'];
    driverName = json['DriverName'];
    eRPDeptId = json['ERPDeptId'];
    address = json['Address'];
    phoneNumber = json['PhoneNumber'];
    licenceNumber = json['LicenceNumber'];
    status = json['Status'];
    delFlag = json['DelFlag'];
    nodeId = json['NodeId'];
    nodeName = json['NodeName'];
    acntcode = json['acntcode'];
    nodePrevid = json['NodePrevid'];
    areaName = json['AreaName'];
    groupName = json['GroupName'];
    areaCode = json['AreaCode'];
    description = json['Description'];
    areaId = json['AreaId'];
    defaultArea = json['DefaultArea'];
    areaGrpId = json['AreaGrpId'];
    message = json['Message'];
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DriverId'] = this.driverId;
    data['DriverName'] = this.driverName;
    data['ERPDeptId'] = this.eRPDeptId;
    data['Address'] = this.address;
    data['PhoneNumber'] = this.phoneNumber;
    data['LicenceNumber'] = this.licenceNumber;
    data['Status'] = this.status;
    data['DelFlag'] = this.delFlag;
    data['NodeId'] = this.nodeId;
    data['NodeName'] = this.nodeName;
    data['acntcode'] = this.acntcode;
    data['NodePrevid'] = this.nodePrevid;
    data['AreaName'] = this.areaName;
    data['GroupName'] = this.groupName;
    data['AreaCode'] = this.areaCode;
    data['Description'] = this.description;
    data['AreaId'] = this.areaId;
    data['DefaultArea'] = this.defaultArea;
    data['AreaGrpId'] = this.areaGrpId;
    data['Message'] = this.message;
    data['UserId'] = this.userId;
    return data;
  }
}
