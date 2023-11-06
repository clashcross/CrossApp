import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import '../../bean/order_detail_entity.dart';
import '../../http/options.dart';
import '../../service/v2board_service.dart';
import '../../tools/customlaunch.dart';
import '../plans/plans.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = SpUtil.getBool("is_dark",defValue: false)!;
    final vs = Get.find<V2boardService>();
    vs.getOrdersDetails();
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text("My Orders".tr),
      ),
      body: vs.orders!.isNotEmpty
          ? ListView.builder(
              itemCount: vs.orders?.length,
              itemBuilder: (context, index) {
                return Container(
                  // height: kToolbarHeight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isDarkTheme
                        ? const Color(0xff181227)
                        : const Color(0xffF5F5F6),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    // leading: Text(vs.orders![index].tradeNo),
                    title: Text(
                        '${vs.orders![index].tradeNo.substring(0, 20)}...'),
                    subtitle: statusWidget(vs.orders![index].status),
                    trailing: trailingWidget(vs.orders![index]),
                  ),
                );
              },
            )
          : Center(
              child: TextButton(
                onPressed: () {
                  Get.to(const Plans());
                },
                child: const Text("暂无订单，立即购买"),
              ),
            ),
    );
  }

  statusWidget(int status) {
    String statusString = "未知";
    switch (status) {
      case 0:
        statusString = "待支付";
        break;
      case 2:
        statusString = "已取消";
        break;
      case 3:
        statusString = "已完成";
        break;
    }
    return Text(statusString);
  }

  trailingWidget(OrderDetailEntity order) {
    String statusString = "未知";
    int status = order.status;
    final vs = Get.find<V2boardService>();
    switch (status) {
      case 0:
        statusString = "待支付";
        return TextButton(
            onPressed: () {
              customLaunch(Uri.parse('${HttpOptions.websiteurl}#/order/${order.tradeNo}'));
            },
            child: Text(statusString));
        break;
      case 2:
        statusString = "已取消";
        break;
      case 3:
        statusString = "已完成";
        return TextButton(
            onPressed: () async {
              var url = await vs.quickUrl("order");
              // print(url);
              customLaunch(Uri.parse(url));
            },
            child: Text(statusString));
        break;
    }
    return Text(statusString);
  }
}
