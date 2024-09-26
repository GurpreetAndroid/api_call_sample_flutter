import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import '../utils/connection_alert.dart';
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

  String getCurrentDateTime(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd:MMMM:yyyy-HH:mm:ss a').format(now);
    return formattedDate;
  }

  BuildContext? _dialogContext;
  void showInternetStatusDialog(BuildContext context, bool isConnected) {
    if (_dialogContext != null) {
      Navigator.of(_dialogContext!).pop();
    }
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