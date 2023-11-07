import 'dart:convert';

import 'package:digital_voucher_indonesia/model/product.dart';
import 'package:digital_voucher_indonesia/model/user.dart';
import 'package:digital_voucher_indonesia/service/local_storage.dart';

class AppData {
  // SET
  static set statusOnboard(bool value) =>
      LocalStorage.saveToDisk('statusOnboard', value);
  static set token(String value) => LocalStorage.saveToDisk('token', value);

  //static set token(String value) => LocalStorage.saveToDisk('token', value);

  static set namaCabang(String value) =>
      LocalStorage.saveToDisk('namaCabang', value);
  static set kodeCabang(String value) =>
      LocalStorage.saveToDisk('kodeCabang', value);
  static set periode(String value) => LocalStorage.saveToDisk('periode', value);

  static set isLogin(bool value) => LocalStorage.saveToDisk('isLogin', value);

  static set user(List<UserModel>? value) {
    if (value != null) {
      List<String> listString = value.map((e) => e.toJson()).toList();
      LocalStorage.saveToDisk('user', listString);
    } else {
      LocalStorage.saveToDisk('user', null);
    }
  }

  static set products(List<ProductModel>? value) {
    print("data ${value}");
    if (value != null) {
      List<String> listString = value.map((e) => e.toJson()).toList();
      LocalStorage.saveToDisk('products', listString);
    } else {
      LocalStorage.saveToDisk('products', []);
    }
  }

  // GET
  static String get periode {
    if (LocalStorage.getFromDisk('periode') != null) {
      return LocalStorage.getFromDisk('periode');
    }
    return "";
  }

  static List<ProductModel>? get products {
    if (LocalStorage.getFromDisk('products') != null) {
      List<String> listData = LocalStorage.getFromDisk('products');
      return listData.map((e) => ProductModel.fromJson(jsonDecode(e))).toList();
    }
    return [];
  }

  static bool get isLogin {
    if (LocalStorage.getFromDisk('isLogin') != null) {
      return LocalStorage.getFromDisk('isLogin');
    }
    return false;
  }

  static String get token {
    if (LocalStorage.getFromDisk('token') != null) {
      return LocalStorage.getFromDisk('token');
    }
    return "";
  }

  // CLEAR ALL DATA
  static void clearAllData() =>
      LocalStorage.removeFromDisk(null, clearAll: true);

  static List<UserModel>? get user {
    print("info setting ${LocalStorage.getFromDisk('user')}");

    if (LocalStorage.getFromDisk('user') != null) {
      List<String> listData = LocalStorage.getFromDisk('user');
      return listData.map((e) => UserModel.fromJson(jsonDecode(e))).toList();
    }
    return null;
  }
}
