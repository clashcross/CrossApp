import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogService extends GetxService {
  Future<DialogService> init() async {
    return this;
  }

  Future<String> inputDialog(
      {String title = "请输入文字",
        Function(String text)? onText,
        String textConfirm = "确定",
        String textCancel = "取消"}) async {
    var text = "";
    await Get.defaultDialog(
        title: title,
        content: Row(
          children: [
            Expanded(child: TextField(
              onChanged: (s) {
                text = s;
              },
            ))
          ],
        ),
        onCancel: () {
          text = "";
        },
        textConfirm: textConfirm,
        textCancel: textCancel,
        onConfirm: () {
          onText?.call(text);
          Get.back();
        });
    return text;
  }
}
