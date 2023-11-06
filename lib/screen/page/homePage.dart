//ignore_for_file: file_names
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:sp_util/sp_util.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../../service/v2board_service.dart';
import '../../tools/helper.dart';
import '../component/speed.dart';
import '../plans/plans.dart';
import 'invitation_page.dart';
import 'proxy.dart';
import '../../service/clash_service.dart';
import '../../service/notification_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = SpUtil.getBool("is_dark", defValue: false)!;
    return Obx(() {
      final cs = Get.find<ClashService>();
      // final nt = Get.find<NotificationService>();
      final vs = Get.find<V2boardService>();
      // vs.getSubscribe();
      Map<String, dynamic> m = cs.proxies['proxies'];
      // m.removeWhere((key, value) => value['type'] != "Selector");
      // print(m.keys);
      // return Container();
      // for (final k in m.keys) {
      //  print("${m[k]['name']}: ${m[k]['now']}");
      //  // print(m[k]);
      // }
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: vs.isActive.value
                  ? SizedBox(
                      height: kToolbarHeight * 1.2,
                      child: Card(
                        elevation: 6,
                        color: isDarkTheme
                            ? const Color(0xff181227)
                            : const Color(0xffF5F5F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Builder(builder: (context) {
                          return ListTile(
                            onTap: () {
                              Get.to(const Proxy());
                            },
                            leading: SvgPicture.asset(
                              'assets/active.svg',
                              width: 30,
                              alignment: Alignment.center,
                            ),
                            trailing: SizedBox(
                              child: IconButton(
                                icon: Icon(
                                  Icons.navigate_next_outlined,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                onPressed: () {
                                  Get.to(const Proxy());
                                },
                              ),
                            ),
                            title: Text(
                              'Current using'
                                  .trParams({"name": cs.currentYaml.value}),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style:
                                  Theme.of(context).primaryTextTheme.headline6,
                            ),
                          );
                        }),
                      ),
                    )
                  : Card(
                      elevation: 6,
                      color: isDarkTheme
                          ? const Color(0xff181227)
                          : const Color(0xffF5F5F6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Builder(builder: (context) {
                        return ListTile(
                          onTap: () {
                            vs.setShowBackButton(true);
                            Get.to(const Plans());
                          },
                          leading: SvgPicture.asset(
                            // 'assets/flags/${Flags.list[currentLocIndex]['imagePath']}',
                            'assets/active.svg',
                            width: 30,
                            alignment: Alignment.center,
                          ),
                          trailing: SizedBox(
                            // width: 80,
                            child: IconButton(
                              icon: Icon(
                                Icons.navigate_next_outlined,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              onPressed: () {
                                vs.setShowBackButton(true);
                                Get.to(const Plans());
                              },
                            ),
                          ),
                          title: Text(
                            'No Profile Please import'.tr,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).primaryTextTheme.headline6,
                          ),
                        );
                      }),
                    ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            //   child: SpeedWidget(),
            // ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Lottie.asset(
                  'assets/images/animation_map.json',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.fitHeight,
                ),
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      var url = vs.subScribe!.subscribeUrl;
                      // if(url.startsWith("http://")) {
                      //   url = url.substring(7);
                      // } else if(url.startsWith("https://")) {
                      //   url = url.substring(8);
                      // }

                      importsub(Uri.parse(
                          "clashcross://?url=$url&name=&siteurl=&sitename="));
                      // if (cs.isSystemProxyObs.value) {
                      //   cs.clearSystemProxy();
                      //   if (!Platform.isWindows) {
                      //     // nt.cancelNotification("ClashCrossRun");
                      //     nt.cancelAllNotification();
                      //   }
                      // } else if (vs.isActive.value == false) {
                      //   EasyLoading.show(
                      //       status: "无有效套餐,请续费", dismissOnTap: true);
                      // } else {
                      //   cs.setSystemProxy();
                      //   if (!isDesktop) {
                      //     if (Platform.isAndroid) {
                      //       FlutterLocalNotificationsPlugin
                      //           flutterLocalNotificationsPlugin =
                      //           FlutterLocalNotificationsPlugin();
                      //       flutterLocalNotificationsPlugin
                      //           .resolvePlatformSpecificImplementation<
                      //               AndroidFlutterLocalNotificationsPlugin>()
                      //           ?.requestPermission();
                      //       Timer.periodic(const Duration(seconds: 1), (t) {
                      //         nt.showNotification("一键连连接守护",
                      //             "↑:${cs.uploadRate.value.toStringAsFixed(1)}KB/s ↓:${cs.downRate.value.toStringAsFixed(1)}KB/s");
                      //       });
                      //     }
                      //   }
                      // }
                    },
                    child: Card(
                      elevation: 6,
                      color: isDarkTheme
                          ? const Color(0xff181227)
                          : const Color(0xffF5F5F6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: SizedBox.square(
                        // dimension: 150 * 2,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SvgPicture.asset('assets/powOn.svg',
                              //     width: 50,
                              //     color: Colors.redAccent.shade200),
                              const Icon(
                                Icons.label_important_outline,
                                size: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '导入到ClashCross'.tr,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline6,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  );
                }),
              ],
            ),
            // const ExpiredWidget(),
            Obx(() {
              DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
                  (vs.userInfo.value.expiredAt) * 1000);
              // 格式化日期时间字符串
              String formattedDateTime = formatDate(dateTime);

              if (vs.isActive.value == false) {
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
                    leading: const Icon(Icons.warning, color: Colors.red),
                    title: Text("Account has expired".tr),
                    // subtitle: Text(
                    //   "${"Account Valid".tr}:$formattedDateTime",
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    trailing: TextButton(
                        onPressed: () {
                          vs.setShowBackButton(true);
                          Get.to(const Plans());
                        },
                        child: Text("Renewal".tr)),
                  ),
                );
              } else {
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
                    leading: const Icon(
                      Icons.notifications_active,
                      color: Colors.green,
                    ),
                    title: Text("Account Valid".tr),
                    subtitle: Text(
                      vs.userInfo.value.expiredAt != 0
                          ? "${"Valid Until".tr}$formattedDateTime"
                          : "${"Valid Until".tr}长期有效",
                      // overflow: TextOverflow.ellipsis,
                    ),
                    trailing: TextButton(
                        onPressed: () {
                          Get.to(const InvitationPage());
                        },
                        child: Text("Referral Rewards".tr)),
                  ),
                );
              }
              // else if (vs.subScribe != null) {
              //   if ((vs.subScribe!.d + vs.subScribe!.u) >=
              //       vs.subScribe!.transferEnable) {
              //     return Container(
              //       // height: kToolbarHeight,
              //       margin: const EdgeInsets.symmetric(
              //           horizontal: 10.0, vertical: 2),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: isDarkTheme
              //             ? const Color(0xff181227)
              //             : const Color(0xffF5F5F6),
              //       ),
              //       padding: const EdgeInsets.all(5),
              //       child: ListTile(
              //         leading: const Icon(Icons.warning, color: Colors.red),
              //         title: Text("Out of Data".tr),
              //         // subtitle: Text(
              //         //   "到期时间:$formattedDateTime",
              //         //   overflow: TextOverflow.ellipsis,
              //         // ),
              //         trailing: TextButton(
              //             onPressed: () {
              //               Get.to(const Plans());
              //             },
              //             child: Text("Renewal".tr)),
              //       ),
              //     );
              //   } else {
              //     return Container(
              //       // height: kToolbarHeight,
              //       margin: const EdgeInsets.symmetric(
              //           horizontal: 10.0, vertical: 2),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: isDarkTheme
              //             ? const Color(0xff181227)
              //             : const Color(0xffF5F5F6),
              //       ),
              //       padding: const EdgeInsets.all(5),
              //       child: ListTile(
              //         leading: const Icon(
              //           Icons.notifications_active,
              //           color: Colors.green,
              //         ),
              //         title: Text("Account Valid".tr),
              //         subtitle: Text(
              //           "${"Valid Until".tr}:$formattedDateTime",
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //         trailing: TextButton(
              //             onPressed: () {
              //               Get.to(const InvitationPage());
              //             },
              //             child: Text("Referral Rewards".tr)),
              //       ),
              //     );
              //   }
              // }

              return Container();

              // return Container(
              //   // height: kToolbarHeight,
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: isDarkTheme
              //         ? const Color(0xff181227)
              //         : const Color(0xffF5F5F6),
              //   ),
              //   padding: const EdgeInsets.all(5),
              //   child: ListTile(
              //     leading: const Icon(
              //       Icons.notifications_active,
              //       color: Colors.green,
              //     ),
              //     title: const Text("账户有效"),
              //     subtitle: Text(
              //       "有效期:$formattedDateTime",
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //     trailing: TextButton(
              //         onPressed: () {
              //           Get.to(const InvitationPage());
              //         },
              //         child: const Text("推荐有奖")),
              //   ),
              // );
            }),
          ],
        ),
      );
    });
  }

  void importsub(command) async {
    if (await canLaunchUrl(command)) {
      try {
        await launchUrl(
          command,
          // mode: LaunchMode.externalApplication,
        );
      } catch (e) {
        if (!Platform.isIOS) {
          EasyLoading.showError('请确保您的设备已经安装clashcross');
        } else {
          EasyLoading.showError('请确保您的设备已经安装小火箭');
        }
      }
    } else {
      if (!Platform.isIOS) {
        print('请确保您的设备已经安装clashcross');
        EasyLoading.showError('请确保您的设备已经安装clashcross');
      } else {
        print('请确保您的设备已经安装小火箭');
        EasyLoading.showError('请确保您的设备已经安装Shadowrocket');
      }
    }
  }
}
