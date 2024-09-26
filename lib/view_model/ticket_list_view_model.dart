import 'dart:convert';

import 'package:api_call_sample_fapp/repo/ticket_repository.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../model/ticket_list_response.dart';
import '../utils/utilities.dart';
import 'package:flutter/material.dart';
import '../data/response/api_response.dart';
import '../model/response_model.dart';
import '../utils/app_logger.dart';

class TicketListViewModel with ChangeNotifier {

  ApiResponse<ResponseModel> ticketListResponseData = ApiResponse.loading();
  setTicketListData(ApiResponse<ResponseModel> response) {
    ticketListResponseData = response;
    notifyListeners();
  }

  late ResponseModel responseModel;
  TicketRepository ticketRepository = TicketRepository();
  late TicketListResponse ticketListData;

  void getTicketListData(BuildContext context, String? technicianId, String technicianName, String ticketStatus, String filterBy) async {
    setTicketListData(ApiResponse.loading());
    bool? isInternetAccess = await InternetConnection().hasInternetAccess;
    if(isInternetAccess){
      responseModel = (await ticketRepository.getTicketListData(technicianId!, technicianName, ticketStatus, filterBy));
      if(responseModel.successCode == "200"){
        if(responseModel.responseData !=null){
          var jsonData = jsonEncode(responseModel.responseData);
          final parsedJson = jsonDecode(jsonData);
          ticketListData = TicketListResponse.fromJson(parsedJson);
           setTicketListData(ApiResponse.completed(responseModel));
          await Future.delayed(const Duration(seconds: 1));
        } else {
          setTicketListData(ApiResponse.error(responseModel.successMsg));
        }
      } else {
        String errorMsg = responseModel.successMsg.toString();

        AppLogger.logError("errorMsg  $errorMsg");
        await Future.delayed(const Duration(seconds: 1));
        setTicketListData(ApiResponse.error(errorMsg));
      }
    } else {
      AppLogger.logError("Connection Status : $isInternetAccess");
      Utilities().showInternetStatusDialog(context, false);
      setTicketListData(ApiResponse.error("No Internet Connection.."));
      String? errorMsg = "No Internet Connection! Please Check Network Connection..";
      AppLogger.logError("errorMsg : $errorMsg");
    }
  }
}