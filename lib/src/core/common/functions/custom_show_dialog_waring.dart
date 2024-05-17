import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogs {
  CustomDialogs._();

  static Future<void> showDialogWaring(
      BuildContext context, String errorMessage) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('showDialogWaring'.tr),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(errorMessage),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('showDialogClose'.tr),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
