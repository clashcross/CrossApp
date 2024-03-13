import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../service/v2board_service.dart';
import '../plans/plans.dart';
import '../plans/plans_page.dart';

class Servers extends StatelessWidget {
  const Servers({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = SpUtil.getBool("is_dark",defValue: false)!;
    final vs = Get.find<V2boardService>();
    final servers = vs.servers;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text("Access Point Status".tr),
      ),
      body: Obx(
        () => servers.isNotEmpty
            ? ListView.builder(
                itemCount: servers.length,
                itemBuilder: (context, index) {
                  return Container(
                    // height: kToolbarHeight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isDarkTheme
                          ? const Color(0xff181227)
                          : const Color(0xffF5F5F6),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: ListTile(
                      leading: Text(servers[index].name),
                      trailing: servers[index].isOnline == 1
                          ? const Icon(
                              Icons.online_prediction,
                              color: Colors.green,
                            )
                          : const Icon(Icons.offline_bolt_outlined,
                              color: Colors.red),
                    ),
                  );
                },
              )
            : Center(
                child: TextButton(
                  onPressed: () {
                    Get.to(const PlansPage());
                  },
                  child: const Text("无法查看节点状态,立即购买"),
                ),
              ),
      ),
    );
  }
}
