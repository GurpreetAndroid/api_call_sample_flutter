import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'app_exceptions.dart';
import '../model/response_model.dart';
import '../utils/app_logger.dart';
import '../constant/constants.dart';

class ApiService with ChangeNotifier {
  LoadingState _state = LoadingState.none;
  LoadingState? get state => _state;

  changeLoadingState(LoadingState state) {
    _state = state;
    notifyListeners();
  }

  Future<ResponseModel> getApiData(var headerData, var bodyData, var apiUrl) async {
    try {
      AppLogger.logInfo("HEADER DATA :: $headerData");
      AppLogger.logInfo("API URL :: $apiUrl");
      AppLogger.logInfo("JSON REQUEST :: ${jsonEncode(bodyData)}");
      var request = await http.post(
        apiUrl, headers: headerData, body: jsonEncode(bodyData),
      ).timeout(const Duration(seconds: 20), onTimeout: (){
        return Response('Time out!', 500);
      });
      final http.Response response =  request;
      AppLogger.logInfo("response.body 00::  ${response.body}");
      return ResponseModel.fromJson(returnResponse(response));
    } on TimeoutException catch (_) {
      AppLogger.logError('Timed out');
      throw FetchDataException('Time Out exception');
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        AppLogger.logInfo("response.body ::  ${response.body}");
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw ServerException(response.statusCode.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(response.statusCode.toString());
    }
  }
}

// 1096