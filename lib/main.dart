import 'dart:async';
import 'dart:io';

import 'package:app_links/app_links.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:proxy_manager/proxy_manager.dart';
import 'package:sp_util/sp_util.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:url_protocol/url_protocol.dart';
import 'package:window_manager/window_manager.dart';
import 'http/options.dart';
import 'model/appTheme.dart';
import 'screen/component/desk_options.dart';
import 'screen/introduction_animation/introduction_animation_screen.dart';
import 'screen/page/homePage.dart';
import 'screen/page/notices_page.dart';
import 'screen/page/setting.dart';
import 'screen/page/user_center.dart';
import 'screen/plans/plans.dart';
import 'service/autostart_service.dart';
import 'service/clash_service.dart';
import 'service/dialog_service.dart';
import 'service/notification_service.dart';
import 'service/v2board_service.dart';
import 'translation/clash_translation.dart';

final proxyManager = ProxyManager();
final isDesktop = GetPlatform.isDesktop;

Future<void> initWindow() async {
  WindowOptions opts = const WindowOptions(
    minimumSize: Size(700, 800),
    size: Size(700, 800),
    // maximumSize: Size(700, 800),
    center: true,
    windowButtonVisibility: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: true,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(opts, () {
    // hide window when start
    // Get.lazyPut(() => ClashService());
    // if (Get.find<ClashService>().isHideWindowWhenStart() && kReleaseMode) {
    //   windowManager.hide();
    // }
  });
}

Future<void> initAppTray(
    {List<MenuItem>? details, bool isUpdate = false}) async {
  await trayManager.setIcon(Platform.isWindows
      ? 'assets/images/rocket.ico'
      : 'assets/images/rocket.png');
  List<MenuItem> items = [
    MenuItem(
      key: 'show',
      label: 'Show'.tr,
    ),
    MenuItem.separator(),
    MenuItem(
      key: 'exit',
      label: 'Exit'.tr,
    ),
  ];
  if (details != null) {
    items.insertAll(0, details);
  }
  await trayManager.setContextMenu(Menu(items: items));
}

Future<void> initAppService() async {
  // await Get.putAsync(() => NotificationService().init());
  await Get.putAsync(() => ClashService().init());
  await Get.putAsync(() => DialogService().init());
  await Get.putAsync(() => V2boardService().init());
  if (isDesktop) {
    await Get.putAsync(() => AutostartService().init());
  }
  // Get.put(ThemeController());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SpUtil.getInstance();
  // 隐藏状态栏
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness:
    !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  // _registerWindowsProtocol();
  if (isDesktop) {
    await Future.wait([
      Future.microtask(() async {
        await windowManager.ensureInitialized();
        await windowManager.setPreventClose(true);
      })
    ]);
  }

  await initAppService().then((value) {
    if (isDesktop) {
      initWindow();
    }
  });
// Set device orientation in potrait mode.
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      (Platform.isAndroid || Platform.isMacOS || Platform.isIOS)
          ? const MyApp()
          : const MyAppNoFirebase(),
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider<ThemeCollection>.value(
      //         value: ThemeCollection()),
      //   ],
      //   child: (Platform.isAndroid || Platform.isMacOS || Platform.isIOS)
      //       ? const MyApp()
      //       : const MyAppNoFirebase(),
      // ),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // if (!Platform.isLinux) {
    //   initDeepLinks();
    // }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = SpUtil.getString('lan', defValue: '')!;
    Locale? storedLocale;
    if (locale.isNotEmpty) {
      final tuple = locale.split('_');
      storedLocale = Locale(tuple[0], tuple[1]);
    }
    bool isDark = SpUtil.getBool("is_dark",defValue: false)!;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: ClashTranslations(),
      locale: storedLocale ?? Get.deviceLocale,
      supportedLocales: const [Locale("zh", "CN"), Locale("en", "US")],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light ,
      theme: AppTheme.theme(),
      darkTheme: AppTheme.darkTheme(),
      home: const MyHomePage(),
      // home: Obx(()=>vs.isLogin.value
      //     ? const MyHomePage()
      //     : const IntroductionAnimationScreen(),),
      builder: EasyLoading.init(),
    );
  }
}

class MyAppNoFirebase extends StatefulWidget {
  const MyAppNoFirebase({super.key});

  @override
  State<MyAppNoFirebase> createState() => _MyAppNoFirebaseState();
}

