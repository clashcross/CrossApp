import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sp_util/sp_util.dart';
import '../../http/options.dart';
import '../../service/v2board_service.dart';
import '../../tools/customlaunch.dart';

class InvitationPage extends StatelessWidget {
  const InvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = SpUtil.getBool("is_dark", defValue: false)!;

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text("My Invitation".tr),
      ),

      body: Obx(() {
        final vs = Get.find<V2boardService>();
        // vs.inviteFetch();
        final userInfo = vs.userInfo;
        var inviteFetchEntityEntity = vs.inviteFetchEntityEntity.value;
        final userCommConfigEntity = vs.userCommConfigEntity;
        if (inviteFetchEntityEntity != null) {
          return ListView(
            children: [
              // Container(
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
              //   child: Lottie.asset(
              //     'assets/images/animation_Invitation.json',
              //     // width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height * 0.2,
              //     fit: BoxFit.fitHeight,
              //   ),
              // ),
              const ListTile(
                leading: Icon(
                  Icons.pattern,
                  color: Colors.green,
                ),
                title: Text("加入我们的合作者计划"),
                subtitle: Text(
                    "每邀请一个注册成功即增加流量和使用时长;邀请的用户购买了套餐,您将获得每次购买金额20%提成.对于符合条件的合作者,每邀请一个注册即可额外获得分成.具体政策请查看官网"),
              ),
              Container(
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
                  // leading: const Text('我的邀请'),
                  trailing: Text(userInfo.value.commissionBalance == 0
                      ? '0 ${userCommConfigEntity.value.currency}'
                      : (userInfo.value.commissionBalance / 100)
                              .toStringAsExponential(2) +
                          userCommConfigEntity.value.currency),
                  title: const Text("当前佣金"),
                ),
              ),
              Container(
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
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Text('已注册用户数'),
                        trailing: Text("${inviteFetchEntityEntity.stat[0]}人"),
                      ),
                      ListTile(
                        leading: const Text('佣金比例'),
                        trailing: Text("${inviteFetchEntityEntity.stat[3]}%"),
                      ),
                      ListTile(
                        leading: const Text('确认中的佣金'),
                        trailing: Text(
                            inviteFetchEntityEntity.stat[2].toString() +
                                userCommConfigEntity.value.currency),
                      ),
                      ListTile(
                        leading: const Text('累计获得的佣金'),
                        trailing: Text(
                            inviteFetchEntityEntity.stat[1].toString() +
                                userCommConfigEntity.value.currency),
                      ),
                    ],
                  )),
              Container(
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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("邀请码管理"),
                      TextButton(
                          onPressed: () {
                            vs.createNewCode();
                          },
                          child: const Text("生成邀请码"))
                    ],
                  ),
                  subtitle: SizedBox(
                    height: 150,
                    child: ListView.builder(
                        itemCount: inviteFetchEntityEntity.codes.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(inviteFetchEntityEntity.codes[index].code),
                              TextButton(
                                  onPressed: () {
                                    final vs = Get.find<V2boardService>();
                                    FlutterClipboard.copy(
                                            "${vs.siteUrl.value.siteurl}#/register?code=${inviteFetchEntityEntity.codes[index].code}")
                                        .then((value) {
                                      // BrnToast.show('Success'.tr, context);
                                      EasyLoading.showSuccess('Success'.tr);
                                    });
                                  },
                                  child: const Text("点击复制")),
                            ],
                          );
                        }),
                  ),
                ),
              ),
              Container(
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
                child: TextButton(
                  onPressed: () async {
                    var url = await vs.quickUrl("stage/invite");
                    customLaunch(Uri.parse(url));
                  },
                  child: const Text('提现、划转等,请访问官网'),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: TextButton(
              onPressed: () {
                vs.inviteFetch();
              },
              child: const Text("重新加载"),
            ),
          );
        }
      }),

      // body: vs.orders != null
      //     ? ListView.builder(
      //         itemCount: vs.orders?.length,
      //         itemBuilder: (context, index) {
      //           return Container(
      //             // height: kToolbarHeight,
      //             margin:
      //                 const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(10),
      //               color: isDarkTheme
      //                   ? const Color(0xff181227)
      //                   : const Color(0xffF5F5F6),
      //             ),
      //             padding: const EdgeInsets.all(5),
      //             child: ListTile(
      //               // leading: Text(vs.orders![index].tradeNo),
      //               title: Text(
      //                   '${vs.orders![index].tradeNo.substring(0, 20)}...'),
      //               subtitle: statusWidget(vs.orders![index].status),
      //               trailing: trailingWidget(vs.orders![index]),
      //             ),
      //           );
      //         },
      //       )
      //     : Center(
      //         child: TextButton(
      //           onPressed: () {},
      //           child: const Text("网络错误"),
      //         ),
      //       ),
    );
  }
}
