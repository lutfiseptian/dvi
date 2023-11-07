import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/assets/images.dart';
import 'package:digital_voucher_indonesia/controller/app.dart';
import 'package:digital_voucher_indonesia/controller/auth.dart';
import 'package:digital_voucher_indonesia/controller/product.dart';
import 'package:digital_voucher_indonesia/pages/component/dashboard.dart';
import 'package:digital_voucher_indonesia/pages/component/drawer.dart';
import 'package:digital_voucher_indonesia/pages/widget/button.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:digital_voucher_indonesia/service/app_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileTemplate extends StatefulWidget {
  Widget? page;
  MobileTemplate({super.key, this.page});

  @override
  State<MobileTemplate> createState() => _MobileTemplateState();
}

class _MobileTemplateState extends State<MobileTemplate> {
  var appController = Get.put(AppController());
  var authController = Get.put(AuthController());
  var productsControlller = Get.put(ProductController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.isLogin.value = AppData.isLogin;
    //productsControlller.cartProduct.value = [];
  }


  @override
  void dispose() {
    super.dispose();
    productsControlller.games.clear();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MyDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            //header
            width >= 855
                ? Padding(
              padding: EdgeInsets.only(
                  left: 16, right: 16, top: 26, bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 80,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                appController.setActiveNav();
                                print("ts");

                                appController.menus.forEach((element) {
                                  element['is_active'] = false;
                                });
                                appController.menus[0]['is_active'] =
                                true;
                                appController.menus.refresh();
                              },
                              child: Image.asset(ImagesApp.logo)),
                          Obx(
                                () => Row(
                              children: List.generate(
                                  appController.menus
                                      .where((p0) =>
                                  p0['is_main_menu'] == true)
                                      .toList()
                                      .length, (index) {
                                var data = appController.menus
                                    .where((p0) =>
                                p0['is_main_menu'] == true)
                                    .toList()[index];
                                return InkWell(
                                  onTap: () {
                                    appController.setActiveNav();
                                    appController.menus
                                        .forEach((element) {
                                      element['is_active'] = false;
                                    });
                                    data['is_active'] = true;
                                    appController.menus.refresh();

                                    appController.menus
                                        .forEach((element) {
                                      element['is_active'] = false;
                                    });
                                    data['is_active'] = true;
                                    appController.menus.refresh();
                                  },
                                  child: data['is_active'] == true
                                      ? Padding(
                                    padding:
                                    EdgeInsets.only(left: 16),
                                    child: Container(
                                      child: TextApp.label(
                                          text: data['name'],
                                          size: 16.0,
                                          color: ColorsApp.blue),
                                    ),
                                  )
                                      : Padding(
                                    padding:
                                    EdgeInsets.only(left: 16),
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
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                              () => authController.isLogin.value
                              ? ButtonApp.btn(
                              bg: Colors.red,
                              text: "Logout",
                              onTap: () {
                                authController.logout();
                              })
                              : ButtonApp.btn(
                              text: "Akun",
                              onTap: () {
                                appController.menus
                                    .forEach((element) {
                                  element['is_active'] = false;
                                });
                                appController.menus
                                    .where(
                                        (p0) => p0['name'] == 'Akun')
                                    .toList()[0]['is_active'] = true;
                                appController.menus.refresh();
                              }),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Obx(
                              () => ButtonApp.buttonNotifikasi(
                              textNotif: productsControlller
                                  .cartProduct.value.length
                                  .toString(),
                              onTap: () {
                                _openDrawer();
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
                : Padding(
              padding: EdgeInsets.only(
                  left: 16, right: 16, top: 26, bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 20,
                    child: Container(
                      child: Image.asset(ImagesApp.logo),
                    ),
                  ),
                  Expanded(
                    flex: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                              () => authController.isLogin.value == true
                              ? ButtonApp.btn(
                              bg: Colors.red,
                              text: "Logout",
                              onTap: () {
                                authController.logout();
                              })
                              : ButtonApp.btn(
                              text: "Akun",
                              onTap: () {
                                appController.menus
                                    .forEach((element) {
                                  element['is_active'] = false;
                                });
                                appController.menus
                                    .where(
                                        (p0) => p0['name'] == 'Akun')
                                    .toList()[0]['is_active'] = true;
                                appController.menus.refresh();
                              }),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Obx(
                              () => ButtonApp.buttonNotifikasi(
                              textNotif: productsControlller
                                  .cartProduct.length
                                  .toString(),
                              onTap: () {
                                _openDrawer();
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            widget.page == null
                ? Obx(() => appController.menus
                .where((p0) => p0['is_active'] == true)
                .toList()
                .isNotEmpty
                ? appController.menus
                .where((p0) => p0['is_active'] == true)
                .toList()[0]['page'] as Widget
                : Container())
                : Obx(() => appController.aktifiVBar == false
                ? Container(
              child: widget.page,
            )
                : appController.menus
                .where((p0) => p0['is_active'] == true)
                .toList()
                .isNotEmpty
                ? appController.menus
                .where((p0) => p0['is_active'] == true)
                .toList()[0]['page'] as Widget
                : Container())
          ],
        ),
      ),
      bottomNavigationBar: width >= 855
          ? SizedBox()
          : Material(
        elevation: 10,
        child: Container(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                    appController.menus
                        .where((p0) => p0['is_main_menu'] == true)
                        .toList()
                        .length, (index) {
                  var data = appController.menus
                      .where((p0) => p0['is_main_menu'] == true)
                      .toList()[index];
                  return Container(
                    height: 50,
                    child: InkWell(
                      onTap: () {
                        appController.setActiveNav();

                        appController.menus.forEach((element) {
                          element['is_active'] = false;
                        });
                        data['is_active'] = true;
                        appController.menus.refresh();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            data['icon'] as IconData,
                            color: data['is_active'] == true
                                ? ColorsApp.blue
                                : ColorsApp.Secondary,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            child: TextApp.label(
                              text: data['name'],
                              size: 14.0,
                              color: data['is_active'] == true
                                  ? ColorsApp.blue
                                  : ColorsApp.Secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )),
      ),
    );
  }
}
