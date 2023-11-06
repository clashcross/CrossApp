import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sp_util/sp_util.dart';

import '../../bean/payment_method_entity.dart';
import '../../bean/plan_entity.dart';
import '../../service/v2board_service.dart';
import '../../tools/helper.dart';
import '../loginpages/components/my_textfield.dart';

class Plan extends StatefulWidget {
  const Plan({super.key, required this.planEntity});

  final PlanEntity planEntity;

  @override
  State<Plan> createState() => _PlanState();
}

class _PlanState extends State<Plan> {
  String selectedPrice = '';
  PaymentMethodEntity? selectedPaymentMethod;
  var couponController = TextEditingController();
  bool isPriceSelected = false;
  bool isPaymentMethodSelected = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = SpUtil.getBool("is_dark",defValue: false)!;
    final vs = Get.find<V2boardService>();

    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: Text("Purchase Subscription".tr),
        ),
        body: Obx(() => ListView(
              children: [
                Container(
                  // height: kToolbarHeight,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isDarkTheme
                        ? const Color(0xff181227)
                        : const Color(0xffF5F5F6),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Lottie.asset(
                    'assets/images/plan_buy.json',
                    // width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    fit: BoxFit.fitHeight,
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
                  child: ListTile(
                    title: Text(
                      removeHtmlTags(widget.planEntity.content),
                      style: Theme.of(context).primaryTextTheme.titleMedium,
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
                  child: MyTextField(
                    onChanged: (value) {},
                    validator: (val) {
                      // if (!isEmailValid(val)) {
                      //   return 'Please enter a valid email address';
                      // }
                    },
                    controller: couponController,
                    hintText: '输入优惠券结算时会自动抵扣',
                    obscureText: false,
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
                  child: buildPriceOptions(widget.planEntity),
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
                  child: buildPaymentMethodOptions(),
                ),
                Container(
                    // height: kToolbarHeight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isDarkTheme
                          ? const Color(0xff181227)
                          : const Color(0xffF5F5F6),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: isPriceSelected && isPaymentMethodSelected
                          ? () {
                              vs.createOrder(widget.planEntity.id,
                                  selectedPrice, selectedPaymentMethod,
                                  couponCode: couponController.text);
                            }
                          : null,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey; // Disabled color
                            }
                            return Colors.blue; // Enabled color
                          },
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Colors.blue), // Border color
                          ),
                        ),
                      ),
                      child: const Text(
                        "去支付",
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )),
              ],
            )));
  }

  Widget buildPriceOptions(planEntity) {
    final vs = Get.find<V2boardService>();
    // 选取相关字段组成新的Map
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
    // String? selectedPrice = "month_price";

    List<Widget> radioList = selectedFields.keys
        .where((element) => selectedFields[element] != 0)
        .map((key) {
      return RadioListTile(
        activeColor: Colors.orange,
        selected: selectedPrice == key,
        title: Text(key.tr),
        secondary: Text((selectedFields[key] / 100).toStringAsFixed(2) +
            " " +
            vs.userCommConfigEntity.value.currency),
        value: key,
        groupValue: selectedPrice,
        onChanged: (value) {
          setState(() {
            isPriceSelected = true;
            selectedPrice = value!;
          });
        },
      );
    }).toList();

    return Column(
      children: radioList,
    );
  }

  Widget buildPaymentMethodOptions() {
    final vs = Get.find<V2boardService>();
    final paymentMethods = vs.paymentMethods;
    if (paymentMethods.isNotEmpty) {
      return Row(
        children: paymentMethods.map((method) {
          return Expanded(
            child: RadioListTile(
              title: Text(method.name),
              // secondary: Image.network(
              //   method.icon,
              //   width: 30,
              // ),
              value: method,
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                  isPaymentMethodSelected = true;
                });
              },
            ),
          );
        }).toList(),
      );
    }
    return Center(
      child: TextButton(
        onPressed: () {
          vs.getPayMethons();
        },
        child: const Text("重新加载"),
      ),
    );
  }
}
