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
import 'dialog.dart';

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
                    text:
                        "Yuuuk ..... Top Up melalui Digital Voucher Indonesia !",
                    weigh: FontWeight.w300,
                    size: 16.0,
                    color: Colors.white,
                  ),
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width / (width >= 560 ? 2 : 1),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ColorsApp.red, ColorsApp.blue],
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: TextApp.label(
                        text: "Pembayaran Dengan QRIS",
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/qris_logo_dvi.png',
                          width: 150,
                        ),
                        SizedBox(height: 16),
                        QrImageView(
                          data: productController.qr.toString(),
                          version: QrVersions.auto,
                          size: 240,
                          gapless: false,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "ID : 123123123XXXXXX",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Total Bayar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    Helper.rupiahFormat(
                        productController.transaction.value.amount.toString()),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await productController.qrisStatus(
                            productController.transaction.value.id.toString());
                      } finally {

                        if (productController.qris.isNotEmpty) {
                          var status = productController.qris[0].status;

                          if (status == "Belum di bayar") {
                            // Jika status belum dibayar
                            CustomDialog.showInfoDialog(
                              context,
                              "Informasi",
                              "Transaksi belum dibayar.",
                            );
                          } else if (status == "berhasil") {
                            // Jika status berhasil
                            CustomDialog.showSuccessDialog(
                              context,
                              "Berhasil",
                              "trxId: ${productController.qris[0].trxId}\nstatus: ${productController.qris[0].status}",
                            );
                          } else {
                            // Jika status lainnya
                            CustomDialog.showErrorDialog(
                              context,
                              "Gagal",
                              "Status transaksi: $status",
                            );
                          }
                        } else {
                          CustomDialog.showErrorDialog(
                            context,
                            "Gagal",
                            "Gagal mendapatkan data QRIS.",
                          );
                        }
                      }
                    },
                    child: Text(
                      'Klik disini apabila sudah bayar',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white,
                      ),
                    ), // Add your text here
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
