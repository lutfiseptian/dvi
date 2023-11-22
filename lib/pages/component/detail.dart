import 'dart:async';

import 'package:digital_voucher_indonesia/assets/alert.dart';
import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/controller/app.dart';
import 'package:digital_voucher_indonesia/controller/product.dart';
import 'package:digital_voucher_indonesia/controller/voucher.dart';
import 'package:digital_voucher_indonesia/model/product.dart';
import 'package:digital_voucher_indonesia/pages/component/footer.dart';
import 'package:digital_voucher_indonesia/pages/component/order_detail.dart';
import 'package:digital_voucher_indonesia/pages/template/mobile.dart';
import 'package:digital_voucher_indonesia/pages/widget/button.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:digital_voucher_indonesia/pages/widget/text_filed.dart';
import 'package:digital_voucher_indonesia/service/app_data.dart';
import 'package:digital_voucher_indonesia/service/helper.dart';
import 'package:flutter/material.dart';

// import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  ProductModel product;
  var type;

  DetailPage({super.key, required this.product, this.type});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var voucherController = Get.put(VoucherController());
  var productController = Get.put(ProductController());
  var appControllr = Get.put(AppController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appControllr.setInActiveNav();
    productController.qty.value = 1;
    productController.destUp.clear();
    productController.fetchDetail(
        productCode: widget.product.productCode.toString(), type: widget.type);
  }

  void dispose() {
    widget.type == null;
    if (widget.type == null) {
      productController.games.clear();
      productController.pulsa.clear();
      ProductController().details.clear();
      productController.bestVouccher.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double padding = width <= 890
        ? 16
        : width > 890 && width <= 998
            ? 60
            : 80;

    print("width ${width}");
    print("height ${height}");
    return Expanded(
      child: Container(
        height: double.maxFinite,
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
            Expanded(
              child: Container(
                height: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: padding, right: padding),
                        child: TextApp.label(
                            text: widget.product.name.toString(),
                            size: 24.0,
                            weigh: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: padding, right: padding),
                        child: Center(
                          child: Image.network(
                            widget.product.images,
                            // Ganti dengan URL gambar Anda
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
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
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: padding, right: padding),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              flex: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      widget.type == "voucher"

                                          ? Row(
                                              children: [
                                                TextApp.label(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    text: Helper.rupiahFormat(
                                                        widget
                                                            .product.normalPrice
                                                            .toString()),
                                                    size: 14.0,
                                                    color: ColorsApp.red),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                TextApp.label(
                                                    text: Helper.rupiahFormat(
                                                        widget.product.bestPrice
                                                            .toString()),
                                                    size: 14.0,
                                                    color: ColorsApp.green),
                                              ],
                                            )
                                          : widget.type == "game"
                                              ? Obx(() => productController
                                                      .details
                                                      .where((p0) =>
                                                          p0.isSelected == true)
                                                      .toList()
                                                      .isEmpty
                                                  ? TextApp.label(
                                                      text: widget
                                                          .product.rangeHarga,
                                                      color: ColorsApp.green)
                                                  : TextApp.label(
                                                      text: Helper.rupiahFormat(
                                                          productController
                                                              .details
                                                              .where((p0) =>
                                                                  p0.isSelected ==
                                                                  true)
                                                              .toList()[0]
                                                              .harga
                                                              .toString()),
                                                      color: ColorsApp.green))
                                              : widget.type == "populer"
                                                  ? Obx(() => productController.details.where((p0) => p0.isSelected == true).toList().isEmpty ? TextApp.label(text: widget.product.price.toString(), color: ColorsApp.green) : TextApp.label(text: Helper.rupiahFormat(productController.details.where((p0) => p0.isSelected == true).toList()[0].harga.toString()), color: ColorsApp.green))
                                                  : Obx(() => productController.details.where((p0) => p0.isSelected == true).toList().isEmpty ? TextApp.label(text: widget.product.rangeHarga, color: ColorsApp.green) : TextApp.label(text: Helper.rupiahFormat(productController.details.where((p0) => p0.isSelected == true).toList()[0].harga.toString()), color: ColorsApp.green)),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      widget.type == "voucher"
                                          ? SizedBox()
                                          : InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return ListAlertDialog(
                                                      itemList:
                                                          productController
                                                              .details.value,
                                                    );
                                                  },
                                                );
                                              },
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 60,
                                                    child: Column(
                                                      children: [
                                                        Obx(
                                                          () => Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              productController
                                                                      .details
                                                                      .where((p0) =>
                                                                          p0.isSelected ==
                                                                          true)
                                                                      .toList()
                                                                      .isEmpty
                                                                  ? TextApp.label(
                                                                      text:
                                                                          "Klik untuk pilih harga",
                                                                      color: ColorsApp
                                                                          .Secondary)
                                                                  : TextApp.label(
                                                                      text: productController
                                                                          .details
                                                                          .where((p0) =>
                                                                              p0.isSelected ==
                                                                              true)
                                                                          .toList()[
                                                                              0]
                                                                          .product,
                                                                      color: ColorsApp
                                                                          .Secondary),
                                                              Icon(
                                                                Icons
                                                                    .arrow_downward_outlined,
                                                                size: 13,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Divider()
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 40,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (widget.type !=
                                                    "pulsa") // Tambahkan kondisi ini
                                                  Container(
                                                    width: 120,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: ColorsApp
                                                              .Secondary),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 2,
                                                        bottom: 2,
                                                        left: 1,
                                                        right: 1,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              if (productController
                                                                      .qty
                                                                      .value <=
                                                                  1) {
                                                                AlertApp.showToast(
                                                                    "qty tidak boleh kurang dari 1");
                                                                return;
                                                              }
                                                              productController
                                                                      .qty
                                                                      .value =
                                                                  productController
                                                                          .qty
                                                                          .value -
                                                                      1;
                                                            },
                                                            child: Icon(
                                                                MdiIcons.minus),
                                                          ),
                                                          Obx(
                                                            () => TextApp.label(
                                                              text: productController
                                                                  .qty.value
                                                                  .toString(),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              productController
                                                                      .qty
                                                                      .value =
                                                                  productController
                                                                          .qty
                                                                          .value +
                                                                      1;
                                                            },
                                                            child:
                                                                Icon(Icons.add),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 120,
                                                  child: ButtonApp.btn(
                                                    onTap: () {
                                                      addtoCart();
                                                    },
                                                    text:
                                                        "Add to Card",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 4,
                                      ),
                                      TextFieldApp.groupColumn(
                                          title: widget.type == "pulsa"
                                              ? "No HP"
                                              : "ID Games",
                                          controller: productController.destUp,
                                          keyBoardType: TextInputType.number),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Obx(
                                        () => Row(
                                          children: [
                                            Expanded(
                                              flex: 35,
                                              child: InkWell(
                                                onTap: () {
                                                  productController
                                                      .isActveSdescription
                                                      .value = true;
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: productController
                                                                    .isActveSdescription
                                                                    .value ==
                                                                false
                                                            ? ColorsApp
                                                                .Secondary1
                                                            : Colors.white,
                                                        border: Border.all(
                                                            width: 1,
                                                            color: productController
                                                                        .isActveSdescription ==
                                                                    true
                                                                ? ColorsApp
                                                                    .Secondary
                                                                : ColorsApp
                                                                    .Secondary1)),
                                                    padding: EdgeInsets.only(
                                                        top: 4,
                                                        bottom: 4,
                                                        left: 4,
                                                        right: 4),
                                                    child: RichText(
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      text: TextSpan(
                                                        text: "Description"
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: ColorsApp
                                                                .blackDefault,
                                                            fontSize: 12),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 35,
                                              child: InkWell(
                                                onTap: () {
                                                  productController
                                                      .isActveSdescription
                                                      .value = false;
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: productController
                                                                    .isActveSdescription
                                                                    .value ==
                                                                true
                                                            ? ColorsApp
                                                                .Secondary1
                                                            : Colors.white,
                                                        border: Border.all(
                                                            width: 1,
                                                            color: productController
                                                                        .isActveSdescription
                                                                        .value ==
                                                                    true
                                                                ? ColorsApp
                                                                    .Secondary1
                                                                : ColorsApp
                                                                    .Secondary)),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 4,
                                                          bottom: 4,
                                                          left: 4,
                                                          right: 4),
                                                      child: RichText(
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        text: TextSpan(
                                                          text:
                                                              "Addional Information"
                                                                  .toString(),
                                                          style: TextStyle(
                                                              color: ColorsApp
                                                                  .blackDefault,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 40, child: SizedBox()),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Obx(
                                        () => productController
                                                    .isActveSdescription ==
                                                true
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // TextApp.label(
                                                  //     text: "Description",
                                                  //     size: 14.0),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  TextApp.label(
                                                      text: widget
                                                          .product.description
                                                          .toString(),
                                                      weigh: FontWeight.w400)
                                                ],
                                              )
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // TextApp.label(
                                                  //     text:
                                                  //         "Additional Information",
                                                  //     size: 14.0),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  TextApp.label(
                                                      text: widget
                                                          .product.addional1
                                                          .toString(),
                                                      weigh: FontWeight.w400)
                                                ],
                                              ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      ButtonApp.btn(
                                          text: "Checkout",
                                          onTap: () {
                                            addtoCartCheckout();
                                            // Get.back();

                                            // Get.to(MobileTemplate(
                                            //   page: OrderDetail(),
                                            // ));
                                          })
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Footer()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addtoCart() {
    AlertApp.showLoadingIndicator(Get.context!, "Tunggu sebentar...");
    Timer(Duration(seconds: 1), () {
      Get.back();
      if (widget.type == "voucher") {
        if (productController.destUp.text == "") {
          AlertApp.showToast(widget.type == "pulsa"
              ? "Isi terlebih dahulu nomor hpmu"
              : "Isi terlebih dahulu ID gamemu");
        } else {
          var product = productController.cartProduct
              .where(
                  (p0) => p0.code.toString() == widget.product.code.toString())
              .toList();
          if (product.isEmpty) {
            productController.cartProduct.add(ProductModel(
                destTopup: productController.destUp.text,
                type: widget.type,
                price: widget.product.bestPrice,
                images: widget.product.images,
                name: widget.product.name,
                qty: productController.qty.value,
                code: widget.product.code));
            AlertApp.showToast('Produk ditambahkan ke keranjang');
          } else {
            product[0].qty = productController.qty.value + product[0].qty;
            AlertApp.showToast('Produk ditambahkan ke keranjang');
          }
        }
      } else {
        var detail = productController.details
            .where((p0) => p0.isSelected == true)
            .toList();
        if (detail.isEmpty) {
          AlertApp.showToast("Pilih terlebih dahulu detaill item");
        } else {
          if (productController.destUp.text == "") {
            AlertApp.showToast(widget.type == "pulsa"
                ? "Isi terlebih dahulu nomor hpmu"
                : "Isi terlebih dahulu ID gamemu");
          } else {
            var product = productController.cartProduct
                .where((p0) => p0.code.toString() == detail[0].code.toString())
                .toList();
            if (product.isEmpty) {
              productController.cartProduct.add(ProductModel(
                  destTopup: productController.destUp.text,
                  type: widget.type,
                  price: detail[0].harga,
                  images: widget.product.images,
                  name: detail[0].product,
                  qty: productController.qty.value,
                  code: detail[0].code));
              AlertApp.showToast('Produk ditambahkan ke keranjang');
            } else {
              product[0].qty = productController.qty.value + product[0].qty;
              AlertApp.showToast('Produk ditambahkan ke keranjang');
            }
          }
        }
      }
      AppData.products = productController.cartProduct;
    });
  }

  void addtoCartCheckout() {
    AlertApp.showLoadingIndicator(Get.context!, "Tunggu sebentar...");
    Timer(Duration(seconds: 1), () {
      Get.back();
      if (widget.type == "voucher") {
        if (productController.destUp.text == "") {
          AlertApp.showToast(widget.type == "pulsa"
              ? "Isi terlebih dahulu nomor hpmu"
              : "Isi terlebih dahulu ID gamemu");
        } else {
          var product = productController.cartProduct
              .where(
                  (p0) => p0.code.toString() == widget.product.code.toString())
              .toList();
          if (product.isEmpty) {
            productController.cartProduct.add(ProductModel(
                destTopup: productController.destUp.text,
                type: widget.type,
                price: widget.product.bestPrice,
                images: widget.product.images,
                name: widget.product.name,
                qty: productController.qty.value,
                code: widget.product.code));
            // AlertApp.showToast('produk ditambahkan ke keranjang');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MobileTemplate(
                        page: OrderDetail(),
                      )),
            );
          } else {
            product[0].qty = productController.qty.value + product[0].qty;
            // AlertApp.showToast('produk ditambahkan ke keranjang');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MobileTemplate(
                        page: OrderDetail(),
                      )),
            );
          }
        }
      } else {
        var detail = productController.details
            .where((p0) => p0.isSelected == true)
            .toList();
        if (detail.isEmpty) {
          AlertApp.showToast("Pilih terlebih dahulu detaill item");
        } else {
          if (productController.destUp.text == "") {
            AlertApp.showToast(widget.type == "pulsa"
                ? "Isi terlebih dahulu nomor hpmu"
                : "Isi terlebih dahulu ID gamemu");
          } else {
            var product = productController.cartProduct
                .where((p0) => p0.code.toString() == detail[0].code.toString())
                .toList();
            if (product.isEmpty) {
              productController.cartProduct.add(ProductModel(
                  destTopup: productController.destUp.text,
                  type: widget.type,
                  price: detail[0].harga,
                  images: widget.product.images,
                  name: detail[0].product,
                  qty: productController.qty.value,
                  code: detail[0].code));
              AppData.products = productController.cartProduct;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MobileTemplate(
                          page: OrderDetail(),
                        )),
              );
            } else {
              product[0].qty = productController.qty.value + product[0].qty;
              AppData.products = productController.cartProduct;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MobileTemplate(
                          page: OrderDetail(),
                        )),
              );
            }
          }
        }
      }
    });
  }
}

