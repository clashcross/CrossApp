import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../bean/auth_login_entity.dart';
import '../bean/coupon_entity.dart';
import '../bean/guest_comm_config_entity.dart';
import '../bean/invite_fetch_entity_entity.dart';
import '../bean/notice_entity.dart';
import '../bean/order_detail_entity.dart';
import '../bean/payment_method_entity.dart';
import '../bean/plan_entity.dart';
import '../bean/server_entity.dart';
import '../bean/sub_scribe_entity.dart';
import '../bean/user_comm_config_entity.dart';
import '../bean/user_info_entity.dart';
import '../http/http_request.dart';
import '../http/options.dart';
import '../http/request.dart';
import '../main.dart';
import '../screen/loginpages/pages/login.dart';
import '../tools/customlaunch.dart';
import 'clash_service.dart';

class V2boardService extends GetxService {
  final isLogin = false.obs;
  final email = ''.obs;
  final password = ''.obs;
  final guestCommConfig = GuestCommConfigEntity().obs;
  final userCommConfigEntity = UserCommConfigEntity().obs;
  final notices = [].obs;
  final plansList = [].obs;
  PlanEntity? plan;
  SubScribeEntity? subScribe;
  final paymentMethods = [].obs;
  List<OrderDetailEntity>? orders;
  final servers = [].obs;
  final userInfo = UserInfoEntity().obs;
  Rx<InviteFetchEntityEntity?> inviteFetchEntityEntity = Rx(null);

  // final isOutdata = true.obs; //是否超流量
  // final isExpired = true.obs; //是否过期
  final isActive = false.obs; //是否有效
  final showBackButton = true.obs; //是否显示appBar返回按钮

  Future<V2boardService> init() async {
    email.value = SpUtil.getString('email', defValue: '')!;
    password.value = SpUtil.getString('password', defValue: '')!;
    getGuestCommConfig();
    checkLogin();
    return this;
  }

  reload() async {
    getUserInfo();
    getSubscribe();
    getPlansList();
    getUserCommConfig();
    getNotices();
    getPayMethons();
    getOrdersDetails();
    getServersStatus();
    inviteFetch();
  }

  getGuestCommConfig() async {
    // https://www.1jichang.xyz/api/v1/guest/comm/config
    var res = await HttpUtils.get(path: '/guest/comm/config');

    if (res != null) {
      guestCommConfig.value = GuestCommConfigEntity.fromJson(res);
    }
  }

  getUserCommConfig() async {
    var res = await HttpUtils.get(path: 'user/comm/config');
    if (res != null) {
      userCommConfigEntity.value = UserCommConfigEntity.fromJson(res);
    }
  }

  getNotices() async {

    var res = await HttpUtils.get(path: "user/notice/fetch");

    if (res != null) {
      List<NoticeEntity> tmpList = [];
      res.forEach((element) {
        tmpList.add(NoticeEntity.fromJson(element));
      });
      notices.value = tmpList;
    }
  }

  getUserInfo() async {
    // https://www.1jichang.xyz/api/v1/user/info
    var res = await HttpUtils.get(path: 'user/info', showLoading: false);
    if (res != null) {
      userInfo.value = UserInfoEntity.fromJson(res);
      // if ((userInfo.value.expiredAt) * 1000 >
      //     DateTime.now().millisecondsSinceEpoch) {
      //   isExpired.value = false;
      // }
    }
  }

  inviteFetch() async {
    // https://www.1jichang.xyz/api/v1/user/invite/fetch

    var res = await HttpUtils.get(path: 'user/invite/fetch');
    if (res != null) {
      inviteFetchEntityEntity.value = InviteFetchEntityEntity.fromJson(res);
    }
  }

  createNewCode() async {
    // https://www.1jichang.xyz/api/v1/user/invite/save
    var res = await HttpUtils.get(path: "user/invite/save")
        .then((value) => inviteFetch());
  }

  setLoginCertificate(email, password) {
    this.email.value = email;
    this.password.value = password;
    SpUtil.putString('email', email);
    SpUtil.putString('password', password);
  }

  checkLogin() async {
    var res = await HttpUtils.get(
        path: 'user/checkLogin', showLoading: false, showErrorMessage: true);
    if (res != null) {
      isLogin.value = true;
      reload();
    }
  }

  login(email, password) async {
    //https://www.1jichang.xyz/api/v1/passport/auth/login
    var res = await HttpUtils.post(
        path: 'passport/auth/login',
        method: HttpMethod.post,
        data: {
          "email": email,
          "password": password,
        });
    if (res != null) {
      isLogin.value = true;
      SpUtil.putString('Authorization', AuthLoginEntity.fromJson(res).authData);
      setLoginCertificate(email, password);
      reload();
      // Get.back();
      Get.to(const MyHomePage());
      showBackButton.value = false; //登录完到主界面不显示返回按钮
    }
  }

  setShowBackButton(value) {
    showBackButton.value = value;
  }

  sendEmaiVerify(email) async {
    await HttpUtils.post(
            path: "passport/comm/sendEmailVerify",
            method: HttpMethod.post,
            data: {"email": email})
        .then((value) => () =>
            EasyLoading.show(status: "发送成功,请检查您的邮箱获取验证码", dismissOnTap: true));
    // EasyLoading.dismiss();
  }

  sigUp(email, password, {emailCode, inviteCode}) async {
    // https://www.1jichang.xyz/api/v1/passport/auth/register
    var res = await HttpUtils.post(
        path: 'passport/auth/register',
        method: HttpMethod.post,
        data: {
          "email": email,
          "password": password,
          "invite_code": inviteCode,
          "email_code": emailCode
        });
    if (res != null) {
      isLogin.value = true;
      SpUtil.putString('Authorization', AuthLoginEntity.fromJson(res).authData);
      setLoginCertificate(email, password);
      reload();
      // Get.back();
      Get.to(const MyHomePage());
      showBackButton.value = false; //登录完到主界面不显示返回按钮
    }
  }