class _MyAppNoFirebaseState extends State<MyAppNoFirebase> {
  @override
  void initState() {
    // if (!Platform.isLinux) {
    //   initDeepLinks();
    // }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locale = SpUtil.getString('lan', defValue: '')!;
    bool isDark = SpUtil.getBool("is_dark",defValue: false)!;
    Locale? storedLocale;
    if (locale.isNotEmpty) {
      final tuple = locale.split('_');
      storedLocale = Locale(tuple[0], tuple[1]);
    }
    // final vs = Get.find<V2boardService>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: ClashTranslations(),
      locale: storedLocale ?? Get.deviceLocale,
      supportedLocales: const [Locale("zh", "CN"), Locale("en", "US")],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // title: 'Clash Cross',
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light ,
      theme: AppTheme.theme(),
      darkTheme: AppTheme.darkTheme(),
      home: const MyHomePage(),
      // home: Obx(()=>vs.isLogin.value
      //     ? const MyHomePage()
      //     : const IntroductionAnimationScreen(),),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with WindowListener, TrayListener {
  int currentPage = 0;
  final List<Map<String, dynamic>> _itemsList = [
    {
      'name': 'Home'.tr,
      'iconPath': 'assets/home.svg',
      'route': const HomePage()
    },
    {
      'name': '套餐'.tr,
      'iconPath': 'assets/logo.svg',
      'route': const Plans()
    },
    // {
    //   'name': 'Connections'.tr,
    //   'iconPath': 'assets/active.svg',
    //   'route': const Connections()
    // },
    // {
    //   'name': 'Log'.tr,
    //   'iconPath': 'assets/history.svg',
    //   'route': const ClashLog()
    // },
    {
      'name': 'Setting'.tr,
      'iconPath': 'assets/settings.svg',
      'route': const UserCenter()
    }
  ];



  //提示评分
  _inAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  @override
  void onWindowClose() {
    super.onWindowClose();
    windowManager.hide();
  }

  @override
  void onTrayIconMouseDown() {
    // windowManager.focus();
    windowManager.show();
  }

  @override
  void onTrayIconRightMouseDown() {
    super.onTrayIconRightMouseDown();
    trayManager.popUpContextMenu();
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) {
    switch (menuItem.key) {
      case 'exit':
        windowManager.close().then((value) async {
          await Get.find<ClashService>().closeClashDaemon();
          exit(0);
        });
        break;
      case 'show':
        windowManager.focus();
        windowManager.show();
    }
  }

  @override
  void initState() {
    _inAppReview();
    windowManager.addListener(this);
    trayManager.addListener(this);
    initAppTray();
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    // trayManager.removeListener(this);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = SpUtil.getBool("is_dark",defValue: false)!;
    final vs = Get.find<V2boardService>();
      return Obx(() {
        if(vs.isLogin.value){
          return Scaffold(
            appBar: !isDesktop && currentPage != 1
                ? AppBar(
                automaticallyImplyLeading: false,
                shadowColor: Colors.transparent,
                title: currentPage == 2
                    ? Text('User Center'.tr)
                    : const Text(HttpOptions.appName,),
                actions: (currentPage == 0 || currentPage == 1)
                    ? [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      // onTap: () => Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (builder) => const ProRoute())),
                      // onTap: () => scanQRCode(),
                      onTap: () => Get.to(const NoticesPage()),
                      child: const Icon(Icons.notifications_active),
                    ),
                  ),
                ]
                    : [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      // onTap: () => Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (builder) => const ProRoute())),
                      onTap: () => Get.to(const Setting()),
                      child: const Icon(Icons.settings),
                    ),
                  ),
                ])
                : null,

            /*Here Bottom Navigation Bar with some padding, margin,
           little bit color & border decoration*/
            bottomNavigationBar: Container(
              margin: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
              padding: const EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                  color:
                  const Color(0xff353351).withOpacity(isDarkTheme ? 0.3 : 0.05),
                  borderRadius: BorderRadius.circular(20)),
              child: BottomNavigationBar(
                  enableFeedback: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  showSelectedLabels: true,
                  showUnselectedLabels: false,
                  // selectedLabelStyle:
                  //     TextStyle(color: Theme.of(context).primaryColor),
                  // selectedItemColor: Theme.of(context).primaryColor,
                  currentIndex: currentPage,
                  onTap: (value) => setState(() {
                    currentPage = value;
                    Get.find<V2boardService>().setShowBackButton(false);
                  }),
                  items: List.generate(
                      _itemsList.length,
                          (index) => BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                            _itemsList[index]['iconPath'] as String,
                            height: index != currentPage ? 20 : 24,
                            color: index != currentPage
                                ? const Color(0xffB5AEBE)
                                : Theme.of(context).primaryColor),
                        label: _itemsList[index]['name'] as String,
                      ))),
            ),
            // body: UpgradeAlert(
            //     upgrader: Upgrader(
            //       appcastConfig: cfg,
            //       dialogStyle: UpgradeDialogStyle.cupertino,
            //     ),
            //     child: Column(
            //       children: [
            //         isDesktop ? const DeskOptions() : Container(),
            //         Expanded(
            //           child: _itemsList[currentPage]['route'] as Widget,
            //         )
            //       ],
            //     )
            //
            //   // _itemsList[currentPage]['route'] as Widget),
            // ),
            body: Column(
              children: [
                isDesktop ? const DeskOptions() : Container(),
                Expanded(
                  child: _itemsList[currentPage]['route'] as Widget,
                )
              ],
            ),
          );
        }else{
          return Column(children: [
            isDesktop ? const DeskOptions() : Container(),
           const Expanded(child:  IntroductionAnimationScreen()),
          ],);
        }
      });


  }

  Future<void> scanQRCode() async {
    String barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000', // 扫描框的颜色
      'Cancel'.tr, // 取消按钮的文本
      true, // 是否显示闪光灯按钮
      ScanMode.QR, // 扫描模式，可以是QR或BARCODE
    );

    if (!mounted) return; // 处理异步回调时，检查页面是否还在显示

    // 处理扫描结果
    // setState(() {
    //   // 这里可以对扫描到的二维码数据进行处理
    //   print('扫描结果： $barcodeScanResult');
    // });

    if (isURL(barcodeScanResult)) {
      Get.find<DialogService>().inputDialog(
          title: "What is your config name".tr,
          onText: (name) async {
            if (name == "config") {
              EasyLoading.showError("Cannot use this special name".tr);
              // BrnToast.show("Cannot use this special name".tr, context);
            }
            Future.delayed(Duration.zero, () async {
              try {
                BrnLoadingDialog.show(Get.context!,
                    content: '', barrierDismissible: false);
                await Get.find<ClashService>()
                    .addProfile(name, barcodeScanResult);
              } finally {
                setState(() {
                  currentPage = 1;
                });
                BrnLoadingDialog.dismiss(Get.context!);
              }
            });
          });
    } else {
      EasyLoading.showError("请扫描正确的clash订阅");
    }
  }

  bool isURL(String str) {
    // 使用Uri.tryParse()方法来解析字符串
    Uri? uri = Uri.tryParse(str);

    // 判断uri是否为null，以及是否是一个有效的URL
    if (uri != null && uri.hasScheme && uri.hasAuthority) {
      return true;
    } else {
      return false;
    }
  }
}

