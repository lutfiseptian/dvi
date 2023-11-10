import 'package:digital_voucher_indonesia/assets/alert.dart';
import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/controller/order.dart';
import 'package:digital_voucher_indonesia/controller/product.dart';
import 'package:digital_voucher_indonesia/pages/widget/button.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:digital_voucher_indonesia/service/helper.dart';

import 'package:flutter/services.dart';

class PllaceOrder extends StatefulWidget {
  const PllaceOrder({super.key});

  @override
  State<PllaceOrder> createState() => _PllaceOrderState();
}

class _PllaceOrderState extends State<PllaceOrder> {
  var controller = Get.put(OrderController());
  var productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print("width ${width}");
    print("height ${height}");
    return Expanded(
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
                        text: "Yuuuk ..... Top Up melalui Digital Voucher Indonesia !",
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
                width:
                    MediaQuery.of(context).size.width / (width >= 560 ? 2 : 1),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: ColorsApp.red,
                          borderRadius: BorderRadius.circular(4)),
                      padding:
                          EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
                      child: TextApp.label(
                          text: "IDR Deposit Virtual Account",
                          color: Colors.white,
                          size: 16.0),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1)),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 50,
                                  child: InkWell(
                                    onTap: () async {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            text: "No. Referensi Transaksi"
                                                .toString(),
                                            style: TextStyle(
                                                color: ColorsApp.Secondary,
                                                fontSize: 12),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        TextApp.label(
                                          text: productController
                                              .transaction.value.seri,
                                        ),
                                        Divider()
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  flex: 50,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: "Akun Bank Virtual (Kode bank)"
                                              .toString(),
                                          style: TextStyle(
                                              color: ColorsApp.Secondary,
                                              fontSize: 12),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextApp.label(
                                          text:
                                              "${productController.bank.where((p0) => p0.isChecked == true).toList()[0].bank} (${productController.bank.where((p0) => p0.isChecked == true).toList()[0].bankCode} )"),
                                      Divider()
                                    ],
                                  ))
                            ],
                          ),

                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 50,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: "No Virtual account (VA)"
                                              .toString(),
                                          style: TextStyle(
                                              color: ColorsApp.Secondary,
                                              fontSize: 12),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text: productController
                                                  .transaction.value.vaNumber
                                                  .toString()));

                                          AlertApp.showToast(
                                              "Nomor Berhasil disalin");
                                        },
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 90,
                                                child: TextApp.label(
                                                    text: productController
                                                        .transaction
                                                        .value
                                                        .vaNumber
                                                        .toString())),
                                            Expanded(
                                              flex: 10,
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Icon(
                                                    Icons.inbox,
                                                    size: 13,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider()
                                    ],
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  flex: 50,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: "Jumlah Deposit".toString(),
                                          style: TextStyle(
                                              color: ColorsApp.Secondary,
                                              fontSize: 12),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text: productController
                                                  .transaction.value.amount));

                                          AlertApp.showToast(
                                              "Nominal Berhasil disalin");
                                        },
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 90,
                                                child: TextApp.label(
                                                    text: Helper.rupiahFormat(
                                                        productController
                                                            .transaction
                                                            .value
                                                            .amount
                                                            .toString()))),
                                            Expanded(
                                              flex: 10,
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Icon(
                                                    Icons.inbox,
                                                    size: 13,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider()
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: ColorsApp.blue,
                          borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Padding(
                          padding: EdgeInsets.only(left: 4, right: 4),
                          child: TextApp.label(
                              text: "Cara Pembayaran", color: Colors.white)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(productController.notes.length,
                          (index) {
                        var data = productController.notes[index];
                        return Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextApp.label(
                                  text: data, color: ColorsApp.Secondary),
                              Divider()
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ButtonApp.btn(text: "Sudah Bayar")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
