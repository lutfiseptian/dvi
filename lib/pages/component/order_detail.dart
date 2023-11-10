import 'package:digital_voucher_indonesia/assets/alert.dart';
import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/controller/app.dart';
import 'package:digital_voucher_indonesia/controller/order.dart';
import 'package:digital_voucher_indonesia/controller/product.dart';
import 'package:digital_voucher_indonesia/pages/widget/button.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:digital_voucher_indonesia/service/app_data.dart';
import 'package:digital_voucher_indonesia/service/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  var controller = Get.put(OrderController());
  var productController = Get.put(ProductController());
  var appController = Get.put(AppController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.fetchVaAccounnt();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print("width ${width}");
    print("height ${height}");
    return WillPopScope(
      onWillPop: () async {
        // Kembalikan false untuk mencegah navigasi kembali
        return Future.value(false);
      },
      child: Expanded(
        child: Container(
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: ColorsApp.blue,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextApp.label(
                          text:
                              "Yuuuk ..... Top Up melalui Digital Voucher Indonesia !",
                          weigh: FontWeight.w300,
                          size: 16.0,
                          color: Colors.white),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                  color: ColorsApp.red,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  width: MediaQuery.of(context).size.width /
                      (width >= 560 ? 2 : 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width /
                            (width >= 560 ? 2 : 1),
                        decoration: BoxDecoration(
                            color: ColorsApp.red,
                            borderRadius: BorderRadius.circular(4)),
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 4, right: 4),
                        child: TextApp.label(
                            text: "Your Order",
                            color: Colors.white,
                            size: 16.0),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                  flex: 60,
                                  child: TextApp.label(
                                      text: "Products",
                                      size: 14.0,
                                      weigh: FontWeight.bold)),
                              Expanded(
                                  flex: 40,
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextApp.label(
                                          text: "Subtotal",
                                          size: 14.0,
                                          weigh: FontWeight.bold)))
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(
                            productController.cartProduct.length, (index) {
                          var data = productController.cartProduct[index];
                          return Column(
                            children: [
                              Divider(),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 60,
                                      child: TextApp.label(
                                          text:
                                              "${data.name} - ${data.qty} X ${Helper.rupiahFormat(data.price.toString())}",
                                          size: 14.0,
                                          weigh: FontWeight.w300,
                                          color: ColorsApp.Secondary)),
                                  Expanded(
                                      flex: 40,
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: TextApp.label(
                                              text: Helper.rupiahFormat(
                                                  (int.parse(data.qty
                                                              .toString()) *
                                                          int.parse(data.price
                                                              .toString()))
                                                      .toString()),
                                              size: 14.0,
                                              weigh: FontWeight.w300,
                                              color: ColorsApp.Secondary)))
                                ],
                              ),
                            ],
                          );
                        }),
                      ),
                      Column(
                        children: [
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                  flex: 60,
                                  child: TextApp.label(
                                      text: "Total",
                                      size: 14.0,
                                      weigh: FontWeight.bold)),
                              Expanded(
                                  flex: 40,
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextApp.label(
                                          text:
                                              " ${Helper.rupiahFormat(productController.cartProduct.fold<int>(0, (previousValue, element) => int.parse(previousValue.toString()) + int.parse((int.parse(element.qty.toString()) * int.parse(element.price.toString())).toString())).toString())}",
                                          size: 14.0,
                                          weigh: FontWeight.bold)))
                            ],
                          ),
                          Divider(),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: <Widget>[
                          ButtonApp.btnqris(
                            text: "Ketuk Untuk Pembayaran QRIS",
                            onTap: () {
                              if (AppData.token == "") {
                                print(AppData.token.toString());
                                appController.setActiveNav();
                                appController.menus.forEach((element) {
                                  element['is_active'] = false;
                                });
                                appController.menus
                                    .where((p0) => p0['name'] == 'Akun')
                                    .toList()[0]['is_active'] = true;
                                appController.menus.refresh();
                                AlertApp.showToast(
                                    "Silahkan Login Terlebih dahulu untuk mmelakukan trasaksi");
                              } else {
                                productController.QrisTransaction();
                              }
                            },
                            // : Image.asset('assets/your_image.png'), // Ganti dengan path gambar Anda
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextApp.label(
                          text: "Virtual Account",
                          size: 16.0,
                          weigh: FontWeight.bold),
                      SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => productController.isLoadingBank.value == true
                            ? SizedBox()
                            : Column(
                                children: List.generate(
                                    productController.bank.length, (index) {
                                  var data = productController.bank[index];
                                  //  var data = controller.virtualAccounts[index];
                                  return InkWell(
                                    onTap: () {
                                      productController.bank.forEach((element) {
                                        element.isChecked = false;
                                      });
                                      data.isChecked = true;
                                      productController.bank.refresh();
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 5,
                                              child: Column(
                                                children: [
                                                  data.isChecked == true
                                                      ? Container(
                                                          width: 10,
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 1,
                                                                color: ColorsApp
                                                                    .Secondary),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1),
                                                            child: Container(
                                                              width: 10,
                                                              height: 10,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: ColorsApp
                                                                    .baseColor,
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color: ColorsApp
                                                                        .Secondary),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child:
                                                                  Container(),
                                                            ),
                                                          ),
                                                        )
                                                      : Container(
                                                          width: 10,
                                                          height: 10,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 1,
                                                                color: ColorsApp
                                                                    .Secondary),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                ],
                                              )),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                              flex: 80,
                                              child: Row(
                                                children: [
                                                  Image.network(
                                                    data.images,
                                                    // Replace with your image URL
                                                    fit: BoxFit.fill,
                                                    loadingBuilder: (BuildContext
                                                            context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return child;
                                                      }
                                                      return CircularProgressIndicator(
                                                        value: loadingProgress
                                                                    .expectedTotalBytes !=
                                                                null
                                                            ? loadingProgress
                                                                    .cumulativeBytesLoaded /
                                                                loadingProgress
                                                                    .expectedTotalBytes!
                                                            : null,
                                                      );
                                                    },
                                                    errorBuilder:
                                                        (BuildContext context,
                                                            Object error,
                                                            StackTrace?
                                                                stackTrace) {
                                                      return Text(
                                                          'Error loading image');
                                                    },
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  TextApp.label(
                                                      text:
                                                          data.bank.toString(),
                                                      weigh: FontWeight.bold)
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextApp.label(
                          text:
                              "Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy.",
                          weigh: FontWeight.w300),
                      SizedBox(
                        height: 16,
                      ),
                      ButtonApp.btn(
                          text: "Place Order",
                          width: MediaQuery.of(context).size.width,
                          onTap: () {
                            if (AppData.token == "") {
                              print(AppData.token.toString());
                              appController.setActiveNav();
                              appController.menus.forEach((element) {
                                element['is_active'] = false;
                              });
                              appController.menus
                                  .where((p0) => p0['name'] == 'Akun')
                                  .toList()[0]['is_active'] = true;
                              appController.menus.refresh();
                              AlertApp.showToast(
                                  "Silahkan Login Terlebih dahulu untuk mmelakukan trasaksi");
                            } else {
                              productController.SimpleTransaction();
                            }
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
