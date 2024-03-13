import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import '../../service/clash_service.dart';
import '../../service/v2board_service.dart';

class Proxy extends StatefulWidget {
  const Proxy({Key? key}) : super(key: key);

  @override
  State<Proxy> createState() => _ProxyState();
}

class _ProxyState extends State<Proxy> {
  ClashService get service => Get.find<ClashService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ClashService>();
    Map<String, dynamic> maps = c.proxies.value['proxies'] ?? {};
    printInfo(info: 'proxies: ${maps["一键连"]}');
    // var selectors = maps.keys.where((proxy) {
    //   return maps[proxy]['type'] == 'Selector';
    // }).toList(growable: false);
    // printInfo(info: 'proxies: ${selectors}');
    // final mode = Get.find<ClashService>().configEntity.value?.mode ?? "direct";
    // if (c.proxies.value == null) {
    //   // if (maps.length < 2) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       automaticallyImplyLeading: false,
    //       backgroundColor: Colors.transparent,
    //       shadowColor: Colors.transparent,
    //       title: Text("Choose Localhost".tr),
    //       actions: const [
    //         Padding(
    //           padding: EdgeInsets.all(8.0),
    //           child: CloseButton(),
    //         )
    //       ],
    //     ),
    //     body: Stack(
    //       children: [
    //         Opacity(
    //             opacity: 0.4,
    //             child: Align(
    //                 alignment: Alignment.bottomRight,
    //                 child: Image.asset(
    //                   "assets/images/network.png",
    //                   width: 300,
    //                 ))),
    //         BrnAbnormalStateWidget(
    //           title: 'No Proxies'.tr,
    //           content: 'Select a profile to show proxies.',
    //         )
    //       ],
    //     ),
    //   );
    // } else if (mode == "direct") {
    //   return Scaffold(
    //     appBar: AppBar(
    //       automaticallyImplyLeading: false,
    //       backgroundColor: Colors.transparent,
    //       shadowColor: Colors.transparent,
    //       title: Text("Choose Localhost".tr),
    //       actions: const [
    //         Padding(
    //           padding: EdgeInsets.all(8.0),
    //           child: CloseButton(),
    //         )
    //       ],
    //     ),
    //     body: Stack(
    //       children: [
    //         Opacity(
    //             opacity: 0.4,
    //             child: Align(
    //                 alignment: Alignment.bottomRight,
    //                 child: Image.asset(
    //                   "assets/images/network.png",
    //                   width: 300,
    //                 ))),
    //         Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Image.asset(
    //                 "assets/images/rocket.png",
    //                 width: 100.0,
    //                 fit: BoxFit.cover,
    //               ),
    //               Text(
    //                 "direct".tr,
    //                 style: const TextStyle(
    //                     fontSize: 18.0, fontWeight: FontWeight.bold),
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // } else {
    //   selectors = selectors
    //       .where((sel) => maps[sel]['name'].toLowerCase() != 'global')
    //       .toList();
    // }
    // List<Tab> tabs = [];
    // List<Widget> tabviews = [];
    // for (var element in selectors) {
    //   tabs.add(Tab(
    //     text: element,
    //   ));
    //   tabviews.add(ListView.builder(
    //     scrollDirection: Axis.vertical,
    //     itemBuilder: (context, index) {
    //       return buildSelector(maps[element]);
    //     },
    //     itemCount: 1,
    //   ));
    // }
    var selector = maps['GLOBAL'];
    // printInfo(info: 'proxies: ${selector}');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Choose Localhost".tr),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CloseButton(),
          ),
        ],
        // bottom: TabBar(
        //     isScrollable: true,
        //     onTap: (index) {
        //       selector = maps[tabs[index].text];
        //     },
        //     labelColor: Theme.of(context).primaryTextTheme.headline6?.color,
        //     indicatorColor: Colors.pink,
        //     unselectedLabelColor: Colors.pinkAccent[50],
        //     indicatorSize: TabBarIndicatorSize.label,
        //     tabs: tabs),
      ),
      body: Stack(
        children: [
          Opacity(
              opacity: 0.4,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "assets/images/network.png",
                    width: 300,
                  ))),
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return buildSelector(maps["一键连"]);
            },
            itemCount: 1,
          )
          // TabBarView(
          //   children: tabviews,
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Test Delay".tr,
        onPressed: () async {
          final vs = Get.find<V2boardService>();
          final cs = Get.find<ClashService>();
          // if (!vs.isActive.value) {
          //   EasyLoading.showInfo("无有效套餐，请续费");
          //   return;
          // }

          List<dynamic> allItem = selector['all'];
          Future.delayed(Duration.zero, () {
            EasyLoading.show(status: 'Start test, please wait.'.tr);
          });
          await Get.find<ClashService>().testAllProxies(allItem);
          Future.delayed(Duration.zero, () {
            // BrnToast.show('Test complete.'.tr, context);
          });
          if (c.proxyStatus.isNotEmpty) {
            bool allValuesNotNegativeOne =
                c.proxyStatus.values.every((value) => value == -1);
            if (allValuesNotNegativeOne == false) {
              EasyLoading.showSuccess('Test complete.'.tr);
              cs.setTested(true);
            } else {
              _showTestfailDialog(context);
              cs.setTested(false);
            }
          }
          EasyLoading.dismiss();
        },
        child: const Icon(Icons.speed),
      ),
    );
  }

  Future<void> _showTestfailDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 设置为false，用户必须选择一个选项才能关闭对话框
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('所有节点暂不可用'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('请检查优先您的网络连接是否正常;如果是节点被墙我们会第一时间修复,请耐心等待'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('知道了'),
              onPressed: () {
                Get.back();
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

  Widget buildSelector(Map<String, dynamic> selector) {
    final proxyName = selector['name'];
    final isExpanded = false.obs;
    const headStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: buildSelectItem(selector)),
          ],
        ).paddingSymmetric(horizontal: 4.0),
        // for debug
        // kDebugMode ? BrnExpandableText(text: selector.toString(),maxLines: 1,textStyle: TextStyle(fontSize: 20,
        // color: Colors.black),) : Offstage(),
      ],
    );
