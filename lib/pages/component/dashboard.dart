import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/controller/app.dart';
import 'package:digital_voucher_indonesia/pages/component/detail.dart';
import 'package:digital_voucher_indonesia/pages/template/mobile.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:digital_voucher_indonesia/service/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:digital_voucher_indonesia/controller/dashboard.dart';
import 'package:get/get.dart';
import 'package:digital_voucher_indonesia/pages/component/footer.dart';
import 'package:digital_voucher_indonesia/controller/product.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var controller = Get.put(DashboardCController());
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  var productCcontroller = Get.put(ProductController());
  var appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    productCcontroller.fetchProductPopuler();
    productCcontroller.fetchBestVoucher();
    productCcontroller.fetchGames();
    productCcontroller.setProduct();
  }

  List images = [
    "assets/images/banner.png",
    "assets/images/freefire_banner.jpg",
    "assets/images/pubg_banner.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double widthApp = MediaQuery.of(context).size.width /
        (width <= 515
            ? 2
            : width >= 515 && width < 1012
            ? 3
            : width >= 1012 && width <= 1040
            ? 4
            : 5) -
        40;
    double widthAppInt = MediaQuery.of(context).size.width /
        (width <= 515
            ? 2
            : width >= 515 && width < 1012
            ? 3
            : width >= 1012 && width <= 1040
            ? 4
            : 5) -
        40;

    print("width ${width}");
    print("height ${height}");
    return Expanded(
      child: Container(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                // Image.asset(
                //   "assets/images/banner.png",
                //   fit: BoxFit.fill,
                // ),
                Container(
                  height: MediaQuery.of(context).size.width / 3,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    items: images
                        .map(
                          (p) => Image.asset(
                        p,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    )
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      initialPage: 0,
                    ),
                  ),
                ),
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
                          text: "Top up dan voucher game populer",
                          weigh: FontWeight.w300,
                          size: 16.0,
                          color: Colors.white),
                      SizedBox(
                        height: 4,
                      ),
                      TextApp.label(
                          text: "Hanya ada di DVI 247",
                          weigh: FontWeight.w300,
                          color: Colors.white,
                          size: 16.0),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                  color: ColorsApp.red,
                  width: MediaQuery.of(context).size.width,
                ),
                //voucher games
                Container(
                  padding: EdgeInsets.only(
                    left: width * 0.03,
                    right: width * 0.03,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: ColorsApp.grey1,
                        ),
                      ),
                      Expanded(
                        flex: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextApp.label(
                                text: "Voucher  Terbaik",
                                weigh: FontWeight.bold,
                                size: 24.0),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 100,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Obx(
                                            () => productCcontroller
                                            .isLoadingBestVoucher
                                            .value ==
                                            true
                                            ? Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Center(
                                                child:
                                                CircularProgressIndicator(
                                                  color:
                                                  ColorsApp.baseColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                            : Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: List.generate(
                                              productCcontroller
                                                  .bestVouccher
                                                  .length, (index) {
                                            var data = productCcontroller
                                                .bestVouccher[index];
                                            return InkWell(
                                              onTap: () {
                                                appController
                                                    .setInActiveNav();
                                                print("tes");
                                                Navigator.push(
                                                  Get.context!,
                                                  MaterialPageRoute(
                                                      builder: (context) => MobileTemplate(
                                                        page: DetailPage(
                                                            product: data,
                                                            type: "voucher"
                                                        ),
                                                      )),
                                                );
                                              },
                                              child: Container(
                                                width: widthApp,
                                                padding: EdgeInsets.only(
                                                    right: 8, left: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      // child:
                                                      //     Image.network(
                                                      //   data.images,
                                                      // )
                                                      child:
                                                      Image.network(
                                                        data.images, // Replace with your image URL
                                                        loadingBuilder:
                                                            (BuildContext
                                                        context,
                                                            Widget
                                                            child,
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
                                                            (BuildContext
                                                        context,
                                                            Object
                                                            error,
                                                            StackTrace?
                                                            stackTrace) {
                                                          return Text(
                                                              'Error loading image');
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    TextApp.label(
                                                        text: data.name
                                                            .toString()),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 30,
                                                          child: TextApp.label(
                                                              decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                              text: Helper.rupiahFormat(data
                                                                  .normalPrice
                                                                  .toString()),
                                                              color:
                                                              ColorsApp
                                                                  .red),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: TextApp.label(
                                                              text: Helper.rupiahFormat(data
                                                                  .bestPrice
                                                                  .toString()),
                                                              color: ColorsApp
                                                                  .red),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        appController
                                                            .setInActiveNav();
                                                        Get.to(
                                                            MobileTemplate(
                                                              page:
                                                              DetailPage(
                                                                type:
                                                                "voucher",
                                                                product: data,
                                                              ),
                                                            ));
                                                      },
                                                      child: Container(
                                                        padding:
                                                        EdgeInsets
                                                            .all(10),
                                                        decoration: BoxDecoration(
                                                            color:
                                                            ColorsApp
                                                                .grey,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10)),
                                                        child: TextApp.label(
                                                            text:
                                                            "Top Up",
                                                            color: ColorsApp
                                                                .blackGrey),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorsApp.grey1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //   padding: EdgeInsets.only(
                //     left: width * 0.03,
                //     right: width * 0.03,
                //   ),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         flex: 5,
                //         child: Icon(
                //           Icons.arrow_back_ios,
                //           color: ColorsApp.grey1,
                //         ),
                //       ),
                //       Expanded(
                //         flex: 90,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             SizedBox(
                //               height: 20,
                //             ),
                //             TextApp.label(
                //                 text: "Game Populer",
                //                 weigh: FontWeight.bold,
                //                 size: 24.0),
                //             SizedBox(
                //               height: 20,
                //             ),
                //             Row(
                //               children: [
                //                 Expanded(
                //                   flex: 100,
                //                   child: SingleChildScrollView(
                //                       scrollDirection: Axis.horizontal,
                //                       child: Obx(
                //                             () => productCcontroller
                //                             .isLoadingBestVoucher
                //                             .value ==
                //                             true
                //                             ? Column(
                //                           mainAxisAlignment:
                //                           MainAxisAlignment.center,
                //                           crossAxisAlignment:
                //                           CrossAxisAlignment.center,
                //                           children: [
                //                             Container(
                //                               child: Center(
                //                                 child:
                //                                 CircularProgressIndicator(
                //                                   color:
                //                                   ColorsApp.baseColor,
                //                                 ),
                //                               ),
                //                             ),
                //                           ],
                //                         )
                //                             : Row(
                //                           mainAxisAlignment:
                //                           MainAxisAlignment
                //                               .spaceBetween,
                //                           children: List.generate(
                //                               productCcontroller
                //                                   .bestVouccher
                //                                   .length, (index) {
                //                             var data = productCcontroller
                //                                 .bestVouccher[index];
                //                             return InkWell(
                //                               onTap: () {
                //                                 appController
                //                                     .setInActiveNav();
                //                                 print("tes");
                //                                 Navigator.push(
                //                                   Get.context!,
                //                                   MaterialPageRoute(
                //                                       builder: (context) => MobileTemplate(
                //                                         page: DetailPage(
                //                                             product: data,
                //                                             type: "voucher"
                //                                         ),
                //                                       )),
                //                                 );
                //                               },
                //                               child: Container(
                //                                 width: widthApp,
                //                                 padding: EdgeInsets.only(
                //                                     right: 8, left: 8),
                //                                 child: Column(
                //                                   crossAxisAlignment:
                //                                   CrossAxisAlignment
                //                                       .start,
                //                                   mainAxisAlignment:
                //                                   MainAxisAlignment
                //                                       .start,
                //                                   children: [
                //                                     ClipRRect(
                //                                       borderRadius:
                //                                       BorderRadius
                //                                           .circular(
                //                                           12),
                //                                       // child:
                //                                       //     Image.network(
                //                                       //   data.images,
                //                                       // )
                //                                       child:
                //                                       Image.network(
                //                                         data.images, // Replace with your image URL
                //                                         loadingBuilder:
                //                                             (BuildContext
                //                                         context,
                //                                             Widget
                //                                             child,
                //                                             ImageChunkEvent?
                //                                             loadingProgress) {
                //                                           if (loadingProgress ==
                //                                               null) {
                //                                             return child;
                //                                           }
                //                                           return CircularProgressIndicator(
                //                                             value: loadingProgress
                //                                                 .expectedTotalBytes !=
                //                                                 null
                //                                                 ? loadingProgress
                //                                                 .cumulativeBytesLoaded /
                //                                                 loadingProgress
                //                                                     .expectedTotalBytes!
                //                                                 : null,
                //                                           );
                //                                         },
                //                                         errorBuilder:
                //                                             (BuildContext
                //                                         context,
                //                                             Object
                //                                             error,
                //                                             StackTrace?
                //                                             stackTrace) {
                //                                           return Text(
                //                                               'Error loading image');
                //                                         },
                //                                       ),
                //                                     ),
                //                                     SizedBox(
                //                                       height: 8,
                //                                     ),
                //                                     TextApp.label(
                //                                         text: data.name
                //                                             .toString()),
                //                                     SizedBox(
                //                                       height: 8,
                //                                     ),
                //                                     SizedBox(
                //                                       height: 16,
                //                                     ),
                //                                     InkWell(
                //                                       onTap: () {
                //                                         appController
                //                                             .setInActiveNav();
                //                                         Get.to(
                //                                             MobileTemplate(
                //                                               page:
                //                                               DetailPage(
                //                                                 type:
                //                                                 "voucher",
                //                                                 product: data,
                //                                               ),
                //                                             ));
                //                                       },
                //                                       child: Container(
                //                                         padding:
                //                                         EdgeInsets
                //                                             .all(10),
                //                                         decoration: BoxDecoration(
                //                                             color:
                //                                             ColorsApp
                //                                                 .grey,
                //                                             borderRadius:
                //                                             BorderRadius
                //                                                 .circular(
                //                                                 10)),
                //                                         child: TextApp.label(
                //                                             text:
                //                                             "Top Up",
                //                                             color: ColorsApp
                //                                                 .blackGrey),
                //                                       ),
                //                                     )
                //                                   ],
                //                                 ),
                //                               ),
                //                             );
                //                           }),
                //                         ),
                //                       )),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //       Expanded(
                //         flex: 5,
                //         child: Icon(
                //           Icons.arrow_forward_ios,
                //           color: ColorsApp.grey1,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Row(
                  children: [
                    Expanded(flex: 5, child: Container()),
                    Expanded(
                      flex: 90,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: width * 0.03,
                          right: width * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextApp.label(
                                text: "Game Populer",
                                weigh: FontWeight.bold,
                                size: 24.0),
                            SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 100,
                                    child: Obx(
                                          () =>
                                      productCcontroller
                                          .isLoadingProductPopuler
                                          .value ==
                                          true
                                          ? Container(
                                        child: Center(
                                          child:
                                          CircularProgressIndicator(
                                            color:
                                            ColorsApp.baseColor,
                                          ),
                                        ),
                                      )
                                          : Wrap(
                                        direction: Axis
                                            .horizontal, // This is the default, just for clarity
                                        alignment: WrapAlignment
                                            .start, // This is the default, just for clarity
                                        spacing: 8.0,
                                        runSpacing: 8.0,
                                        children: List.generate(
                                            (productCcontroller
                                                .productsPopuler
                                                .length)
                                                .ceil(), // Number of rows in the wrap
                                                (index) {
                                              var data = productCcontroller
                                                  .productsPopuler[index];
                                              return InkWell(
                                                onTap: () {
                                                  appController
                                                      .setInActiveNav();
                                                },
                                                child: Padding(
                                                  padding:
                                                  EdgeInsets.only(
                                                      bottom: 16),
                                                  child: InkWell(
                                                    onTap: () {
                                                      appController
                                                          .setInActiveNav();
                                                      print("tes");
                                                      Navigator.push(
                                                        Get.context!,
                                                        MaterialPageRoute(
                                                            builder: (context) => MobileTemplate(
                                                              page: DetailPage(
                                                                  product: data,
                                                                  type: "populer"
                                                              ),
                                                            )),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.of(
                                                          context)
                                                          .size
                                                          .width /
                                                          (width <=
                                                              515
                                                              ? 2
                                                              : width >= 515 &&
                                                              width < 1012
                                                              ? 3
                                                              : width >= 1012 && width <= 1040
                                                              ? 4
                                                              : 5) -
                                                          40,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        children: [
                                                          ClipRRect(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  12),
                                                              child: Image
                                                                  .network(
                                                                data.images,
                                                                width:
                                                                widthApp,
                                                              )),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          TextApp.label(
                                                              text: data
                                                                  .name
                                                                  .toString()),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          Row(
                                                            children: [
                                                              TextApp.label(
                                                                  text: data
                                                                      .price
                                                                      .toString(),
                                                                  color: ColorsApp
                                                                      .red),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 16.0,
                                                          ),
                                                          Container(
                                                            padding:
                                                            EdgeInsets
                                                                .all(
                                                                10),
                                                            decoration: BoxDecoration(
                                                                color: ColorsApp
                                                                    .grey,
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    10)),
                                                            child: TextApp.label(
                                                                text:
                                                                "Top Up",
                                                                color: ColorsApp
                                                                    .blackGrey),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 5, child: Container()),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Footer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateItemHeight(BoxConstraints constraints) {
    return 100.0;
  }
}
