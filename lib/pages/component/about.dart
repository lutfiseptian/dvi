import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/controller/voucher.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:digital_voucher_indonesia/controller/dashboard.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../assets/images.dart';
import 'footer.dart';
// import 'package:iconsax/iconsax.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _VouccherState();
}

class _VouccherState extends State<About> {
  var controller = Get.put(VoucherController());

  @override
  void initState() {
    super.initState();
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
                padding: EdgeInsets.only(left: padding, right: padding),
                child: Column(children: [
                  TextApp.label(
                    text: '''Temukan kemudahan bertransaksi digital''',
                    size: 40.0,
                    color: ColorsApp.colorNeutralFgPrimary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextApp.label(
                      text:
                      '''Kami adalah DMT, sebuah platform e-commerce yang menyediakan berbagai macam voucher untuk kebutuhan Anda. Apakah Anda ingin beli voucher game online, makan di restoran, ngopi-ngopi, atau bahkan untuk kebutuhan listrik dan pulsa? Kami punya voucher untuk itu!
''',
                      size: 20.0,
                      color: ColorsApp.colorNeutralFgPrimary,
                      align: TextAlign.center),
                  Image.asset(ImagesApp.image_tentang),
                  TextApp.label(
                      text:
                      '''DMT didirikan pada tahun 2023 oleh sekelompok orang yang memiliki visi untuk membuat hidup lebih mudah dan menyenangkan dengan memberikan akses ke berbagai produk dan layanan dengan harga terjangkau. Kami bekerja sama dengan para mitra terpercaya yang menawarkan kualitas terbaik dan pelayanan prima.
                          \nDMT memiliki misi untuk menjadi platform e-commerce voucher terdepan di Indonesia yang memberikan pengalaman belanja yang aman, nyaman, dan menyenangkan bagi pelanggan kami. Kami juga berkomitmen untuk memberikan manfaat bagi mitra kami dengan meningkatkan penjualan, loyalitas, dan visibilitas mereka. DMT menyediakan tempat untuk kebutuhan voucher anda yaitu, Digital Voucher Indonesia. Di sinilah Anda dapat menemukan voucher untuk segala sesuatu yang Anda inginkan. Kami mengundang Anda untuk bergabung dengan kami dan menikmati berbagai penawaran menarik yang kami sediakan. Digital Voucher Indonesia, voucher untuk semua!
                          \nDMT memiliki nilai-nilai yang menjadi landasan dari semua yang kami lakukan, yaitu:
''',
                      size: 20.0,
                      color: ColorsApp.colorNeutralFgPrimary,
                      align: TextAlign.justify),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(controller.List.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 7,
                                      ),
                                      CircleAvatar(
                                        radius: 5,
                                        backgroundColor:
                                        ColorsApp.colorNeutralFgPrimary,
                                      ),
                                    ],
                                  )),
                              Expanded(
                                flex: 95,
                                child: TextApp.label(
                                    text: controller.List[index],
                                    size: 20.0,
                                    color: ColorsApp.colorNeutralFgPrimary,
                                    align: TextAlign.justify),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 200.0),
                ]),
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
                        text: "Hanya ada di Digital Voucher Indonesia",
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
