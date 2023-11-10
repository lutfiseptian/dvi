import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/assets/images.dart';
import 'package:digital_voucher_indonesia/controller/auth.dart';
import 'package:digital_voucher_indonesia/pages/about.dart';
import 'package:digital_voucher_indonesia/pages/account.dart';
import 'package:digital_voucher_indonesia/pages/widget/button.dart';
import 'package:digital_voucher_indonesia/service/app_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digital_voucher_indonesia/controller/app.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';

import 'dashboard.dart';

class Header extends StatelessWidget {
  final VoidCallback? onTap;

  Header({Key? key, this.onTap}) : super(key: key);

  final controller = Get.put(AppController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final authController = Get.put(AuthController());

  void _openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: InkWell(
              onTap: () {
                print("ts");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );

                controller.menus.forEach((element) {
                  element['is_active'] = false;
                });
                controller.menus[0]['is_active'] = true;
                controller.menus.refresh();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Dashboard()),
                // );
              },
              child: Container(
                child: InkWell(
                    onTap: () {
                      print("ts");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashboard(),
                        ),
                      );

                      controller.menus.forEach((element) {
                        element['is_active'] = false;
                      });
                      controller.menus[0]['is_active'] = true;
                      controller.menus.refresh();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Dashboard()),
                      // );
                    },
                    child: Image.asset(
                      ImagesApp.logo,
                      width: 100.0, // Ganti dengan lebar yang diinginkan
                      height: 100.0, // Ganti dengan tinggi yang diinginkan
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 60,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                        () => Row(
                      children: List.generate(controller.menus.length, (index) {
                        var data = controller.menus[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => data['page'] as Widget,
                              ),
                            );
                            controller.menus.forEach((element) {
                              element['is_active'] = false;
                            });
                            data['is_active'] = true;
                            controller.menus.refresh();
                          },
                          child: data['is_active'] == true
                              ? Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Container(
                              child: TextApp.label(
                                text: data['name'],
                                size: 16.0,
                                color: ColorsApp.blue,
                              ),
                            ),
                          )
                              : Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Container(
                              child: TextApp.label(
                                text: data['name'],
                                size: 16.0,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Obx(() => authController.isLogin.value == false
                      ? ButtonApp.btn(
                    text: "Akun",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountPag(),
                        ),
                      );
                    },
                    width: 100,
                  )
                      : ButtonApp.btn(
                    text: "Logout",
                    onTap: () {},
                    width: 10,
                    bg: ColorsApp.red,
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Align(
              alignment: Alignment.centerRight,
              child: ButtonApp.buttonNotifikasi(
                text: "Akun",
                onTap: onTap,
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
