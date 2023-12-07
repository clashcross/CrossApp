//ignore_for_file: file_names
import 'dart:async';
import 'dart:io';
import 'package:clashcrossplus/tools/customlaunch.dart';
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
                      importsub(Uri.parse(
                          "clashcross://?url=$url&name=&siteurl=&sitename="),context);
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
            }),
          ],
        ),
      );
    });
  }

  void importsub(command,context) async {
    if (await canLaunchUrl(command)) {
      try {
        await launchUrl(
          command,
          // mode: LaunchMode.externalApplication,
        );
      } catch (e) {
        if (!Platform.isIOS) {
          _showMyDialog(context);
        } else {
          EasyLoading.showError('请确保您的设备已经安装小火箭');
        }
      }
    } else {
      if (!Platform.isIOS) {
        _showMyDialog(context);
      } else {
        print('请确保您的设备已经安装小火箭');
        EasyLoading.showError('请确保您的设备已经安装Shadowrocket');
      }
    }
  }


  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // 设置为false，用户必须选择一个选项才能关闭对话框
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('请下载ClashCross继续使用'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Clashcross是一款支持Android,Windows,MacOS以及Linux的代理软件'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Github下载'),
              onPressed: () {
                customLaunch(Uri.parse("https://github.com/clashcross/ClashCross/releases"));
              },
            ),
            TextButton(
              child: const Text('官网下载'),
              onPressed: () {
                customLaunch(Uri.parse("https://www.clashcross.xyz/"));
              },
            ),
          ],
        );
      },
    );
  }
}
