import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> alert(context,
        {String message = "alert",
        Color color = Colors.pink,
        int duration = 2}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message,
          style: const TextStyle(
            color: Colors.white,
          )),
      duration: Duration(seconds: duration),
      backgroundColor: color,
    ));
