import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/controller/app.dart';
import 'package:digital_voucher_indonesia/controller/product.dart';
import 'package:digital_voucher_indonesia/pages/component/order_detail.dart';
import 'package:digital_voucher_indonesia/pages/template/mobile.dart';
import 'package:digital_voucher_indonesia/pages/widget/button.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:digital_voucher_indonesia/service/app_data.dart';
import 'package:digital_voucher_indonesia/service/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyDrawer extends StatelessWidget {
  var productControler = Get.put(ProductController());
  var appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Obx(
      () => productControler.cartProduct.isEmpty
          ? ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.lock),
                    SizedBox(
                      width: 20,
                    ),
                    TextApp.label(text: "Your Cart", size: 24.0)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: MediaQuery.of(context).size.height - 100,
                    child: Center(
                        child: TextApp.label(
                            text: "Belum ada item",
                            size: 24.0,
                            weigh: FontWeight.bold)))
              ],
            )
          : ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.inbox,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextApp.label(text: "Your Cart", size: 24.0)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                            productControler.cartProduct.length, (index) {
                          var data = productControler.cartProduct[index];
                          return Container(
                            child: Column(
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 40,
                                        child: Image.network(
                                          data.images, // Replace with your image URL
                                          fit: BoxFit.fill,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
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
                                          errorBuilder: (BuildContext context,
                                              Object error,
                                              StackTrace? stackTrace) {
                                            return Text('Error loading image');
                                          },
                                          // child: Image.network(
                                          //   widget.product.images,
                                          //   fit: BoxFit.fill,
                                        ),
                                        // child: Image.network(
                                        //   data.images,
                                        //   fit: BoxFit.fill,
                                        // ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 50,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextApp.label(
                                                text: data.name,
                                                size: 14.0,
                                                weigh: FontWeight.bold),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            TextApp.label(
                                                text:
                                                    "${data.qty} X ${Helper.rupiahFormat(data.price.toString())}",
                                                size: 14.0,
                                                weigh: FontWeight.w300),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            TextApp.label(
                                                text: Helper.rupiahFormat(
                                                    (int.parse(data.qty
                                                                .toString()) *
                                                            int.parse(data.price
                                                                .toString()))
                                                        .toString()),
                                                size: 14.0,
                                                weigh: FontWeight.w300),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          flex: 10,
                                          child: InkWell(
                                            onTap: () {
                                              productControler.cartProduct
                                                  .removeWhere((element) =>
                                                      element.code ==
                                                      data.code);

                                              AppData.products =
                                                  productControler.cartProduct;
                                            },
                                            child: Icon(
                                              MdiIcons.trashCan,
                                              color: ColorsApp.Secondary,
                                            ),
                                          ))
                                    ]),
                                SizedBox(
                                  height: 12,
                                ),
                                Divider()
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextApp.label(
                          text:
                              "Subtotal: ${Helper.rupiahFormat(productControler.cartProduct.fold<int>(0, (previousValue, element) => int.parse(previousValue.toString()) + int.parse((int.parse(element.qty.toString()) * int.parse(element.price.toString())).toString())).toString())}",
                          weigh: FontWeight.bold,
                          size: 14.0),
                      SizedBox(
                        height: 16,
                      ),
                      TextApp.label(
                          text: "Contunue Shopping",
                          weigh: FontWeight.w300,
                          size: 14.0),
                      SizedBox(
                        height: 16,
                      ),
                      TextApp.label(
                          text: "View Chart",
                          weigh: FontWeight.w300,
                          size: 14.0),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                          width: 100,
                          child: ButtonApp.btn(
                              onTap: () {
                                appController.setInActiveNav();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MobileTemplate(
                                            page: OrderDetail(),
                                          )),
                                );
                              },
                              text: "Checkout"))
                    ],
                  ),
                )
              ],
            ),
    ));
  }
}
