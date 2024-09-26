import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  static const String ticketTypeAssigned = "ASSIGNED";

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
}

enum LoadingState { none, loading, error, denied, exception }

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
