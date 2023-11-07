
import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertApp {
  static showLoadingIndicator(BuildContext context, String deskripsi) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                       Padding(
                          padding: EdgeInsets.all(8),
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: ColorsApp.baseColor,
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            deskripsi,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  )
                ]));
      },
    );
  }

  static showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 12);
  }
}