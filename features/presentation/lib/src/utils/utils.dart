import 'package:flutter/material.dart';

class Utils {
  static Future<bool> onWillPop(
    _, {
    required String title,
    required String content,
  }) async {
    return (await showDialog(
          context: _,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
