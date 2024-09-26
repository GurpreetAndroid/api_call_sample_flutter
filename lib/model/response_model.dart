class ResponseModel {
  String? success;
  String? successCode;
  String? successMsg;
  Object? responseData;
  ResponseModel({this.success, this.successCode, this.successMsg, this.responseData});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    successCode = json['successCode'];
    successMsg = json['successMsg'];
    responseData = json['responseData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['successCode'] = successCode;
    data['successMsg'] = successMsg;
    data['responseData'] = responseData;
    return data;
  }
}


