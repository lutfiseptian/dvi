import 'dart:convert';

import 'package:digital_voucher_indonesia/assets/alert.dart';
import 'package:digital_voucher_indonesia/controller/app.dart';
import 'package:digital_voucher_indonesia/model/user.dart';
import 'package:digital_voucher_indonesia/pages/template/mobile.dart';
import 'package:digital_voucher_indonesia/service/api_request.dart';
import 'package:digital_voucher_indonesia/service/app_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController {
  var appController = Get.put(AppController());
  var isLogin = false.obs;
  var token = "".obs;
  var usernameLoginCtr = TextEditingController();
  var enailLoginCtr = TextEditingController();
  var passwordLoginCtr = Get.put(TextEditingController());

  var usernameRegisterCtr = TextEditingController();
  var enailRegisterCtr = TextEditingController();
  var passwordRegisterCtr = Get.put(TextEditingController());
  var isRememberMe = true.obs;
  var isLoginVisible = true.obs;
  var isRegisterVisible = true.obs;

  @override
  void onInit() {
    isLogin.value = AppData.isLogin;
  }

  Future<void> register() async {
    if (usernameRegisterCtr.text == "") {
      AlertApp.showToast("Username belum diisi");
      return;
    }
    if (enailRegisterCtr.text == "") {
      AlertApp.showToast("Email belum diisi");
    }
    if (passwordRegisterCtr.text == "") {
      AlertApp.showToast("Password belum diisi");
      return;
    }
    var body = {
      "username": usernameRegisterCtr.text.toString(),
      "password": passwordRegisterCtr.text.toString(),
      "email": enailRegisterCtr.text.toString()
    };
    print(body);
    AlertApp.showLoadingIndicator(Get.context!, "Proses registrasi");
    try {
      var response = await ApiRequest(url: '/signup', body: body).post();
      var resp = jsonDecode(response.body);
      if (response.statusCode == 200) {
        AppData.isLogin = true;
        isLogin.value = true;
        List<UserModel> user = [];
        enailRegisterCtr.clear();
        passwordRegisterCtr.clear();
        usernameRegisterCtr.clear();
        AppData.token = resp['data']['token'];

        user.add(UserModel(
            username: resp['data']['username'],
            email: resp['data']['email'],
            token: resp['data']['token']));

        AppData.user = user;

        defaultRoute();
        return;
      }
      Get.back();
      AlertApp.showToast(resp['meta']['message']);
    } catch (e) {
      AlertApp.showToast(e.toString());
    }
  }

  Future<void> login() async {
    try {
      AlertApp.showLoadingIndicator(Get.context!, "Proses Login...");
      var body = {
        "username": usernameLoginCtr.text.toString(),
        "password": passwordLoginCtr.text.toString()
      };
      print("body ${body}");
      var response = await ApiRequest(url: '/signin', body: body).post();
      var resp = jsonDecode(response.body);
      print(resp);
      if (response.statusCode == 200) {
        List<UserModel> user = [];
        AppData.isLogin = true;
        isLogin.value = true;
        // usernameLoginCtr.clear();
        // passwordLoginCtr.clear();

        AppData.token = resp['data']['token'].toString();
        token.value = resp['data']['token'];
        print("token ${resp['data']['token']}");

        user.add(UserModel(
            username: resp['data']['username'],
            email: resp['data']['email'],
            token: resp['data']['token']));

        AppData.user = user;
        Get.back();
        defaultRoute();

        AlertApp.showToast(resp['meta']['message']);
        return;
      }
      Get.back();
      AlertApp.showToast(resp['meta']['message']);
      return;
    } catch (e) {
      Get.back();
      AlertApp.showToast(e.toString());
    }
  }

  void logout() {
    AppData.clearAllData();
    isLogin.value = false;
    appController.menus.forEach((element) {
      element['is_active'] = false;
    });
    appController.menus.where((p0) => p0['name'] == 'Akun').toList()[0]
        ['is_active'] = true;
    appController.menus.refresh();
    Navigator.of(Get.context!).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => MobileTemplate(
                  page: null,
                )),
        (Route route) => false);
  }

  void defaultRoute() {
    appController.menus.forEach((element) {
      element['is_active'] = false;
    });
    appController.menus.where((p0) => p0['name'] == 'Beranda').toList()[0]
        ['is_active'] = true;
    appController.menus.refresh();
    Navigator.of(Get.context!).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => MobileTemplate(
                  page: null,
                )),
        (Route route) => false);
  }
}

