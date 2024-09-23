class TicketListResponse {
  List<TicketDetailsList>? ticketDetailsList;

  TicketListResponse({this.ticketDetailsList});

  TicketListResponse.fromJson(Map<String, dynamic> json) {
    if (json['ticketDetailsList'] != null) {
      ticketDetailsList = <TicketDetailsList>[];
      json['ticketDetailsList'].forEach((v) {
        ticketDetailsList!.add(TicketDetailsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ticketDetailsList != null) {
      data['ticketDetailsList'] =
          ticketDetailsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TicketDetailsList {
  int? ticketId;
  String? ticketNo;
  Customer? customer;
  Product? product;
  String? complaintDescription;
  String? complaintDate;
  String? complaintTime;
  String? ticketStatus;
  String? ticketMode;

  TechnicianAssigned? technicianAssigned;
  String? priorityStatus;
  AppointmentDetails? appointmentDetails;
  RescheduleAppointmentDetails? rescheduleAppointmentDetails;

  TicketDetailsList(
      {this.ticketId,
        this.ticketNo,
        this.customer,
        this.product,
        this.complaintDescription,
        this.complaintDate,
        this.complaintTime,
        this.ticketStatus,
        this.ticketMode,

        this.technicianAssigned,
        this.priorityStatus,
        this.appointmentDetails,
        this.rescheduleAppointmentDetails});

  TicketDetailsList.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticketId'];
    ticketNo = json['ticketNo'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    complaintDescription = json['complaintDescription'];
    complaintDate = json['complaintDate'];
    complaintTime = json['complaintTime'];
    ticketStatus = json['ticketStatus'];
    ticketMode = json['ticketMode'];

    technicianAssigned = json['technicianAssigned'] != null
        ? TechnicianAssigned.fromJson(json['technicianAssigned'])
        : null;
    priorityStatus = json['priorityStatus'];
    appointmentDetails = json['appointmentDetails'] != null
        ? AppointmentDetails.fromJson(json['appointmentDetails'])
        : null;
    rescheduleAppointmentDetails = json['rescheduleAppointmentDetails'] != null
        ? RescheduleAppointmentDetails.fromJson(json['rescheduleAppointmentDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketId'] = ticketId;
    data['ticketNo'] = ticketNo;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['complaintDescription'] = complaintDescription;
    data['complaintDate'] = complaintDate;
    data['complaintTime'] = complaintTime;
    data['ticketStatus'] = ticketStatus;
    data['ticketMode'] = ticketMode;
    if (technicianAssigned != null) {
      data['technicianAssigned'] = technicianAssigned!.toJson();
    }
    data['priorityStatus'] = priorityStatus;
    if (appointmentDetails != null) {
      data['appointmentDetails'] = appointmentDetails!.toJson();
    }
    if (rescheduleAppointmentDetails != null) {
      data['rescheduleAppointmentDetails'] = rescheduleAppointmentDetails!.toJson();
    }
    return data;
  }
}

class Customer {
  int? customerId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNo;
  String? address1;
  String? address2;
  String? address3;
  int? cityId;
  String? cityName;
  int? stateId;
  String? stateName;
  String? pin;
  int? countryId;
  String? countryName;
  String? landmark;

  Customer(
      {this.customerId,
        this.firstName,
        this.lastName,
        this.email,
        this.mobileNo,
        this.address1,
        this.address2,
        this.address3,
        this.cityId,
        this.cityName,
        this.stateId,
        this.stateName,
        this.pin,
        this.countryId,
        this.countryName,
        this.landmark});

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    stateId = json['stateId'];
    stateName = json['stateName'];
    pin = json['pin'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    landmark = json['landmark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['mobileNo'] = mobileNo;
    data['address1'] = address1;
    data['address2'] = address2;
    data['address3'] = address3;
    data['cityId'] = cityId;
    data['cityName'] = cityName;
    data['stateId'] = stateId;
    data['stateName'] = stateName;
    data['pin'] = pin;
    data['countryId'] = countryId;
    data['countryName'] = countryName;
    data['landmark'] = landmark;
    return data;
  }

  @override
  String toString(){
    return "$customerId, $firstName, $lastName, $email, $mobileNo, $address1, $address2, $address3, $cityId, $cityName, $stateId, $stateName, $pin, $countryId, $countryName, $landmark, ";
  }
}

class Product {
  int? productId;
  String? productName;
  int? productCategoryId;
  String? productCategoryName;
  int? productSubCategoryId;
  String? productSubCategoryName;

  Product(
      {this.productId,
        this.productName,
        this.productCategoryId,
        this.productCategoryName,
        this.productSubCategoryId,
        this.productSubCategoryName});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productCategoryId = json['productCategoryId'];
    productCategoryName = json['productCategoryName'];
    productSubCategoryId = json['productSubCategoryId'];
    productSubCategoryName = json['productSubCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['productName'] = productName;
    data['productCategoryId'] = productCategoryId;
    data['productCategoryName'] = productCategoryName;
    data['productSubCategoryId'] = productSubCategoryId;
    data['productSubCategoryName'] = productSubCategoryName;
    return data;
  }
}

class TechnicianAssigned {
  int? userId;
  String? username;
  String? mobileNo;
  int? roleId;
  String? roleName;

  TechnicianAssigned({this.userId, this.username, this.mobileNo, this.roleId, this.roleName});

  TechnicianAssigned.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    mobileNo = json['mobileNo'];
    roleId = json['roleId'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['mobileNo'] = mobileNo;
    data['roleId'] = roleId;
    data['roleName'] = roleName;
    return data;
  }
}

class AppointmentDetails {
  String? appointmentDate;
  String? appointmentTime;

  AppointmentDetails({this.appointmentDate, this.appointmentTime});

  AppointmentDetails.fromJson(Map<String, dynamic> json) {
    appointmentDate = json['appointmentDate'];
    appointmentTime = json['appointmentTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointmentDate'] = appointmentDate;
    data['appointmentTime'] = appointmentTime;
    return data;
  }
}

class RescheduleAppointmentDetails {
  String? rescheduleDate;
  String? rescheduleTime;

  RescheduleAppointmentDetails({this.rescheduleDate, this.rescheduleTime});

  RescheduleAppointmentDetails.fromJson(Map<String, dynamic> json) {
    rescheduleDate = json['rescheduleDate'];
    rescheduleTime = json['rescheduleTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rescheduleDate'] = rescheduleDate;
    data['rescheduleTime'] = rescheduleTime;
    return data;
  }
}
