
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../assets/colors.dart';
import '../../controller/order.dart';
import '../../controller/product.dart';
import '../../service/helper.dart';
import '../widget/button.dart';
import '../widget/text.dart';

class QrisPage extends StatefulWidget {
  const QrisPage({super.key});

  @override
  State<QrisPage> createState() => _QrisPageState();
}

class _QrisPageState extends State<QrisPage> {
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
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
                      child: Center(
                        child: TextApp.label(
                          text: "Pembayaran Dengan QRIS",
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                    ),

                    // productController
                    //     .transaction.value.amount
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: QrImageView(
                          data: productController.qr.toString(),
                          version: QrVersions.auto,
                          size: 320,
                          gapless: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Total Bayar",
                      style: TextStyle(
                        fontSize: 18, // Ukuran teks
                        color: Colors.black, // Ganti dengan nama font yang sesuai
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      Helper.rupiahFormat(
                          productController
                              .transaction
                              .value
                              .amount
                              .toString()),
                      style: TextStyle(
                        fontSize: 18, // Ukuran teks
                        color: Colors.black, // Ganti dengan nama font yang sesuai
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ButtonApp.btn(text: "Scan Untuk Bayar")
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