class ListAlertDialog extends StatelessWidget {
  final List<ProductModel> itemList;

  ListAlertDialog({required this.itemList});

  var controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Items'),
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            var data = itemList[index];
            print(itemList.length);
            return ListTile(
              title: InkWell(
                onTap: () {
                  controller.details.forEach((element) {
                    element.isSelected = false;
                  });
                  data.isSelected = true;
                  controller.details.refresh();
                  Get.back();
                },
                child: data.isSelected
                    ? Container(
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: ColorsApp.blue)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextApp.label(
                                      text: data.product.toString(),
                                      color: ColorsApp.Secondary),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextApp.label(
                                      text: Helper.rupiahFormat(
                                        data.harga.toString(),
                                      ),
                                      color: ColorsApp.Secondary1)
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 20,
                                child: Container(
                                  child: Icon(
                                    Icons.check,
                                    color: ColorsApp.blue,
                                  ),
                                ))
                          ],
                        ))
                    : Container(
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 1, color: ColorsApp.Secondary1)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextApp.label(
                                      text: data.product.toString(),
                                      color: ColorsApp.Secondary),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextApp.label(
                                      text: Helper.rupiahFormat(
                                        data.harga.toString(),
                                      ),
                                      color: ColorsApp.Secondary1)
                                ],
                              ),
                            ),
                            Expanded(flex: 20, child: Container())
                          ],
                        )),
              ),
              onTap: () {
                // Handle item tap
                Navigator.pop(context); // Close the dialog
                // Add your custom logic for item selection here
              },
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: Text('Tutup'),
        ),
      ],
    );
  }
}
