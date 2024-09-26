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
  String? ticketStatus;

  TicketDetailsList(
      {this.ticketId,
        this.ticketNo,
        this.ticketStatus
      });

  TicketDetailsList.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticketId'];
    ticketNo = json['ticketNo'];
    ticketStatus = json['ticketStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketId'] = ticketId;
    data['ticketNo'] = ticketNo;
    data['ticketStatus'] = ticketStatus;
    return data;
  }
}