void _registerWindowsProtocol() {
  // Register our protocol only on Windows platform
  if (!kIsWeb) {
    if (Platform.isWindows) {
      registerProtocolHandler(kWindowsScheme);
      registerProtocolHandler(kWindowsScheme1);
    }
  }
}

const kWindowsScheme = 'clashcross';
const kWindowsScheme1 = 'clash';

// Future<void> initDeepLinks() async {
//   late AppLinks _appLinks;
//   StreamSubscription<Uri>? _linkSubscription;
//   _appLinks = AppLinks();
//
//   // Check initial link if app was in cold state (terminated)
//   final appLink = await _appLinks.getInitialAppLink();
//   if (appLink != null) {
//     print('getInitialAppLink: $appLink');
//     importProfile(appLink);
//   }
//
//   // Handle link when app is in warm state (front or background)
//   _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
//     print('onAppLink: $uri');
//     importProfile(uri);
//   });
// }

importProfile(Uri uri) async {
  if (uri.queryParameters["url"] != null) {
    if (uri.queryParameters["name"]!.isNotEmpty) {
      Future.delayed(Duration.zero, () async {
        try {
          BrnLoadingDialog.show(Get.context!,
              content: '', barrierDismissible: false);
          await Get.find<ClashService>().addProfile(
              uri.queryParameters["name"]!, uri.queryParameters["url"]!);
        } finally {
          BrnLoadingDialog.dismiss(Get.context!);
        }
      });
    } else {
      Get.find<DialogService>().inputDialog(
          title: "What is your config name".tr,
          onText: (name) async {
            if (name == "config") {
              EasyLoading.showError("Cannot use this special name".tr);
              // BrnToast.show("Cannot use this special name".tr, context);
            }
            Future.delayed(Duration.zero, () async {
              try {
                BrnLoadingDialog.show(Get.context!,
                    content: '', barrierDismissible: false);
                await Get.find<ClashService>()
                    .addProfile(name, uri.queryParameters["url"]!);
              } finally {
                BrnLoadingDialog.dismiss(Get.context!);
              }
            });
          });
    }
  } else {
    EasyLoading.showError("请导入有效的clash订阅链接");
    return;
  }
  // if (uri.queryParameters["siteurl"]!.isNotEmpty &&
  //     uri.queryParameters["sitename"]!.isNotEmpty) {
  //   await HttpUtils.get(
  //       path: 'corpus/create',
  //       queryParameters: {
  //         "siteurl": uri.queryParameters["siteurl"],
  //         "sitename": uri.queryParameters["sitename"]!.length > 10
  //             ? uri.queryParameters["sitename"]?.substring(0, 10)
  //             : uri.queryParameters["sitename"]
  //       },
  //       showLoading: false,
  //       showErrorMessage: false);
  // }
}
