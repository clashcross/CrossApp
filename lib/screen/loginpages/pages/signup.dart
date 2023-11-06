import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../service/v2board_service.dart';
import '../../../tools/helper.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailVerifyController = TextEditingController();

  final double _sigmaX = 5; // from 0-10
  final double _sigmaY = 5; // from 0-10
  final _formKey = GlobalKey<FormState>(debugLabel: 'Signup');
  bool hasEmail = false;

  // sign user in method
  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final vs = Get.find<V2boardService>();
    final guestCommConfig = vs.guestCommConfig;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.close),
        ),
      ),
      // backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Lottie.asset(
              //   'assets/images/backgroudimage.json',
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height,
              //   fit: BoxFit.cover,
              // ),
              ListView(
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        // decoration: BoxDecoration(
                        //     color: const Color.fromRGBO(0, 0, 0, 1)
                        //         .withOpacity(_opacity),
                        //     borderRadius: const BorderRadius.all(
                        //       Radius.circular(5),
                        //     )),
                        // width: MediaQuery.of(context).size.width * 0.9,
                        // height: MediaQuery.of(context).size.height * 0.49,
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/images/animation_password.json',
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "SignUp".tr,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline6,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Text(guestCommConfig.value.appDescription,
                                    // ignore: prefer_const_constructors
                                    textAlign: TextAlign.start),
                                MyTextField(
                                  onChanged: (value) {},
                                  controller: usernameController,
                                  hintText: 'Email',
                                  obscureText: false,
                                  validator: (val) {
                                    if (!isEmailValid(val)) {
                                      return '请输入有效的Email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                guestCommConfig.value.isEmailVerify == 1
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: MyTextField(
                                              onChanged: (value) {},
                                              controller: emailVerifyController,
                                              hintText: '邮箱验证码',
                                              obscureText: false,
                                              validator: (val) {
                                                if (val.toString().isEmpty) {
                                                  return '请输入邮箱验证码';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                vs.sendEmaiVerify(
                                                    usernameController.text);
                                              },
                                              child:  Text("Send".tr))
                                        ],
                                      )
                                    : Container(),
                                const SizedBox(height: 10),
                                MyPasswordTextField(
                                  onChanged: (value) {},
                                  controller: passwordController,
                                  hintText: 'The password length must be no less than 8.'.tr,
                                  obscureText: true,
                                  validator: (val) {
                                    if (val.toString().length < 8) {
                                      return "The password length must be no less than 8.".tr;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                MyButtonAgree(
                                  text: "SignUp".tr,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      vs.sigUp(usernameController.text,
                                          passwordController.text,emailCode: emailVerifyController.text);
                                    }
                                  },
                                ),
                                // const SizedBox(height: 30),
                                // Column(
                                //   mainAxisSize: MainAxisSize.min,
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment:
                                //       CrossAxisAlignment.stretch,
                                //   children: [
                                //     RichText(
                                //       text: TextSpan(
                                //         text: '',
                                //         children: <TextSpan>[
                                //           TextSpan(
                                //               text: '注册即表示您同意我们的 ',
                                //               style: Theme.of(context)
                                //                   .primaryTextTheme
                                //                   .headline6),
                                //           TextSpan(
                                //               text: '《服务条款》和《隐私政策》',
                                //               style: Theme.of(context)
                                //                   .primaryTextTheme
                                //                   .headline6),
                                //         ],
                                //       ),
                                //     ),
                                //     const SizedBox(height: 10),
                                //     MyButtonAgree(
                                //       text: "继续注册",
                                //       onTap: () {
                                //         if (_formKey.currentState!.validate()) {
                                //           vs.sigUp(usernameController.text,
                                //               passwordController.text,emailCode: emailVerifyController.text);
                                //         }
                                //       },
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
