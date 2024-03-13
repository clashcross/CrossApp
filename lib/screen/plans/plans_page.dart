import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import '../../bean/order_detail_entity.dart';
import '../../bean/plan_entity.dart';
import '../../main.dart';
import '../../service/v2board_service.dart';
import '../../tools/helper.dart';
import '../crisp_page.dart';
import '../page/orders.dart';
import 'plan.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vs = Get.find<V2boardService>();
    vs.getOrdersDetails();
    final plans = vs.plansList;
    bool isDarkTheme = SpUtil.getBool("is_dark", defValue: false)!;
    List<OrderDetailEntity>? noPayOrders =
    vs.orders?.where((element) => element.status == 0).toList();
    // vs.getOrdersDetails();
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text("Purchase Subscription".tr),
      ),
      body: Obx(() {
        if (plans.isNotEmpty) {
          List<Widget> children = [];
          if (noPayOrders != null && noPayOrders.isNotEmpty) {
            children.add(Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  // height: kToolbarHeight,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isDarkTheme
                        ? const Color(0xff181227)
                        : const Color(0xffF5F5F6),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    leading: const Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                    title: const Text("您当前有未支付订单"),
                    subtitle: const Text("检测到您还有没支付的订单，请前往官网支付或者取消订单"),
                    trailing: TextButton(
                        onPressed: () {
                          Get.to(const Orders());
                        },
                        child: const Text("查看")),
                  ),
                )));
          }

          for (int i = 0; i < plans.length; i++) {
            List content = jsonDecode(removeHtmlTags(plans[i].content));
            var label = content.last;
            content.removeLast();
            String contentString = "";
            for (var element in content) {
              contentString += "${(element["support"] ? "👍:" : "🥵:") +
                  element["feature"]}\n";
            }
            children.add(Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  // height: kToolbarHeight,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isDarkTheme
                        ? const Color(0xff181227)
                        : const Color(0xffF5F5F6),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(
                      // removeHtmlTags(plans[i].content),
                      contentString,
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          plans[i].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                          TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        buildPriceWidget(plans[i]),
                        TextButton(
                            onPressed: () {
                              noPayOrders != null && noPayOrders.isNotEmpty
                                  ? _showDialog(context)
                                  : Get.to(Plan(
                                planEntity: plans[i],
                              ));
                            },
                            child: const Text(
                              "立即订阅",
                            ))
                      ],
                    ),
                  ),
                )));
          }

          return ListView(
            children: children,
          );
        }
        return Center(
          child: TextButton(
            onPressed: () {
              vs.getPlansList();
            },
            child: const Text("点击重试"),
          ),
        );
      }),
      floatingActionButton: isDesktop
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                // Get.to(const LoginPage());
                Get.to(const CrispPage());
              },
              tooltip: '联系客服',
              child: const Icon(Icons.support_agent),
            ),
    );
  }

  buildPriceWidget(PlanEntity planEntity) {
    String selectedFieldKey = '';
    Map<String, dynamic> selectedFields = {
      "month_price": planEntity.monthPrice,
      "quarter_price": planEntity.quarterPrice,
      "half_year_price": planEntity.halfYearPrice,
      "year_price": planEntity.yearPrice,
      "two_year_price": planEntity.twoYearPrice,
      "three_year_price": planEntity.threeYearPrice,
      "onetime_price": planEntity.onetimePrice,
      "reset_price": planEntity.resetPrice,
    };
    for (var entry in selectedFields.entries) {
      if (entry.value != 0) {
        selectedFieldKey = entry.key;
        break;
      }
    }

    return Expanded(
      child: Text(
        (selectedFields[selectedFieldKey] / 100).toStringAsFixed(2) +
            '/' +
            selectedFieldKey.tr,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
  Future<void> _showDialog(BuildContext context) async {
    final vs = Get.find<V2boardService>();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 设置为false，用户必须选择一个选项才能关闭对话框
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('您当前有未支付的订单'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('检测到您还有没支付的订单，请前往支付或者取消订单'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('返回'),
              onPressed: () {
                // customLaunch(Uri.parse("https://t.me/freevpnget"));
                Get.back();
              },
            ),
            TextButton(
              child: const Text('查看'),
              onPressed: () {
                Get.to(const Orders());
                // Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
