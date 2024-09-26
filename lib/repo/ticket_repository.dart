import '../../constant/api_constant.dart';
import '../../model/response_model.dart';
import '../data/api_service.dart';

class TicketRepository {
  Map<String, String> getHeaderData() {
    var headersData = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    return headersData;
  }

  Future<ResponseModel> getTicketListData(String technicianId,String technicianName,String ticketStatus, String filterBy) async {
    var url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.TICKET_LIST);
    var dataNew = {
      "ticketStatus" : ticketStatus,
      "technicianId" : technicianId,
      "technicianName" : technicianName,
      "filterBy": filterBy
    };
    Future<ResponseModel> responseModel = ApiService().getApiData(getHeaderData(), dataNew, url);
    return responseModel;
  }
}