//     return Stack(
//       children: [
//         Container(
//           margin: const EdgeInsets.all(8.0),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12.0), color: Colors.blue),
//           child: ExpansionPanelList(
//             elevation: 0,
//             key: ValueKey(proxyName),
//             expansionCallback: (index, expand) {
//               isExpanded.value = !expand;
//             },
//             children: [
//               ExpansionPanel(
//                 canTapOnHeader: true,
//                 // isExpanded: isExpanded.value,
//                 isExpanded: true,
//                 headerBuilder: (context, isExpanded) => Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   proxyName ?? "",
//                                   style: headStyle,
//                                 ).marginOnly(bottom: 4.0),
//                               ),
//                             ],
//                           ),
//                           Text(selector['now'])
//                         ],
//                       ),
//                     ),
//                   ],
//                 ).paddingAll(8.0),
//                 body: body,
//               ),
//             ],
//           ),
//         ),
//         Align(
//           alignment: Alignment.topRight,
//           child: TextButton(
//               onPressed: () async {
//                 List<dynamic> allItem = selector['all'];
//                 Future.delayed(Duration.zero, () {
// // BrnToast.show('Start test, please wait.'.tr, context);
//                   EasyLoading.showProgress(1.0,
//                       status: 'Start test, please wait.'.tr);
//                 });
//                 await Get.find<ClashService>().testAllProxies(allItem);
//                 Future.delayed(Duration.zero, () {
// // BrnToast.show('Test complete.'.tr, context);
//                   EasyLoading.showSuccess('Test complete.'.tr);
//                 });
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "Test Delay".tr,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//               )),
//         ).paddingAll(4.0)
//       ],
//     );
  }

  Widget buildSelectItem(Map<String, dynamic> selector) {
    final selectName = selector['name'];
    final now = selector['now'];
    bool isDarkTheme = SpUtil.getBool("is_dark", defValue: false)!;
    List<dynamic> allItems = selector['all'];
    return Column(
      children: [
        Obx(
          () {
            var index = 0;
            return Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: allItems.map((itemName) {
                final delayInMs = service.proxyStatus[itemName.toString()] ?? 0;
                // print(delayInMs.runtimeType);
                return Card(
                  elevation: 6,
                  color: isDarkTheme
                      ? const Color(0xff181227)
                      : const Color(0xffF5F5F6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 75,
                          decoration: BoxDecoration(
                            // color: delayInMs < 0
                            //     ? Colors.red
                            //     : delayInMs == 0
                            //     ? Colors.grey
                            //     : Colors.green,
                            color: delayInMs < 0
                                ? Colors.red
                                : delayInMs == 0
                                    ? Colors.grey
                                    : delayInMs <= 100
                                        ? Colors.green
                                        : delayInMs <= 500
                                            ? Colors.lightBlue
                                            : delayInMs <= 1000
                                                ? Colors.blue
                                                : Colors.orange,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                        ),
                        Expanded(
                          child: BrnRadioButton(
                              radioIndex: index++,
                              behavior: HitTestBehavior.opaque,
                              mainAxisSize: MainAxisSize.max,
                              onValueChangedAtIndex: (newIndex, value) {
                                if (delayInMs == -1) {
                                  EasyLoading.showError("当前节点似乎不可用,请选择可用的节点");
                                  return;
                                }
                                final cs = Get.find<ClashService>();
                                final res = cs.changeProxy(
                                    selectName, allItems[newIndex]);
                                if (cs.isSystemProxyObs.value) {
                                  cs
                                      .clearSystemProxy()
                                      .then((value) => cs.setSystemProxy());
                                }
                                // if (res) {
                                //   EasyLoading.showSuccess(
                                //       'switch to name success.'.trParams(
                                //           {"name": "${allItems[newIndex]}"}));
                                // } else {
                                //   EasyLoading.showError('switch to name failed.'
                                //       .trParams(
                                //           {"name": "${allItems[newIndex]}"}));
                                // }
                                Future.delayed(Duration.zero, () {
                                  setState(() {});
                                });
                              },
                              isSelected: itemName == now,
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Tooltip(
                                        message: itemName.toString(),
                                        child: Text(
                                          itemName,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline6,
                                        ),
                                      ).marginOnly(left: 4.0),
                                    ),
                                    Text(
                                      // delayInMs == 0 ? '' : '${delayInMs}ms',
                                      delayInMs == 0
                                          ? ''
                                          : delayInMs < 0
                                              ? "未知"
                                              : '${delayInMs}ms',
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ).marginOnly(right: 4.0)
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(growable: false),
            );
          },
        ),
        const SizedBox(
          height: kToolbarHeight,
        )
      ],
    );
  }
}
