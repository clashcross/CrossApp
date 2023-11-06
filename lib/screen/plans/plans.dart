import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import '../../bean/plan_entity.dart';
import '../../main.dart';
import '../../service/v2board_service.dart';
import '../../tools/helper.dart';
import '../crisp_page.dart';
import 'plan.dart';

class Plans extends StatelessWidget {
  const Plans({super.key});

  @override
  Widget build(BuildContext context) {
    final vs = Get.find<V2boardService>();
    final plans = vs.plansList;
    bool isDarkTheme = SpUtil.getBool("is_dark", defValue: false)!;
    // vs.getOrdersDetails();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: vs.showBackButton.value,
        shadowColor: Colors.transparent,
        title: Text("Purchase Subscription".tr),
      ),
      body: Obx(() {
        if (plans.isNotEmpty) {
          return ListView.builder(
              itemCount: plans.length,
              padding: const EdgeInsets.only(top: 10),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
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
                          removeHtmlTags(plans[index].content),
                          style: Theme.of(context).primaryTextTheme.titleMedium,
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              plans[index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            buildPriceWidget(plans[index]),
                            TextButton(
                                onPressed: () {
                                  // Get.to(Plan(
                                  //   planEntity: plans[index],
                                  // ));
                                  Get.to(Plan(
                                    planEntity: plans[index],
                                  ));
                                },
                                child: const Text(
                                  "立即订阅",
                                ))
                          ],
                        ),
                      ),
                    ));
              });
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
}
