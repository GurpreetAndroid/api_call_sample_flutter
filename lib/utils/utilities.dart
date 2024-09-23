import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import '../utils/connection_alert.dart';
import '../utils/app_logger.dart';
import '../model/ticket_list_response.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utilities {

  static void flushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          messageSize: 15,
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 5),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.green,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.check, color: Colors.white),
        )
          ..show(context));
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          messageSize: 15,
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 5),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: const Icon(Icons.error, color: Colors.white),
        )
          ..show(context));
  }

  static void loadingWidget(BuildContext context, bool visible) {
    if (visible == true) {
      showDialog(
          barrierColor: Colors.black38,
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>   const Center(
            child: Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.orange,),
              ],
            ),
          )
      );
    } else {
      Navigator.pop(context);
    }
  }

  bool isValidEmail(String? email) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    bool validMail = regExp.hasMatch(email!);
    debugPrint("valid Mail  :: $validMail ");
    return validMail;
  }

  String getFormattedDate(String dateValue) {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(dateValue));
  }

  String getFormattedDateTime(String dateValue) {
    return DateFormat('dd-MM-yyyy hh:mm:ss').format(DateTime.parse(dateValue));
  }

  String getCurrentDateTime(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd:MMMM:yyyy-HH:mm:ss a').format(now);
    return formattedDate;
  }

  String getFormattedTime(TimeOfDay pickedTime) {
    debugPrint("${pickedTime.hourOfPeriod}:${pickedTime.minute} ${pickedTime.period.name.toUpperCase()}");
    String hourVal = "${pickedTime.hourOfPeriod}";//pickedTime.hourOfPeriod;
    String minuteVal = "${pickedTime.minute}";//pickedTime.minute;
    if(pickedTime.hourOfPeriod < 10){
      hourVal="0${pickedTime.hourOfPeriod}";
    }

    if(pickedTime.minute < 10){
      minuteVal= "0${pickedTime.minute}";
    }

    debugPrint("$hourVal:$minuteVal ${pickedTime.period.name.toUpperCase()}");
    return "$hourVal:$minuteVal ${pickedTime.period.name.toUpperCase()}";
  }



  String getCustomerAddress(Customer customerDetails) {
    StringBuffer addressBuffer = StringBuffer();
    if(customerDetails.address1!=null) {
      addressBuffer.write("${customerDetails.address1}, ");
    }
    if(customerDetails.address2!=null ) {
      if(customerDetails.address2 != "") {
        addressBuffer.write("${customerDetails.address2}, ");
      }
    }
    if(customerDetails.address3!=null) {
      if(customerDetails.address3 != "") {
        addressBuffer.write("${customerDetails.address3}, ");
      }
    }
    if(customerDetails.landmark!=null ) {
      if(customerDetails.landmark != ""){
        AppLogger.logInfo("LandMark:${customerDetails.landmark}");
        addressBuffer.write("${customerDetails.landmark}, ");
      }
    }
    if(customerDetails.cityName!=null) {
      addressBuffer.write("${customerDetails.cityName}, ");
    }
    if(customerDetails.stateName!=null) {
      addressBuffer.write("${customerDetails.stateName}, ");
    }
    if(customerDetails.pin!=null) {
      addressBuffer.write("${customerDetails.pin}, ");
    }
    if(customerDetails.countryName!=null) {
      addressBuffer.write("${customerDetails.countryName}.");
    }
    AppLogger.logInfo("Address :: ${addressBuffer.toString()}");
    return addressBuffer.toString();
  }

  BuildContext? _dialogContext;
  void showInternetStatusDialog(BuildContext context, bool isConnected) {
    // Close previous dialog if it exists
    if (_dialogContext != null) {
      Navigator.of(_dialogContext!).pop();
    }
    // Show new dialog
    showDialog(
      context: context,
      builder: (context) {
        _dialogContext = context; // Store the context of the current dialog
        return InternetAlert(isConnected: isConnected);
      },
    ).then((_) {
      _dialogContext = null; // Clear the dialog context after it is closed
    });
  }

}