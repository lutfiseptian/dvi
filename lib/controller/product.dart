import 'dart:async';
import 'dart:convert';

import 'package:digital_voucher_indonesia/assets/alert.dart';
import 'package:digital_voucher_indonesia/pages/component/place_order.dart';
import 'package:digital_voucher_indonesia/pages/template/mobile.dart';
import 'package:digital_voucher_indonesia/service/api_request.dart';
import 'package:digital_voucher_indonesia/service/app_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digital_voucher_indonesia/model/product.dart';
import 'package:digital_voucher_indonesia/model/va.dart';
import 'package:digital_voucher_indonesia/model/transaction.dart';

import '../pages/component/qris_order.dart';

class ProductController extends GetxController {
  var productsPopuler = <ProductModel>[].obs;
  var bestVouccher = <ProductModel>[].obs;
  var games = <ProductModel>[].obs;
  var pulsa = <ProductModel>[].obs;
  var details = <ProductModel>[].obs;
  var bank = <VaModel>[].obs;
  var transaction = TransactionModel().obs;
  var notes = [].obs;
  var qr = ''.obs;

  var isLoadingProductPopuler = true.obs;
  var isLoadingBestVoucher = true.obs;
  var isLoadingPulsa = true.obs;
  var isLoadingGames = true.obs;
  var isLoadingBank = true.obs;
  var isLoadingDetail = false.obs;
  var isLoadingTransaction = true.obs;
  var qty = 1.obs;
  var cartProduct = <ProductModel>[].obs;

  var isActveSdescription = true.obs;
  var destUp = TextEditingController();

  Future<void> refreshData() async {
    // await fetchProductPopuler();
    await fetchBestVoucher();
    await fetchPulsa();
    await fetchGames();
    await fetchVaAccounnt();
  }

