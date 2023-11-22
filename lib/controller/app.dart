import 'package:digital_voucher_indonesia/controller/product.dart';
import 'package:flutter/material.dart';
import 'package:digital_voucher_indonesia/pages/component/about.dart';
import 'package:digital_voucher_indonesia/pages/component/account.dart';
import 'package:digital_voucher_indonesia/pages/component/dashboard.dart';
import 'package:digital_voucher_indonesia/pages/component/voucher.dart';
import 'package:get/get.dart';
import 'package:digital_voucher_indonesia/pages/about.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:digital_voucher_indonesia/pages/component/register.dart';

import '../pages/ketentuan_umum.dart';

class AppController extends GetxController {
  var aktifiVBar = true.obs;

  var productsController = Get.put(ProductController());

  var menus = [
    {
      "name": "Beranda",
      "is_active": true,
      "page": Dashboard(),
      'icon': Icons.home_outlined,
      'is_main_menu': true
    },
    {
      "name": "Voucher",
      "is_active": false,
      "page": Voucher(),
      'icon': Icons.inbox_outlined,
      'is_main_menu': true
    },
    {
      "name": "Tentang DVI247",
      "is_active": false,
      'page': About(),
      'icon': Icons.info_outline,
      'is_main_menu': true
    },
    {
      "name": "Ketentuan Umum",
      "is_active": false,
      'page': UmumPage(),
      'icon': Icons.info_outline,
      'is_main_menu': true
    },
    {
      "name": "Akun",
      "is_active": false,
      'page': Acccount(),
      'icon': Icons.inbox,
      'is_main_menu': false
    },
    {
      "name": "Register",
      "is_active": false,
      'page': Register(),
      'icon': Icons.inbox,
      'is_main_menu': false
    },
  ].obs;

  void setActiveNav() {
    aktifiVBar.value = true;
    productsController.games.clear();
    productsController.pulsa.clear();
  }

  void setInActiveNav() {
    aktifiVBar.value = false;
  }
}

