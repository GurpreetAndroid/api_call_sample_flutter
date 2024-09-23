import 'dart:io';
import '../utils/utilities.dart';
import 'package:flutter/cupertino.dart';

class AppLogger{

  static setConfig(){
    //MyLogger.config..activeLogLevel = LogLevel.DEBUG;
    // MyLogger.config..timestampFormat = TimestampFormat.TIME_FORMAT_FULL_1;
  }

  static logInfo(String logMessage, {String? className, String? methodName,}) {
     appLog(logMessage, "INFO", className: className, methodName: methodName,);
  }

  static logWaring(String logMessage, {String? className, String? methodName,}) {
    appLog( logMessage , "WARNING", className: className, methodName: methodName,);
  }

  static logError(String logMessage, {String? className, String? methodName, dynamic exception,}) {
    appLog(logMessage, "ERROR", className: className, methodName: methodName, exception: exception);
  }

  static logDebug(String logMessage, {String? className, String? methodName,}) {
    appLog( logMessage, "DEBUG", className: className, methodName: methodName,);
  }

  static logSevere(String logMessage, {String? className, String? methodName,}) {
    appLog( logMessage , "SEVERE", className: className, methodName: methodName,);
  }

  static logTrace(String logMessage, {String? className, String? methodName,}) {
    appLog( logMessage , "TRACE", className: className, methodName: methodName,);
  }

  static logFatal(String logMessage, {String? className, String? methodName,}) {
    appLog(logMessage, "FATAL", className: className, methodName: methodName,);
  }

  static void appLog(String message,  String logType, { String? className, String? methodName, dynamic exception, StackTrace? stacktrace,}) {
    var dateTime = Utilities().getCurrentDateTime();
    StringBuffer logs = StringBuffer();
    logs.write(dateTime.toString());
    logs.write(" :: $logType");
    if(className != null){
      logs.write(" :: $className");
    }
    if(methodName != null){
      logs.write(" :: $methodName");
    }
    logs.write(" :: $message");
    if(exception != null){
      logs.write(" :: ${exception.toString()}");
    }
    debugPrint(logs.toString());
  }



}


// https://github.com/mjablecnik/MyLogger/tree/master/example

