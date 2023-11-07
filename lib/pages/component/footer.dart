import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildFooterItem(String text, String url) {
    return InkWell(
      onTap: () {
        _launchURL(url);
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.of(context).size.width,
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Bantuan',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  // const SizedBox(height: 8),
                  // _buildFooterItem(
                  //   'Ketentuan Umum',
                  //   'https://digitalvoucherindo.id/ketentuan-umum/',
                  // ),
                  // const SizedBox(height: 2),
                  // _buildFooterItem(
                  //   'Registrasi Akun',
                  //   'https://digitalvoucherindo.id/registrasi-akun/',
                  // ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Pembeli',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  // const SizedBox(height: 8),
                  // _buildFooterItem(
                  //   'Pengembalian Dana',
                  //   'https://digitalvoucherindo.id/pengembalian-dana/',
                  // ),
                  // const SizedBox(height: 2),
                  // _buildFooterItem(
                  //   'Cara Pembayaran',
                  //   'https://digitalvoucherindo.id/pembayaran/',
                  // ),
                  // const SizedBox(height: 2),
                  // _buildFooterItem(
                  //   'Ketentuan Refund',
                  //   'https://digitalvoucherindo.id/ketentuan-refund/',
                  // ),
                  // const SizedBox(height: 2),
                  // _buildFooterItem(
                  //   'Produk DVI247',
                  //   'https://digitalvoucherindo.id/produk-dvi247-com',
                  // ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Footer(),
        ),
      ),
    ),
  );
}
