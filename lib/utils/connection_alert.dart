import 'package:flutter/material.dart';

class InternetAlert extends StatefulWidget {
  final bool isConnected;
  const InternetAlert({super.key, required this.isConnected});

  @override
  State<InternetAlert> createState() => _InternetAlertState();
}

class _InternetAlertState extends State<InternetAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.isConnected ? Icon(Icons.sentiment_satisfied_rounded, color: Colors.green, size: 50,)
                    : Icon(Icons.warning_rounded, color: Colors.red, size: 50,),
                Text(widget.isConnected ? "Internet is back." : "No Internet Connection!",),
              ]),
        ),
      elevation: 20.0,
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: const Size(100, 40), backgroundColor: Colors.black54, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Okay', style: TextStyle(color: Colors.white, fontSize: 16.0, fontStyle: FontStyle.italic),),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}