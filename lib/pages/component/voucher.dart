import 'package:digital_voucher_indonesia/assets/alert.dart';
import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/controller/app.dart';
import 'package:digital_voucher_indonesia/controller/product.dart';
import 'package:digital_voucher_indonesia/controller/voucher.dart';
import 'package:digital_voucher_indonesia/pages/component/detail.dart';
import 'package:digital_voucher_indonesia/pages/component/footer.dart';
import 'package:digital_voucher_indonesia/pages/template/mobile.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class Voucher extends StatefulWidget {
  const Voucher({super.key});

  @override
  State<Voucher> createState() => _VouccherState();

}

class _VouccherState extends State<Voucher> {
  var controller = Get.put(VoucherController());
  var productController = Get.put(ProductController());
  var appController = Get.put(AppController());
  var isLoadingProductPopuler = true.obs;


  @override
  void initState() {
    super.initState();
    productController.fetchPulsa();
    productController.fetchGames();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = width <= 1080 ? 16 : 82;
    print("width ${width}");
    print("height ${height}");
    return Expanded(
      child: Container(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //voucher game
              Container(
                color: ColorsApp.blue,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextApp.label(
                        text: "Yuuuk ..... Top Up melalui DVI 247 !",
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
                padding: EdgeInsets.only(left: padding, right: padding),
                child: Column(
                  children: [
                    Obx(() => Row(
                      children:
                      List.generate(controller.menus.length, (index) {
                        var data = controller.menus[index];
                        return Expanded(
                          flex: 25,
                          child: InkWell(
                            onTap: () {
                              if (data['id'] == "resto") {
                                AlertApp.showToast("Coming soon");
                                return;
                              }
                              controller.menus.forEach((element) {
                                element['is_active'] = false;
                              });
                              data['is_active'] = true;
                              controller.menus.refresh();
                            },
                            child: data['is_active'] == true
                                ? Padding(
                              padding:
                              EdgeInsets.only(left: 8, right: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ColorsApp.red,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight:
                                        Radius.circular(5))),
                                padding: EdgeInsets.only(
                                    bottom: 10, top: 10),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 20,
                                        child: Icon(
                                          data['icon'] as IconData?,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 80,
                                        child: Container(
                                          child: RichText(
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis,
                                            text: TextSpan(
                                              text: data['name']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      )
                                      // TextApp.label(
                                      //     text: data['name'],
                                      //     color: Colors.white),
                                    ],
                                  ),
                                ),
                              ),
                            )
                                : Padding(
                              padding:
                              EdgeInsets.only(left: 8, right: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: HexColor('#EBE9EB'),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight:
                                        Radius.circular(5))),
                                padding: EdgeInsets.only(
                                    bottom: 10, top: 10),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 5, right: 5),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 20,
                                        child: Icon(
                                          data['icon'] as IconData?,
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 80,
                                        child: Container(
                                          child: RichText(
                                            maxLines: 1,
                                            overflow:
                                            TextOverflow.ellipsis,
                                            text: TextSpan(
                                              text: data['name']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      )
                                      // TextApp.label(
                                      //     text: data['name'],
                                      //     color: Colors.white),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    )),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      height: 5,
                      width: MediaQuery.of(context).size.width,
                      color: ColorsApp.red,
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.only(left: padding, right: padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 90,
                            child: Obx(() {
                              var id = controller.menus.where((element) {
                                return element['is_active'] == true;
                              }).toList()[0]['id'];
                              if (id == "pulsa") {
                              }
                              return id == "pulsa"
                                  ? Wrap(
                                direction: Axis
                                    .horizontal, // This is the default, just for clarity
                                alignment: WrapAlignment
                                    .start, // This is the default, just for clarity
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: List.generate(
                                    (productController.pulsa.length)
                                        .ceil(), // Number of rows in the wrap
                                        (index) {
                                      var data =
                                      productController.pulsa[index];
                                      return InkWell(
                                        onTap: () async {
                                          appController.setInActiveNav();
                                          // Menampilkan dialog loading sebelum memulai navigasi
                                          showLoadingDialog();
                                          await Future.delayed(Duration(seconds: 2));
                                          // Menutup dialog loading sebelum navigasi
                                          hideLoadingDialog();
                                          Navigator.push(
                                            Get.context!,
                                            MaterialPageRoute(
                                              builder: (context) => MobileTemplate(
                                                page: DetailPage(
                                                  product: data,
                                                  type: "pulsa",
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 16),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width /
                                                (width <= 515
                                                    ? 2
                                                    : width >= 515 && width < 1012
                                                    ? 3
                                                    : width >= 1012 && width <= 1040
                                                    ? 4
                                                    : 5) -
                                                40,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child: Image.network(
                                                    data.images, // Ganti dengan URL gambar Anda
                                                    fit: BoxFit.fill,
                                                    loadingBuilder: (BuildContext context, Widget child,
                                                        ImageChunkEvent? loadingProgress) {
                                                      if (loadingProgress == null) {
                                                        return child;
                                                      }
                                                      return CircularProgressIndicator(
                                                        value: loadingProgress.expectedTotalBytes != null
                                                            ? loadingProgress.cumulativeBytesLoaded /
                                                            loadingProgress.expectedTotalBytes!
                                                            : null,
                                                      );
                                                    },
                                                    errorBuilder: (BuildContext context, Object error,
                                                        StackTrace? stackTrace) {
                                                      return Text('Error loading image');
                                                    },
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                TextApp.label(text: data.name.toString()),
                                                SizedBox(height: 8),
                                                SizedBox(height: 16.0),
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: ColorsApp.grey,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: TextApp.label(
                                                    text: "Top Up",
                                                    color: ColorsApp.blackGrey,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );

                                    }),
                              )
                                  : InkWell(
                                child: Wrap(
                                  direction: Axis
                                      .horizontal, // This is the default, just for clarity
                                  alignment: WrapAlignment
                                      .start, // This is the default, just for clarity
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  children: List.generate(
                                      (productController.games.length)
                                          .ceil(), // Number of rows in the wrap
                                          (index) {
                                        var data =
                                        productController.games[index];
                                        // return InkWell(
                                        //   onTap: () {
                                        //     appController.setInActiveNav();
                                        //     Navigator.push(
                                        //       Get.context!,
                                        //       MaterialPageRoute(
                                        //           builder: (context) => MobileTemplate(
                                        //             page: DetailPage(
                                        //               product: data,
                                        //               type: "game",
                                        //             ),
                                        //           )),
                                        //     );
                                        //   },
                                        //   child: Padding(
                                        //     padding:
                                        //     EdgeInsets.only(bottom: 16),
                                        //     child: Container(
                                        //       width: MediaQuery.of(context)
                                        //           .size
                                        //           .width /
                                        //           (width <= 515
                                        //               ? 2
                                        //               : width >= 515 &&
                                        //               width < 1012
                                        //               ? 3
                                        //               : width >= 1012 &&
                                        //               width <=
                                        //                   1040
                                        //               ? 4
                                        //               : 5) -
                                        //           40,
                                        //       child: Column(
                                        //         crossAxisAlignment:
                                        //         CrossAxisAlignment.start,
                                        //         mainAxisAlignment:
                                        //         MainAxisAlignment.start,
                                        //         children: [
                                        //           ClipRRect(
                                        //             borderRadius:
                                        //             BorderRadius.circular(
                                        //                 12),
                                        //             child: Image.network(
                                        //               data.images, // Replace with your image URL
                                        //               fit: BoxFit.fill,
                                        //               loadingBuilder:
                                        //                   (BuildContext
                                        //               context,
                                        //                   Widget child,
                                        //                   ImageChunkEvent?
                                        //                   loadingProgress) {
                                        //                 if (loadingProgress ==
                                        //                     null) {
                                        //                   return child;
                                        //                 }
                                        //                 return CircularProgressIndicator(
                                        //                   value: loadingProgress
                                        //                       .expectedTotalBytes !=
                                        //                       null
                                        //                       ? loadingProgress
                                        //                       .cumulativeBytesLoaded /
                                        //                       loadingProgress
                                        //                           .expectedTotalBytes!
                                        //                       : null,
                                        //                 );
                                        //               },
                                        //               errorBuilder:
                                        //                   (BuildContext
                                        //               context,
                                        //                   Object error,
                                        //                   StackTrace?
                                        //                   stackTrace) {
                                        //                 return Text(
                                        //                     'Error loading image');
                                        //               },
                                        //               // child: Image.network(
                                        //               //   widget.product.images,
                                        //               //   fit: BoxFit.fill,
                                        //             ),
                                        //             // child: Image.network(
                                        //             //     data.images)
                                        //           ),
                                        //           SizedBox(
                                        //             height: 8,
                                        //           ),
                                        //           TextApp.label(
                                        //               text: data.name
                                        //                   .toString()),
                                        //           SizedBox(
                                        //             height: 8,
                                        //           ),
                                        //
                                        //           SizedBox(
                                        //             height: 16.0,
                                        //           ),
                                        //           Container(
                                        //             padding:
                                        //             EdgeInsets.all(10),
                                        //             decoration: BoxDecoration(
                                        //                 color: ColorsApp.grey,
                                        //                 borderRadius:
                                        //                 BorderRadius
                                        //                     .circular(
                                        //                     10)),
                                        //             child: TextApp.label(
                                        //                 text: "Top Up",
                                        //                 color: ColorsApp
                                        //                     .blackGrey),
                                        //           )
                                        //         ],
                                        //       ),
                                        //     ),
                                        //   ),
                                        // );
                                        return InkWell(
                                          onTap: () async {
                                            appController.setInActiveNav();
                                            showLoadingDialog();
                                            await Future.delayed(Duration(seconds: 2));
                                            hideLoadingDialog();
                                            Navigator.push(
                                              Get.context!,
                                              MaterialPageRoute(
                                                builder: (context) => MobileTemplate(
                                                  page: DetailPage(
                                                    product: data,
                                                    type: "game",
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 16),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width /
                                                  (width <= 515
                                                      ? 2
                                                      : width >= 515 && width < 1012
                                                      ? 3
                                                      : width >= 1012 && width <= 1040
                                                      ? 4
                                                      : 5) -
                                                  40,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(12),
                                                    child: Image.network(
                                                      data.images, // Ganti dengan URL gambar Anda
                                                      fit: BoxFit.fill,
                                                      loadingBuilder: (BuildContext context, Widget child,
                                                          ImageChunkEvent? loadingProgress) {
                                                        if (loadingProgress == null) {
                                                          return child;
                                                        }
                                                        return CircularProgressIndicator(
                                                          value: loadingProgress.expectedTotalBytes != null
                                                              ? loadingProgress.cumulativeBytesLoaded /
                                                              loadingProgress.expectedTotalBytes!
                                                              : null,
                                                        );
                                                      },
                                                      errorBuilder: (BuildContext context, Object error,
                                                          StackTrace? stackTrace) {
                                                        return Text('Error loading image');
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  TextApp.label(text: data.name.toString()),
                                                  SizedBox(height: 8),
                                                  SizedBox(height: 16.0),
                                                  Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      color: ColorsApp.grey,
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: TextApp.label(
                                                      text: "Top Up",
                                                      color: ColorsApp.blackGrey,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              );
                            })),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                height: 10,
                color: ColorsApp.red,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: ColorsApp.blue,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextApp.label(
                        text: "Top up dan voucher game populer",
                        weigh: FontWeight.w300,
                        size: 14.0,
                        color: Colors.white),
                    SizedBox(
                      height: 4,
                    ),
                    TextApp.label(
                        text: "Hanya ada di DVI247",
                        weigh: FontWeight.w300,
                        color: Colors.white,
                        size: 14.0),
                  ],
                ),
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}

void showLoadingDialog() {
  final overlayController = Get.overlayContext;
  if (overlayController != null) {
    // Get.back();
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Mohon Tunggu", style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/loading.png', // Ganti dengan path file gambar Anda
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      useSafeArea: false, // Menggunakan navigator root agar tidak mempengaruhi navigasi lainnya
    );
  }
}


void hideLoadingDialog() {
  Get.back(); // Tutup dialog loading
}
