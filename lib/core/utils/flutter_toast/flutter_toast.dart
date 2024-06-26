import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void flutterToastShow({required String message,required ToastState state}) => Fluttertoast.showToast(
  msg: message,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.TOP_RIGHT,
  timeInSecForIosWeb: 1,
  backgroundColor: chooseToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0,
);

enum ToastState {SUCCESS,ERROR,WARNING}
Color? chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}
