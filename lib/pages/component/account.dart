import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/controller/app.dart';
import 'package:digital_voucher_indonesia/controller/auth.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:digital_voucher_indonesia/pages/widget/text_filed.dart';
import 'package:digital_voucher_indonesia/pages/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Acccount extends StatefulWidget {
  const Acccount({super.key});

  @override
  State<Acccount> createState() => _AcccountState();
}

class _AcccountState extends State<Acccount> {
  var appController = Get.put(AppController());
  var controller = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.usernameLoginCtr.clear();
    controller.passwordLoginCtr.clear();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = 16;
    // double padding = width <= 690
    //     ? 16
    //     : width > 690 && width < 957
    //         ? 82
    //         : 220;
    print("width ${width}");
    print("height ${height}");

    return Container(
      padding: EdgeInsets.only(left: padding, right: padding),
      width: MediaQuery.of(context).size.width / (width >= 560 ? 2 : 1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextApp.label(
                text: "My Account", size: 34.0, weigh: FontWeight.bold),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApp.label(text: "Login", size: 24.0),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldApp.groupColumn(
                                controller: controller.usernameLoginCtr,
                                title: "No HP/email addres",
                                width: MediaQuery.of(context).size.width),
                            TextFieldApp.groupColumnPassword(
                                title: "Password",
                                controller: controller.passwordLoginCtr,
                                width: MediaQuery.of(context).size.width,
                                enabled: true,
                                onTap: () {
                                  controller.isLoginVisible.value =
                                      !controller.isLoginVisible.value;
                                },
                                visble: controller.isLoginVisible.value),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              child: Row(children: [
                                // Row(
                                //   children: [
                                //     Checkbox(
                                //         value: controller.isRememberMe.value,
                                //         onChanged: (value) {
                                //           controller.isRememberMe.value =
                                //               !controller.isRememberMe.value;
                                //         }),
                                //     TextApp.label(text: "Remmbere Me"),
                                //   ],
                                // )
                              ]),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            ButtonApp.btn(
                                onTap: () {
                                  controller.login();
                                },
                                text: "Login",
                                bg: ColorsApp.red,
                                textColor: Colors.white,
                                width: 100),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextApp.label(
                                  text: "Lost Your Password ?",
                                  size: 12.0,
                                  color: ColorsApp.blue),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            InkWell(
                              onTap: () {
                                print("ts");
                                appController.menus.forEach((element) {
                                  element['is_active'] = false;
                                });
                                appController.menus
                                    .where((p0) => p0['name'] == 'Register')
                                    .toList()[0]['is_active'] = true;
                                appController.menus.refresh();
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextApp.label(
                                        text: "Belum punya akun ?",
                                        size: 14.0,
                                        color: ColorsApp.black),
                                    InkWell(
                                      child: TextApp.label(
                                          text: " Register",
                                          size: 14.0,
                                          color: ColorsApp.blue),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 32,
            ),
          ],
        ),
      ),
    );
  }
}
