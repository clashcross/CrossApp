// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../service/v2board_service.dart';
import '../../../tools/helper.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'forgetpassword.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  var passwordController = TextEditingController();
  var usernameController = TextEditingController();

  final double _sigmaX = 5; // from 0-10
  final double _sigmaY = 5; // from 0-10
  final double _opacity = 0.2;
  final _formKey = GlobalKey<FormState>(debugLabel: 'LoginPage');

  @override
  Widget build(BuildContext context) {
    // usernameController.text = SpUtil.getData('email',defValue: '');
    // passwordController.text = SpUtil.getData('password', defValue: '');
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
              ListView(
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        // decoration: BoxDecoration(
                        //     color: Color.fromRGBO(0, 0, 0, 1)
                        //         .withOpacity(_opacity),
                        //     borderRadius:
                        //         const BorderRadius.all(Radius.circular(30))),
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/images/animation_password.json',
                                  // width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  fit: BoxFit.cover,
                                ),
                                Text("Login".tr,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline6),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                MyTextField(
                                  onChanged: (value) {
                                    // usernameController.text=value;
                                  },
                                  validator: (val) {
                                    if (!isEmailValid(val)) {
                                      return 'Please enter a valid email address';
                                    }
                                  },
                                  controller: usernameController,
                                  hintText: 'Email',
                                  obscureText: false,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                MyPasswordTextField(
                                  onChanged: (value) {
                                    // passwordController.text=value;
                                  },
                                  controller: passwordController,
                                  hintText: 'Password'.tr,
                                  obscureText: true,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return '请填写此字段';
                                    }
                                  },
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                MyButtonAgree(
                                  text: "登录",
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      final vs = Get.find<V2boardService>();
                                      vs.login(usernameController.text,
                                          passwordController.text);
                                    }
                                  },
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(ForgetPassword());
                                      },
                                      child: Text('忘记密码?',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline6,
                                          textAlign: TextAlign.start),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(Signup());
                                      },
                                      child: Text('立即注册',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline6,
                                          textAlign: TextAlign.start),
                                    )
                                  ],
                                )
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
