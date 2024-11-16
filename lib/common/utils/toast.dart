import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void commonShowToast(String msg, {ToastGravity? gravity}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: gravity ?? ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
