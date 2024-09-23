class ResponseModel {
  String? success;
  String? successCode;
  String? successMsg;
  //ResponseData?  responseData;
  Object? responseData;
  ResponseModel(
      {this.success, this.successCode, this.successMsg, this.responseData});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    successCode = json['successCode'];
    successMsg = json['successMsg'];
    /*responseData = (json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null)!;*/
    responseData = json['responseData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['successCode'] = successCode;
    data['successMsg'] = successMsg;
    /*if (this.responseData != null) {
      data['responseData'] = this.responseData!.toJson();
    }*/
    data['responseData'] = responseData;
    return data;
  }
}

/*class ResponseData {

  int? userId;
  String? username;
  String? mobileNo;
  int? roleId;
  String? roleName;

  ResponseData({this.userId, this.username, this.mobileNo, this.roleId, this.roleName});

  ResponseData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    mobileNo = json['mobileNo'];
    roleId = json['roleId'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['mobileNo'] = this.mobileNo;
    data['roleId'] = this.roleId;
    data['roleName'] = this.roleName;
    return data;
  }
}*/