  forgetPassword(email, password, emailCode) async {
    var res = await HttpUtils.post(
        path: 'passport/auth/forget',
        method: HttpMethod.post,
        data: {"email": email, "password": password, "email_code": emailCode});
    if (res != null) {
      isLogin.value = true;
      if (res == true) {
        EasyLoading.show(status: "重置成功,请使用新密码登录", dismissOnTap: true);
        Get.to(const LoginPage());
      }
    }
  }

  setIslogin(v) {
    isLogin.value = v;
  }

  getSubscribe() async {
    //需要判断是否有订阅，订阅是否过期
    var res = await HttpUtils.get(
        path: 'user/getSubscribe', showLoading: false, showErrorMessage: false);
    if (res != null) {
      subScribe = SubScribeEntity.fromJson(res);

      if (subScribe?.expiredAt == 0) {
        if (subScribe!.u + subScribe!.d < subScribe!.transferEnable) {
          isActive.value = true;
        } else {
          isActive.value = false;
          return;
        }
      } else {
        if (subScribe!.expiredAt * 1000 >
                DateTime.now().millisecondsSinceEpoch &&
            subScribe!.u + subScribe!.d < subScribe!.transferEnable) {
          isActive.value = true;
        } else {
          isActive.value = false;
          return;
        }
      }
      await Get.find<ClashService>()
          .addProfile(HttpOptions.appName, subScribe!.subscribeUrl);
    }
  }

  getPlansList() async {
    List res = await HttpUtils.get(
      path: 'user/plan/fetch',
    );

    if (res.isNotEmpty) {
      List<PlanEntity> tmpList = [];
      for (var element in res) {
        tmpList.add(PlanEntity.fromJson(element));
      }
      plansList.value = tmpList;
    }
  }

  getPlan(id) async {
    var res = await HttpUtils.get(
        path: 'user/plan/fetch', queryParameters: {"id": id});

    if (res.isNotEmpty) {
      plan = PlanEntity.fromJson(res);
    }
  }

  checkCoupon(code, planId) async {
    // https://www.1jichang.xyz/api/v1/user/coupon/check
    var res = await HttpUtils.post(
        path: "user/coupon/check",
        method: HttpMethod.post,
        data: {"code": code, "plan_id": planId});

    if (res != null) {
      return CouponEntity.fromJson(res);
    }
  }

  createOrder(planId, period, paymethod, {couponCode}) async {
    await getOrdersDetails();
    // https://www.1jichang.xyz/api/v1/user/order/save
    //v2board策略：有未支付订单，不允许提交新订单，这里直接取消再创建
    List<OrderDetailEntity>? noPayOrders =
        orders?.where((element) => element.status == 0).toList();
    if (noPayOrders!.isNotEmpty) {
      noPayOrders.forEach((element) async {
        await HttpUtils.post(
            path: "user/order/cancel",
            method: HttpMethod.post,
            data: {
              "trade_no": element.tradeNo,
            });
      });
    }
    await HttpUtils.post(
        path: "user/order/save",
        method: HttpMethod.post,
        data: {
          "period": period,
          "plan_id": planId,
          "coupon_code": couponCode
        }).then((value) {
      if (value != null) {
        checkoutOrder(value, paymethod);
      }
    });
  }

  getPayMethons() async {
    // https://www.1jichang.xyz/api/v1/user/order/getPaymentMethod
    var res = await HttpUtils.get(path: "user/order/getPaymentMethod");
    if (res != null) {
      List<PaymentMethodEntity> tempList = [];
      for (var element in res) {
        tempList.add(PaymentMethodEntity.fromJson(element));
      }
      paymentMethods.value = tempList;
    }
  }

  detailOrder(tradeNo) async {
    // https://www.1jichang.xyz/api/v1/user/order/detail?trade_no=2023080815085724004837072
    await HttpUtils.get(
        path: "user/order/detail", queryParameters: {"trade_no": tradeNo});
  }

  checkoutOrder(tradeNo, PaymentMethodEntity paymentMethodEntity) async {
    var res = await HttpUtils.post(
        path: 'user/order/checkout',
        method: HttpMethod.post,
        data: {"trade_no": tradeNo, "method": paymentMethodEntity.id});
    if (res != null) {
      if (res == true) {
        EasyLoading.showSuccess("已开通,请返回应用主界面查看");
        return;
      }
      customLaunch(Uri.parse(res));
      // }
    }
  }

  cancelOrder(tradeNo) async {
    await HttpUtils.post(path: "user/order/cancel", method: HttpMethod.post);
  }

  getOrdersDetails() async {
    var res = await HttpUtils.get(
      path: "user/order/fetch",
    );
    if (res != null) {
      List<OrderDetailEntity> tempList = [];
      for (var element in res) {
        tempList.add(OrderDetailEntity.fromJson(element));
      }
      orders = tempList;
    }
  }

  getServersStatus() async {
    List res = await HttpUtils.get(path: "user/server/fetch");
    if (res.isNotEmpty) {
      List<ServerEntity> tmpList = [];
      for (var element in res) {
        tmpList.add(ServerEntity.fromJson(element));
      }
      servers.value = tmpList;
    }
  }

  quickUrl(redirect) async {
    var res = await HttpUtils.post(
        path: "passport/auth/getQuickLoginUrl",
        method: HttpMethod.post,
        data: {"redirect": redirect});
    if (res != null) {
      return res;
    }
  }
}
