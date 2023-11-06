import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../main.dart';
import '../../service/clash_service.dart';
import '../../service/v2board_service.dart';
import '../../tools/customlaunch.dart';
import '../plans/plans.dart';
import 'invitation_page.dart';
import 'knowledge_page.dart';
import 'notices_page.dart';
import 'orders.dart';
import 'servers.dart';
import 'setting.dart';

class UserCenter extends StatefulWidget {
  const UserCenter({Key? key}) : super(key: key);

  @override
  State<UserCenter> createState() => _SettingState();
}

class _SettingState extends State<UserCenter> {
  @override
  Widget build(BuildContext context) {
    final vs = Get.find<V2boardService>();
    const textStyle = TextStyle(fontFamily: 'nssc');

    return SettingsList(platform: DevicePlatform.iOS, sections: [
      SettingsSection(
        title: Text(
          "SUBSCRIPTION".tr,
          style: textStyle,
        ),
        tiles: [
          SettingsTile.navigation(
            title: Text(
              "Purchase Subscription".tr,
              style: textStyle,
            ),
            onPressed: (cxt) {
              Get.to(const Plans());
              vs.setShowBackButton(true);
            },
          ),
          SettingsTile.navigation(
            title: Text(
              "Access Point Status".tr,
              style: textStyle,
            ),
            onPressed: (cxt) {
              Get.to(const Servers());
            },
          ),

          SettingsTile.navigation(
            title: Text(
              "Knowledge".tr,
              style: textStyle,
            ),
            onPressed: (cxt) async {
              // Get.to(const KnowledgePage());
              var url = await vs.quickUrl("knowledge");
              customLaunch(Uri.parse(url));
            },
          ),

          // SettingsTile.navigation(
          //   title: Text(
          //     "Login".tr,
          //     style: textStyle,
          //   ),
          //   onPressed: (cxt) {
          //     Get.to(const LoginPage());
          //   },
          // ),
          // SettingsTile.navigation(
          //   title: Text(
          //     "HTTP proxy port".tr,
          //     style: textStyle,
          //   ),
          //
          //   onPressed: (cxt) {
          //     Get.find<DialogService>().inputDialog(
          //         title: 'Enter custom port for HTTP proxy port'.tr,
          //         onText: (text) {
          //           final port = int.tryParse(text);
          //           if (port == null) {
          //             // BrnToast.show('no a valid port'.tr, context);
          //             EasyLoading.showError('no a valid port');
          //           } else {
          //             Get.find<ClashService>()
          //                 .changeConfigField('port', port);
          //             SpUtil.setData('http-port', port);
          //           }
          //         });
          //   },
          // ),
          // SettingsTile.navigation(
          //   title: Text(
          //     "Redir proxy port".tr,
          //     style: textStyle,
          //   ),
          //   value: Text(
          //     cs.configEntity.value!.redirPort.toString(),
          //     style: textStyle,
          //   ),
          //   onPressed: (cxt) {
          //     Get.find<DialogService>().inputDialog(
          //         title: 'Enter custom port for redir proxy port'.tr,
          //         onText: (text) {
          //           final port = int.tryParse(text);
          //           if (port == null) {
          //             // BrnToast.show('no a valid port'.tr, context);
          //             EasyLoading.showError('no a valid port'.tr);
          //           } else {
          //             Get.find<ClashService>()
          //                 .changeConfigField('redir-port', port);
          //             SpUtil.setData('redir-port', port);
          //           }
          //         });
          //   },
          // ),
          // SettingsTile.navigation(
          //   title: Text(
          //     "Mixed proxy port".tr,
          //     style: textStyle,
          //   ),
          //   value: Text(
          //     cs.configEntity.value!.mixedPort.toString(),
          //     style: textStyle,
          //   ),
          //   onPressed: (cxt) {
          //     Get.find<DialogService>().inputDialog(
          //         title: 'Enter custom port for mixed proxy port'.tr,
          //         onText: (text) {
          //           final port = int.tryParse(text);
          //           if (port == null) {
          //             // BrnToast.show('no a valid port'.tr, context);
          //             EasyLoading.showError('no a valid port'.tr);
          //           } else {
          //             Get.find<ClashService>()
          //                 .changeConfigField('mixed-port', port);
          //             SpUtil.setData('mixed-port', port);
          //           }
          //         });
          //   },
          // ),
          // SettingsTile.switchTile(
          //     title: Text(
          //       "allow_lan".tr,
          //       style: textStyle,
          //     ),
          //     initialValue: cs.configEntity.value?.allowLan,
          //     onToggle: (e) {
          //       Get.find<ClashService>()
          //           .changeConfigField('allow-lan', e);
          //     }),
          // SettingsTile.switchTile(
          //     title: Text(
          //       "Enable IPv6".tr,
          //       style: textStyle,
          //     ),
          //     initialValue: cs.configEntity.value?.ipv6,
          //     onToggle: (e) {
          //       Get.find<ClashService>().changeConfigField('ipv6', e);
          //     }),
          // SettingsTile.navigation(
          //   title: Text(
          //     'Connections'.tr,
          //     style: textStyle,
          //   ),
          //   onPressed: (cxt) {
          //     Get.to(const Connections());
          //   },
          // ),
          // SettingsTile.navigation(
          //   title: Text(
          //     'Log'.tr,
          //     style: textStyle,
          //   ),
          //   onPressed: (cxt) {
          //     Get.to(const ClashLog());
          //   },
          // ),
        ],
      ),
      SettingsSection(
        title: Text(
          "BILLING".tr,
          style: textStyle,
        ),
        tiles: [
          SettingsTile.navigation(
            title: Text(
              "My Orders".tr,
              style: textStyle,
            ),
            onPressed: (cxt) {
              Get.to(const Orders());
            },
          ),
          SettingsTile.navigation(
            title: Text(
              "My Invitation".tr,
              style: textStyle,
            ),
            onPressed: (cxt) {
              Get.to(const InvitationPage());
            },
          ),
        ],
      ),
      SettingsSection(
        title: Text(
          "ACCOUNT".tr,
          style: textStyle,
        ),
        tiles: [
          // SettingsTile.navigation(
          //   title: Text(
          //     "User Center".tr,
          //     style: textStyle,
          //   ),
          //   onPressed: (cxt) {},
          // ),
          // SettingsTile.navigation(
          //   title: Text(
          //     "My Tickets".tr,
          //     style: textStyle,
          //   ),
          //   onPressed: (cxt) {},
          // ),
          // SettingsTile.navigation(
          //   title: Text(
          //     "Transfer Data Details".tr,
          //     style: textStyle,
          //   ),
          //   onPressed: (cxt) {},
          // ),
          SettingsTile.navigation(
            title: Text(
              "announcements".tr,
              style: textStyle,
            ),
            onPressed: (cxt) {
              Get.to(const NoticesPage());
            },
          ),

          SettingsTile.navigation(
            title: Text(
              "My Tickets".tr,
              style: textStyle,
            ),
            onPressed: (cxt) async {
              var url = await vs.quickUrl("ticket");
              customLaunch(Uri.parse(url));
            },
          ),
          SettingsTile.navigation(
            title: Text(
              "Set Mtproto".tr,
              style: textStyle,
            ),
            onPressed: (cxt) {
              customLaunch(Uri.parse("tg://socks?server=127.0.0.1&port=${Get.find<ClashService>().configEntity.value!.socksPort}"));
            },
          ),
          SettingsTile.navigation(
            title: Text(
              "Setting".tr,
              style: textStyle,
            ),
            onPressed: (cxt) {
              Get.to(const Setting());
            },
          ),
        ],
      ),
    ]);
  }
}
