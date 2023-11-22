import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../assets/alert.dart';
import '../assets/colors.dart';
import '../controller/app.dart';
import '../controller/product.dart';
import '../controller/voucher.dart';
import 'component/footer.dart';

class UmumPage extends StatefulWidget {
  const UmumPage({super.key});

  @override
  State<UmumPage> createState() => _UmumPage();
}

class _UmumPage extends State<UmumPage> {
  var controller = Get.put(VoucherController());

  var productController = Get.put(ProductController());

  var appController = Get.put(AppController());

  @override
  void initState() {
    // TODO: implement initState
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
                        text: "Ketentuan Umum",
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
                          children: List.generate(controller.menuUmum.length,
                              (index) {
                            var data = controller.menuUmum[index];
                            return Expanded(
                              flex: 25,
                              child: InkWell(
                                onTap: () {
                                  if (data['id'] == "resto") {
                                    AlertApp.showToast("Coming soon");
                                    return;
                                  }
                                  controller.menuUmum.forEach((element) {
                                    element['is_active'] = false;
                                  });
                                  data['is_active'] = true;
                                  controller.menuUmum.refresh();
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
                              var id = controller.menuUmum.where((element) {
                                return element['is_active'] == true;
                              }).toList()[0]['id'];
                              return buildContentForId(id.toString());
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

Widget buildContentForId(String id) {
  if (id == "pengembalian_dana") {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saya kelebihan/kekurangan membayar transaksi, apa yang harus dilakukan?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '• Transaksi Anda akan gagal apabila membayar tidak sesuai dengan total order. Untuk itu, Anda bisa mengajukan refund ke tim Customer Service melalui email ke care@dvi247.com.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            'Bagaimana status pengembalian dana (refund) saya?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '• Silakan konfirmasi atau hubungi agen Customer Service kami melalui email ke care@dvi247.com',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            'Apakah saya bisa mengajukan refund transaksi?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Anda hanya bisa mengajukan refund transaksi apabila mengalami kondisi-kondisi berikut ini:',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '• Nomor handphone/telepon, nomor pelanggan, atau nomor meteran listrik tidak valid sehingga menyebabkan transaksi gagal pada pihak operator.',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '• Pembayaran transaksi yang tidak sesuai dengan total order.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            'Pengajuan refund tidak berlaku untuk hal-hal berikut ini:',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '• Adanya kelalaian atau kesalahan dalam menginput data seperti nomor handphone, nomor meteran listrik, nomor BPJS, nomor Telkom/Indihome, nomor tagihan cicilan multifinance, namun status transaksi di dvi247 telah “Berhasil”, maka dana tidak dapat direfund.',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '• Tidak ditemukannya pembayaran transaksi dari pelanggan.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  } else if (id == "pengembalian_dana") {
    return Container();
  } else if (id == "cara_bayar") {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kami menerima pembayaran BCA Virtual Account, BNI Virtual Account, Mandiri Virtual Account, Virtual Semua Bank',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Setiap pembayaran dan pembelian PLN, pembayaran Telkom Postpaid/Indihome, BPJS Kesehatan, Multifinance, akan dikenakan biaya.',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'Untuk admin fee yang dikenakan setiap produk akan berbeda – beda.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            'Minimum Pembayaran Transaksi di dvi247:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            '• Va Semua Bank, BNI VA, Mandiri VA, minimum total order sebesar 25.000,-',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            '• Va BCA minimum total order sebesar 100.000,-',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            'Pukul 21:00-02:00 WIB BCA dalam proses Cut Off/Maintenance setiap hari nya, sehingga pembayaran yang di lakukan selama proses Cut Off akan terproses setelah Cut Off selesai.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            'Pastikan pembayaran Anda sesuai total tagihan yang kami informasikan agar dapat terverifikasi otomatis.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  } else if (id == "produk_biller") {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "1. ISI PULSA DAN PAKET DATA",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "Pengisian pulsa maksimal satu kali Transaksi perhari dengan nomor yang sama dan nominal yang sama. Hal ini untuk mencegah terjadinya pengisian dua kali secara tidak disengaja.",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Pastikan nomor yang anda input benar atau tidak dalam masa tenggang. Digital Voucher Indonesia tidak bertanggung jawab atas kesalahan pengisian pulsa dikarenakan kesalahan input nomor tujuan oleh pengguna.",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Harga dapat berubah sewaktu-waktu tanpa pemberitahuan.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            "2. PLN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text("PLN Pasca Bayar (Tagihan Listrik).",
              style: TextStyle(fontSize: 14)),
          Text("PLN Prabayar (Token Listrik).", style: TextStyle(fontSize: 14)),
          Text(
            "Transaksi PLN tidak dapat dilakukan pada pukul 23.00-00.30 WIB setiap harinya sesuai dengan ketentuan dari PLN.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            "3. PEMBAYARAN BPJS, TELKOM, PDAM, DAN CICILAN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text("Pembayaran BPJS", style: TextStyle(fontSize: 14)),
          Text(
              "Saat ini diperuntukkan bagi individu dalam satu Kartu Keluarga.",
              style: TextStyle(fontSize: 14)),
          Text("Pembayaran Telkom / Indihome", style: TextStyle(fontSize: 14)),
          Text(
              "Pelanggan menginput nomor telepon rumah atau nomor pelanggan Indihome.",
              style: TextStyle(fontSize: 14)),
          Text("Pembayaran PDAM", style: TextStyle(fontSize: 14)),
          Text("Pelanggan menginput untuk nomor ID pelanggan atau nomor Meter.",
              style: TextStyle(fontSize: 14)),
          Text("Bayar Cicilan atau Multifinance",
              style: TextStyle(fontSize: 14)),
          Text(
              "Digital Voucher Indonesia menerima pembayaran cicilan antara lain yaitu: Bussan Auto Finance, Federal International Finance, Wahana Ottomitra Multiartha. Pembayaran Multifinance tidak dapat menggunakan metode pembayaran Kredivo dan Kartu Kredit.",
              style: TextStyle(fontSize: 14)),
          Text("Pembayaran Pasca Bayar", style: TextStyle(fontSize: 14)),
          Text(
              "Pembayaran ini untuk pembayaran mobile postpaid dengan memasukkan nomor pelanggan",
              style: TextStyle(fontSize: 14)),
          SizedBox(height: 16),
          Text(
            "4. ISI ULANG UANG ELEKTRONIK",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "Pengisian uang elektronik Gopay, OVO, dan ShopeePay maksimal satu kali Transaksi perhari dengan nomor yang sama dan nominal yang sama. Hal ini untuk mencegah terjadinya pengisian dua kali secara tidak disengaja.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  } else if (id == "hubungi_kami") {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hubungi Kami",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "Silakan hubungi kami jika Anda memiliki pertanyaan atau butuh bantuan lebih lanjut melalui nomor telepon 021-27938050 atau email ke care@dvi247.com.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
  else if (id == "privacy_policy") {
    var controller = Get.put(VoucherController());
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Privacy Policy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5,),
          Text(
            "Terima kasih telah mengunjungi dvi247.com. Kami sangat menghargai kepercayaan Anda dan berkomitmen untuk melindungi informasi pribadi Anda. Kebijakan Privasi ini dirancang untuk memberikan pemahaman yang jelas tentang bagaimana kami mengumpulkan, menggunakan, mengungkap, dan menjaga informasi pribadi Anda. Dengan menggunakan layanan kami, Anda menyetujui praktik yang dijelaskan dalam Kebijakan Privasi ini.",
            style: TextStyle(fontSize: 14),
          ),SizedBox(height: 10,),
          Text(
            "Informasi yang Kami Kumpulkan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),SizedBox(height: 5,),
          Text(
            "Kami dapat mengumpulkan informasi pribadi yang Anda berikan secara langsung kepada kami, seperti nama, alamat email, nomor telepon, dan informasi lainnya saat Anda menggunakan layanan kami.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10,),
          Text(
            'Bagaimana Kami Menggunakan Informasi Anda',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5,),
          Text(
            "Informasi pribadi yang kami kumpulkan dapat digunakan untuk:",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(controller.Listprivacy.length, (index) {
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
                      SizedBox(width: 5,),
                      Expanded(
                        flex: 95,
                        child: TextApp.label(
                            text: controller.Listprivacy[index],
                            size: 14.0,
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
          SizedBox(height: 10,),
        ],
      ),
    );
  }else if (id == "refund") {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pengembalian Dana (Refund)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "Untuk Transaksi dengan nomor Handphone, nomor pelanggan, nomor meter, dan nomor telepon tidak valid dan transaksi gagal pada pihak operator, sistem kami akan melakukan auto refund sesuai nominal pembayaran. Anda hanya bisa melakukan refund apabila hal tersebut disebabkan oleh:",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "1. Nomor Handphone, nomor pelanggan, nomor meter, dan nomor telepon tidak valid dan transaksi gagal pada pihak operator.",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "2. Pembayaran semua jenis transaksi di Digital Voucher Indonesia yang tidak sesuai dengan total order.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            "Pengembalian Dana (Refund) Virtual Account",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "Pengembalian dana (refund) virtual account akan dikembalikan ke bank rekening sumber dana saat bertransaksi di Digital Voucher Indonesia. Jangka waktu pengembalian dana 3-7 hari kerja dihitung sejak memperoleh persetujuan dari kami.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  } else {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Frequently Asked Questions (FAQ)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            "Apakah saya bisa mendaftarkan satu nomor hp untuk beberapa email?",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Tidak, satu nomor hp hanya bisa digunakan untuk satu email.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            "Apakah saya bisa menghapus akun Digital Voucher Indonesia saya?",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Anda dapat mengajukan permintaan untuk menghapus akun Digital Voucher Indonesia Anda dengan cara mengirimkan email permintaan penghapusan akun Digital Voucher Indonesia Anda ke care@dvi247.com menggunakan email yang terdaftar di www.dvi247.com.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            "Mengapa akun saya diblokir?",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Di dalam satu akun hanya diperbolehkan menggunakan satu email dan satu nomor hp yang valid. Pemblokiran akun dilakukan atas alasan keamanan data pribadi dan juga data pribadi Anda sebagai pelanggan.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            "Apakah saya harus registrasi akun di Digital Voucher Indonesia?",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Ya. Proses registrasi akun di Digital Voucher Indonesia sangat mudah dan gratis. Detail akun Anda akan disimpan untuk memudahkan transaksi Anda selanjutnya di Digital Voucher Indonesia. Apabila Anda sedang bertransaksi namun belum sempat daftar akun, Anda bisa langsung memasukkan alamat email di kolom yang tersedia. Secara otomatis alamat email Anda akan terdaftar menjadi akun di Digital Voucher Indonesia dan Anda akan dikirimi email notifikasi. Kemudian, selesaikan transaksi yang sedang dilakukan.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            "Bagaimana cara untuk melakukan registrasi di situs Digital Voucher Indonesia?",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Caranya sangat mudah. Anda bisa registrasi akun melalui situs Digital Voucher Indonesia via desktop atau https://www.dvi247.com",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Apabila melalui desktop, registrasi bisa langsung dilakukan dengan mengeklik menu 'Sign Up' pada pojok kanan situs. Masukkan nama, nomor ponsel, alamat email, dan password, lalu klik 'Daftar'.",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Apabila melalui aplikasi, download aplikasi Digital Voucher Indonesia terlebih dulu, kemudian buka aplikasi dan pilih menu 'Register'. Masukkan nama, nomor ponsel, alamat email, dan password, lalu klik 'Register'.",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Anda telah selesai melakukan registrasi dan email konfirmasi akan langsung dikirimkan ke alamat email yang didaftarkan.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            "Saya lupa dengan password akun Digital Voucher Indonesia saya. Bagaimana cara agar saya bisa mendapat password saya kembali?",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Pada situs atau aplikasi Digital Voucher Indonesia, pilih menu 'Sign In', kemudian pilih opsi 'Lupa Password Masuk ke Digital Voucher Indonesia?' yang ada di bagian bawah kotak Sign In. Kemudian, Anda perlu memasukkan alamat email yang Anda gunakan saat registrasi. Anda akan dikirimi email konfirmasi untuk mereset atau mengatur ulang password akun Digital Voucher Indonesia Anda. Masukkan password atau kata sandi baru yang Anda inginkan, kemudian klik 'Ubah Kata Sandi'.",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Text(
            "Bagaimana cara mengganti password akun Digital Voucher Indonesia saya?",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Apabila melalui desktop, silakan klik menu ikon user pada pojok kanan atas situs, lalu pilih menu 'Informasi Akun', kemudian klik menu 'Ubah Password'.",
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "Apabila melalui aplikasi Digital Voucher Indonesia, silakan klik menu ikon pada pojok kanan bawah situs, lalu pilih menu 'Informasi Akun' dan klik 'Edit'. Untuk mengubah password Anda, masukkan password lama Anda ke kolom yang tersedia dan juga password baru yang diinginkan.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