  Future<void> fetchProductPopuler() async {
    try {
      isLoadingProductPopuler.value = true;
      var response = await ApiRequest(url: '/product/popular').get();
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        productsPopuler.value = ProductModel.fromJsonToList(res['data']);
        // AlertApp.showToast(res['meta']['message']);
        isLoadingProductPopuler.value = false;
        return;
      }
      // AlertApp.showToast(res['meta']['message']);
      isLoadingProductPopuler.value = false;
    } catch (e) {
      isLoadingProductPopuler.value = false;
      AlertApp.showToast(e.toString());
    }
  }

  Future<void> fetchBestVoucher() async {
    try {
      isLoadingBestVoucher.value = true;
      var response = await ApiRequest(url: '/product/best/voucher').get();
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        bestVouccher.value = ProductModel.fromJsonToList(res['data']);
        isLoadingBestVoucher.value = false;
        return;
      }
      // AlertApp.showToast(res['meta']['message']);
      isLoadingBestVoucher.value = false;
    } catch (e) {
      isLoadingBestVoucher.value = false;
      AlertApp.showToast(e.toString());
    }
  }

  Future<void> fetchPulsa() async {
    try {
      isLoadingPulsa.value = true;
      var response = await ApiRequest(url: '/product/list/pulsa').get();
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        pulsa.value = ProductModel.fromJsonToList(res['data']);
        isLoadingPulsa.value = false;
        return;
      }
      // AlertApp.showToast(res['meta']['message']);
      isLoadingPulsa.value = true;
    } catch (e) {
      isLoadingPulsa.value = false;
      AlertApp.showToast(e.toString());
    }
  }

  Future<void> fetchGames() async {
    try {
      isLoadingGames.value = true;
      var response = await ApiRequest(url: '/product/list/games').get();
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        games.value = ProductModel.fromJsonToList(res['data']);
        isLoadingGames.value = false;
        print("Games: ${games.first}");
        return;
      }
      games.value = [];
      // AlertApp.showToast(res['meta']['message']);
      isLoadingGames.value = false;
    } catch (e) {
      games.value = [];
      isLoadingPulsa.value = false;
      AlertApp.showToast(e.toString());
    }
  }

  Future<void> fetchVaAccounnt() async {
    try {
      isLoadingBank.value = true;
      var response = await ApiRequest(url: '/bank/va').get();
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        bank.value = VaModel.fromJsonToList(res['data']);

        isLoadingBank.value = false;
        return;
      }
      AlertApp.showToast(res['meta']['message']);
      isLoadingBank.value = false;
    } catch (e) {
      isLoadingBank.value = false;
      // AlertApp.showToast(e.toString());
    }
  }

  Future<void> SimpleTransaction() async {
    try {
      var list = [];

      List b = bank.where((p0) => p0.isChecked == true).toList();
      if (b.isEmpty) {
        AlertApp.showToast("Pilih Virtual account terlebih dahulu");
      }
      var amount = cartProduct
          .fold<int>(
          0,
              (previousValue, element) =>
          int.parse(previousValue.toString()) +
              int.parse((int.parse(element.qty.toString()) *
                  int.parse(element.price.toString()))
                  .toString()))
          .toString();

      cartProduct.forEach((element) {
        var d = {"code": element.code, "dest_topup": element.destTopup};
        list.add(d);
      });
      var body = {
        "bank": bank.where((p0) => p0.isChecked == true).toList()[0].bankCode,
        "amount": amount.toString(),
        "order": list,
        'token': AppData.token
      };
      print("panjang ${cartProduct.length}");
      print("datta list ${list.toString()}");
      AlertApp.showLoadingIndicator(Get.context!, "Proses transaksi...");
      var response =
      await ApiRequest(url: '/transactions', body: body).postTransaksi();
      var res = jsonDecode(response.body);
      print(res);
      if (response.statusCode == 200) {
        cartProduct.clear();
        AppData.products = [];
        Get.back();
        transaction.value = TransactionModel.fromJson(res['data']);
        notes.value = transaction.value.notes.toString().split('|');
        Get.back();
        Get.back();
        Navigator.push(
          Get.context!,
          MaterialPageRoute(
              builder: (context) => MobileTemplate(
                page: PllaceOrder(),
              )),
        );

        return;
      }
      Get.back();
      AlertApp.showToast(res['meta']['message']);
    } catch (e) {
      AlertApp.showToast(e.toString());
    }
  }

  Future<void> QrisTransaction() async {
    try {
      var list = [];
      var amount = cartProduct
          .fold<int>(
          0,
              (previousValue, element) =>
          int.parse(previousValue.toString()) +
              int.parse((int.parse(element.qty.toString()) *
                  int.parse(element.price.toString()))
                  .toString()))
          .toString();

      cartProduct.forEach((element) {
        var d = {"code": element.code, "dest_topup": element.destTopup};
        list.add(d);
      });
      var body = {
        "bank": 'qris',
        "amount": amount.toString(),
        'token': AppData.token,
        "order": list,
      };
      print("panjang ${cartProduct.length}");
      print("datta list ${list.toString()}");
      AlertApp.showLoadingIndicator(Get.context!, "Proses transaksi...");
      var response =
      await ApiRequest(url: '/transactions/qris', body: body).postTransaksi();
      var res = jsonDecode(response.body);
      print(res);
      if (response.statusCode == 200) {
        cartProduct.clear();
        AppData.products = [];
        Get.back();
        transaction.value = TransactionModel.fromJson(res['data']);
        qr.value = transaction.value.notes.toString() as String;
        print("Data Qr $qr");
        Get.back();
        Get.back();
        Navigator.push(
          Get.context!,
          MaterialPageRoute(
              builder: (context) => MobileTemplate(
                page: QrisPage(),
              )),
        );

        return;
      }
      Get.back();
      AlertApp.showToast(res['meta']['message']);
    } catch (e) {
      AlertApp.showToast(e.toString());
    }
  }


  Future<void> fetchDetail({productCode, type}) async {
    try {
      var url;
      if (type == "pulsa") {
        url = "/product/list/pulsa/detail?product_code=${productCode}";
      } else {
        url = "/product/list/games/detail?product_code=${productCode}";
      }
      isLoadingDetail.value = true; // Set loading to true.
      var response = await ApiRequest(url: url).get();
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        details.value = ProductModel.fromJsonToList(res['data']);
      }
      // Remove isLoadingDetails here since you want to keep loading while processing the response.
    } catch (e) {
      AlertApp.showToast(e.toString());
    } finally {
      isLoadingDetail.value = false; // Set loading to false after processing.
    }
  }



  void setProduct() {
    //AppData.products = [];
    // cartProduct.clear();
    // cartProduct.addAll(AppData.products!);
    Timer(Duration(seconds: 3), () {
      cartProduct.clear();
      cartProduct.addAll(AppData.products!);
    });
  }
}