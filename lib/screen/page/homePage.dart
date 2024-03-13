//ignore_for_file: file_names
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:sp_util/sp_util.dart';

import '../../bean/order_detail_entity.dart';
import '../../main.dart';
import '../../service/v2board_service.dart';
import '../../tools/helper.dart';
import '../component/speed.dart';
import '../crisp_page.dart';
import '../plans/plans.dart';
import '../plans/plans_page.dart';
import 'events_page.dart';
import 'invitation_page.dart';
import 'proxy.dart';
import '../../service/clash_service.dart';
import '../../service/notification_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //提示评分
  // _inAppReview() async {
  //   final InAppReview inAppReview = InAppReview.instance;
  //   if (await inAppReview.isAvailable()) {
  //     inAppReview.requestReview();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = SpUtil.getBool("is_dark", defValue: false)!;
    final nonSelectedColor = Colors.grey.shade400;
    const selectedColor = Colors.blueAccent;
    Size size = MediaQuery.of(context).size;
    const style = TextStyle(color: Colors.white);
    final vs = Get.find<V2boardService>();
    final cs = Get.find<ClashService>();
    final nt = Get.find<NotificationService>();
    final mode = Get.find<ClashService>().configEntity.value?.mode ?? "Global";
    // vs.getSubscribe();
    Map<String, dynamic> maps = cs.proxies.value['proxies'] ?? {};
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.35,
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Lottie.asset('assets/images/animation_map.json',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          fit: BoxFit.fitHeight),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SpeedWidget(),
                          Builder(builder: (context) {
                            return Obx(() => GestureDetector(
                                  onTap: () {
                                    if (cs.isSystemProxyObs.value) {
                                      cs.clearSystemProxy();
                                      if (!Platform.isWindows) {
                                        // nt.cancelNotification("ClashCrossRun");
                                        nt.cancelAllNotification();
                                      }
                                    } else if (vs.isExpired.value ||
                                        vs.trafficOut.value) {
                                      EasyLoading.show(
                                          status: "无有效套餐,请续费",
                                          dismissOnTap: true);
                                    } else if (!cs.isTested.value) {
                                      _showTestDialog(context);
                                    } else {
                                      if (!isDesktop) {
                                        cs.setSystemProxy();

                                        if (Platform.isAndroid) {
                                          FlutterLocalNotificationsPlugin
                                              flutterLocalNotificationsPlugin =
                                              FlutterLocalNotificationsPlugin();
                                          flutterLocalNotificationsPlugin
                                              .resolvePlatformSpecificImplementation<
                                                  AndroidFlutterLocalNotificationsPlugin>()
                                              ?.requestPermission();
                                          Timer.periodic(
                                              const Duration(seconds: 1), (t) {
                                            nt.showNotification("一键连连接守护",
                                                "↑:${cs.uploadRate.value.toStringAsFixed(1)}KB/s ↓:${cs.downRate.value.toStringAsFixed(1)}KB/s");
                                          });
                                        }
                                      } else {
                                        cs.setSystemProxy();
                                      }
                                    }
                                  },
                                  child: Card(
                                    elevation: 6,
                                    color: isDarkTheme
                                        ? const Color(0xff181227)
                                        : const Color(0xffF5F5F6),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: SizedBox.square(
                                      dimension: 75 * 2,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              cs.isSystemProxyObs.value
                                                  ? 'assets/stop.svg'
                                                  : 'assets/powOn.svg',
                                              width: cs.isSystemProxyObs.value
                                                  ? 50
                                                  : 50,
                                              color: cs.isSystemProxyObs.value
                                                  ? Colors.redAccent.shade200
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                cs.isSystemProxyObs.value
                                                    ? 'Tap to Stop'.tr
                                                    : 'Tap to Start'.tr,
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .headline6,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ));
                          }),

                          // !vs.isPaid.value && cs.isSystemProxyObs.value
                          //     ? ListTile(
                          //   leading: const Icon(
                          //     Icons.warning,
                          //     color: Colors.red,
                          //   ),
                          //   title: const Text("当前使用的是免费套餐"),
                          //   subtitle: const Text("可以通过完成任务或者购买获得更多流量"),
                          //   trailing: TextButton(
                          //       onPressed: () {
                          //         Get.to(const EventsPage());
                          //       },
                          //       child: const Text("赚取流量")),
                          // )
                          //     : Container(),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: Platform.isIOS ? size.height * 0.51 : size.height * 0.5,
              decoration: BoxDecoration(
                color: isDarkTheme
                    ? const Color(0xff181227)
                    : const Color(0xffF5F5F6),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  /// horizontal line
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: const Color(0xffB4B4C7),
                        borderRadius: BorderRadius.circular(3)),
                    height: size.height * 0.005,
                    width: 35,
                  ),

                  /// Connection Information
                  Expanded(
                    child: Padding(
                      // padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                      padding: const EdgeInsets.fromLTRB(50, 0, 30, 0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.height * 0.07,
                                      height: size.height * 0.07,
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.access_alarm,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Account Valid".tr,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() {
                                      DateTime dateTime =
                                          DateTime.fromMillisecondsSinceEpoch(
                                              (vs.userInfo.value.expiredAt) *
                                                  1000);
                                      // 格式化日期时间字符串
                                      String formattedDateTime =
                                          formatDate(dateTime);
                                      if (!vs.isExpired.value &&
                                          !vs.trafficOut.value) {
                                        return Text(
                                          vs.userInfo.value.expiredAt != 0
                                              ? formattedDateTime
                                              : "长期有效",
                                          // overflow: TextOverflow.ellipsis,
                                        );
                                      } else {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.to(const PlansPage());
                                          },
                                          child: Text(
                                            "Account has expired".tr,
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                        );
                                      }
                                    }),
                                    // Text(
                                    //   'NEW YORK CITY',
                                    //   style: TextStyle(
                                    //       color: Colors.grey.shade400,
                                    //       fontWeight: FontWeight.w500,
                                    //       fontSize: 12),
                                    // ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.height * 0.07,
                                      height: size.height * 0.07,
                                      decoration: const BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.equalizer_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "我的套餐",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // vs.subScribe.value != null
                                    //     ?
                                    Obx(() => Text(
                                          vs.subScribe.value.plan.name,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            // padding: const EdgeInsets.only(bottom: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.height * 0.07,
                                      height: size.height * 0.07,
                                      decoration: const BoxDecoration(
                                        color: Color(0xff20C4F8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.equalizer_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      '使用量',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() => Text(
                                        "${formatByteData(vs.subScribe.value.u + vs.subScribe.value.d)}/\n${formatByteData(vs.subScribe.value.transferEnable)}"))
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(const EventsPage());
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: size.height * 0.07,
                                        height: size.height * 0.07,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff8220F9),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.insert_invitation,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        '赚取流量',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        '邀请用户得\n流量和分成',
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          !vs.isExpired.value && !vs.trafficOut.value
              ? Get.to(const Proxy())
              : EasyLoading.showError("无有效套餐请付费订阅");
        },
        tooltip: '节点选择',
        child: const Icon(Icons.vpn_key_sharp),
      ),
    );
  }

  Future<void> _showRateDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 设置为false，用户必须选择一个选项才能关闭对话框
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('请给我们中肯的评价'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('您的评价对我们意义非凡,有助于我们更好的打磨产品'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('暂不评价'),
              onPressed: () {
                // customLaunch(Uri.parse("https://t.me/freevpnget"));
                Get.back();
              },
            ),
            TextButton(
              child: const Text('立即评价'),
              onPressed: () {
                final InAppReview inAppReview = InAppReview.instance;
                inAppReview.openStoreListing(
                    appStoreId: '6450592965', microsoftStoreId: '...');
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showTestDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 设置为false，用户必须选择一个选项才能关闭对话框
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('请测试节点连通性并选择适合的节点'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('去节点列表页，点击右下角测试按钮测试节点连通性并选择适合的节点'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('去测试'),
              onPressed: () {
                Get.back();
                Get.to(const Proxy());
              },
            ),
            // TextButton(
            //   child: const Text('立即观看'),
            //   onPressed: () {
            //     AdMobService.to.rewardedAd?.show(
            //       onUserEarnedReward: (adWhithoutView, rewardItem) {
            //         // 必要时处理用户赚取的奖励
            //         print('onUserEarnedReward');
            //       },
            //     );
            //     Get.back();
            //   },
            // ),
          ],
        );
      },
    );
  }
}
