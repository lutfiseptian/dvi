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

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var appController = Get.put(AppController());
  var controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = 16;
    return Expanded(
      child: Container(
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 16, right: 16),
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
                      TextApp.label(text: "Register", size: 24.0),
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
                                  controller: controller.usernameRegisterCtr,
                                  title: "No HP",
                                  width: MediaQuery.of(context).size.width),
                              TextFieldApp.groupColumn(
                                  title: "Email addres",
                                  controller: controller.enailRegisterCtr,
                                  width: MediaQuery.of(context).size.width),
                              TextFieldApp.groupColumnPassword(
                                  title: "Password",
                                  controller: controller.passwordRegisterCtr,
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
                              TextApp.label(
                                  text:
                                      "Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our privacy policy.",
                                  weigh: FontWeight.w400,
                                  color: ColorsApp.Secondary),
                              SizedBox(
                                height: 16,
                              ),
                              ButtonApp.btn(
                                  onTap: () {
                                    controller.register();
                                  },
                                  text: "Register",
                                  bg: ColorsApp.red,
                                  textColor: Colors.white,
                                  width: 100),
                              SizedBox(
                                height: 16,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextApp.label(
                                        text: "Sudah punya akun ?",
                                        size: 14.0,
                                        color: ColorsApp.black),
                                    InkWell(
                                      onTap: () {
                                        appController.menus.forEach((element) {
                                          element['is_active'] = false;
                                        });
                                        appController.menus
                                            .where((p0) => p0['name'] == 'Akun')
                                            .toList()[0]['is_active'] = true;
                                        appController.menus.refresh();
                                      },
                                      child: TextApp.label(
                                          text: " Login",
                                          size: 14.0,
                                          color: ColorsApp.blue),
                                    ),
                                  ],
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
      ),
    );
  }
}
