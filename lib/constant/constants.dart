import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {

  static const String Production = 'PRODUCTION';
  static const String Developemnt = 'DEVELOPMENT';
  static const String ApkMode = Developemnt;

  static const String LOGIN_ID = 'login_id';
  static const String APP_TOKEN = 'TOKEN';
  static const String WMS_CODE = 'WMS_CODE';

  static const String USER_NAME = 'user_name';
  static const String STORE_NAME = 'store_name';
  static const String STORE_CODE = 'store_code';
  static const String COMPANY_NAME = 'company_name';

  static const String LOGIN_RESPONSE = 'Login_Response';
  static const String NO_RECORDS = 'No Records Found';
  static const String POAPP_RIGHTS = 'POAPP';

  static const String ticketTypeAssigned = "ASSIGNED";
  static const String ticketTypeOpen = "OPEN";
  static const String ticketTypeResolved = "RESOLVED";
  static const String ticketTypeScheduled = "SCHEDULED";


  static void showSnackBar(BuildContext context, String msg) {
    var value = 700; // height;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: BoxDecoration(color: Colors.black87, border: Border.all(width: 2.0, color: Colors.black87), borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.fromLTRB(0, 0, 0, value - 200),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(msg, style: const TextStyle(color: Colors.white,fontSize: 16),),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 1000,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showSnackBarError1(BuildContext context, String msg) {
    var value = 700; // height;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: BoxDecoration(color: Colors.redAccent, border: Border.all(width: 2.0, color: Colors.redAccent), borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.fromLTRB(0, 0, 0, value - 200),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(msg, style: const TextStyle(color: Colors.white, fontSize: 16),),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 1000,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showSnackBarSuccess(BuildContext context, String msg) {
    var value = 700; // height;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: BoxDecoration(color: Colors.green, border: Border.all(width: 2.0, color: Colors.green), borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.fromLTRB(0, 0, 0, value - 200),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(msg, style: const TextStyle(color: Colors.white, fontSize: 16),),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 1000,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static Future showSnackBarError2(BuildContext context, String msg) {
    return showDialog(
      barrierDismissible: false, // user must tap button!
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Oops!", style: TextStyle(color: Colors.black),),
          contentPadding: const EdgeInsets.only(top: 12, left: 24, bottom: 20),
          insetPadding: const EdgeInsets.symmetric(horizontal: 5),
          content: Text(msg, style: const TextStyle(color: Colors.black),),
          actions: <Widget>[
            MaterialButton(
              minWidth: 100,
              color: Colors.green,
              child: const Text("Ok", style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future showErrorDialog(BuildContext context, String msg) {
    return showDialog(
      barrierDismissible: false, // user must tap button!
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          /* insetPadding: EdgeInsets.fromLTRB(0,0,0,0),
          titlePadding: EdgeInsets.fromLTRB(0,0,0,0),
          contentPadding: EdgeInsets.all(0),
          actionsPadding:  EdgeInsets.all(0),
          buttonPadding: EdgeInsets.all(0),*/
          content: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Image.asset('asset/images/popup-without-title.png'),
                /* (msg.length>35)
             ? Image.asset('assets/images/popup_162.png',)
             :   Image.asset('assets/images/popup_162.png',),*/
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(msg, style: const TextStyle(fontSize: 14,),),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.fromLTRB(10, 100, 30, 0),
                child: Align(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    minWidth: 100,
                    color: Colors.green,
                    child: const Text("Ok", style: TextStyle(color: Colors.white),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static String getLastMonth(int flag) {
    var date = DateTime.now();
    var prevMonth = DateTime(date.year, date.month - flag, date.day);
    DateFormat formatter = DateFormat('MMM-yyyy');
    String formatted = formatter.format(prevMonth);
    return "($formatted)";
  }
}

enum LoadingState { none, loading, error, denied, exception }

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
