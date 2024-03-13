import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

bool isEmailValid(String email) {
  // 使用正则表达式验证电子邮件地址的有效性
  // 此处仅示例简单的验证逻辑
  // 您可以根据需要使用更复杂的验证方法
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailRegex.hasMatch(email);
}

removeHtmlTags(String htmlString) {
  dom.DocumentFragment document = parser.parseFragment(htmlString);
  return document.text;
}

// 格式化日期时间函数
String formatDate(DateTime dateTime) {
  String formattedDate =
      '${dateTime.year}-${_twoDigits(dateTime.month)}-${_twoDigits(dateTime.day)}';
  String formattedTime =
      '${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)}:${_twoDigits(dateTime.second)}';
  return '$formattedDate';
  // return '$formattedDate $formattedTime';
}

// 在单个数字前添加零
String _twoDigits(int n) => n.toString().padLeft(2, '0');

String formatByteData(int byteData) {
  if (byteData < 1024) {
    return '$byteData B';
  } else {
    double kbData = byteData / 1024;
    if (kbData < 1024) {
      return '${kbData.toStringAsFixed(2)} KB';
    } else {
      double mbData = kbData / 1024;
      if (mbData < 1024) {
        return '${mbData.toStringAsFixed(2)} MB';
      } else {
        double gbData = mbData / 1024;
        return '${gbData.toStringAsFixed(2)} GB';
      }
    }
  }
}
