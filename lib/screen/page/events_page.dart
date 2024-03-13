import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';

import '../../service/v2board_service.dart';
import '../../tools/customlaunch.dart';
import '../plans/plans.dart';
import 'invitation_page.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: Text("赚取流量和时长".tr),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Get.to(InvitationPage());
                },
                leading: const Icon(
                  Icons.pattern,
                  color: Colors.green,
                ),
                title: const Text("邀请好友"),
                subtitle: const Text(
                    "每邀请一个注册成功即增加流量和额外时长;邀请的用户购买了套餐,您将获得购买金额20%提成"),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  _showBindTelegramDialog(context);
                },
                leading: const Icon(
                  Icons.telegram,
                  color: Colors.green,
                ),
                title: const Text("绑定官方电报机器人"),
                subtitle: const Text("绑定成功即增加流量和使用时长"),
                trailing: const Icon(Icons.arrow_forward),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Get.to(const Plans());
                },
                leading: const Icon(
                  Icons.gite,
                  color: Colors.green,
                ),
                title: const Text("成为付费会员"),
                subtitle: const Text("付费会员专用app免广告；可使用全部节点；更多的流量"),
                trailing: const Icon(Icons.arrow_forward),
              ),
            )
          ],
        ));
  }

  Future<void> _showBindTelegramDialog(BuildContext context) async {
    final vs = Get.find<V2boardService>();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 设置为false，用户必须选择一个选项才能关闭对话框
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('绑定官网机器人'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // ListTile(
                //   title: Text(
                //       "第一步:打开Telegram搜索:${vs.bindtelegramEntity.value.username!}"),
                // ),
                ListTile(
                  title: const Text("点击复制下面命令发送给官方机器人"),
                  subtitle: GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(
                          text: vs.bindtelegramEntity.value.bind!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('复制成功')),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(vs.bindtelegramEntity.value.bind!),
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                // customLaunch(Uri.parse("https://t.me/freevpnget"));
                Get.back();
              },
            ),
            TextButton(
              child: const Text('去绑定'),
              onPressed: () {
                customLaunch(Uri.parse(
                    "https://t.me/${vs.bindtelegramEntity.value.username!}"));
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
