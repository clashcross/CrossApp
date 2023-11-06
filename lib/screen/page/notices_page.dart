import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../service/v2board_service.dart';
import '../../tools/helper.dart';

class NoticesPage extends StatelessWidget {
  const NoticesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: Text("announcements".tr),
        ),
        body: ListView(
          children: [buildNotices(context)],
        ));
  }

  buildNotices(context) {
    bool isDarkTheme = SpUtil.getBool("is_dark",defValue: false)!;
    final vs = Get.find<V2boardService>();
    vs.getNotices();
    List notices = vs.notices.value;
    notices.removeWhere((element) => !(element.tags).contains("公告"));

    List<Widget> children = [];
    for (var element in notices) {
      children.add(
        Container(
          // height: kToolbarHeight,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                isDarkTheme ? const Color(0xff181227) : const Color(0xffF5F5F6),
          ),
          padding: const EdgeInsets.all(5),
          child: ListTile(
            title: Text(element.title),
            subtitle: Text(element.content),
          ),
        ),
      );
    }

    return Column(children: children);
  }
}
