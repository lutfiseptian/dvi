import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class VoucherController extends GetxController {
  var menus = [
    {
      "name": "Online Game",
      'icon': MdiIcons.playBox,
      "is_active": true,
      "id": "online_gaame"
    },
    {
      "name": "Pulsa Dan Listrik ",
      'icon': Icons.phone_android,
      "is_active": false,
      "id": "pulsa"
    },
    {
      "name": "Resto dan cafe",
      'icon': MdiIcons.food,
      "is_active": false,
      "id": "resto"
    }
  ].obs;
  var menuUmum = [
    {
      "name": "Pengembalian uang",
      "is_active": true,
      "id": "pengembalian_dana"
    },
    {
      "name": "Cara Pembayaran",
      "is_active": false,
      "id": "cara_bayar"
    },
    {
      "name": "Ketentuan Refund",
      "is_active": false,
      "id": "refund"
    }
    ,{
      "name": "Registrasi Akun",
      "is_active": false,
      "id": "registrasi_akun"
    },
    {
      "name": "Produk Biller",
      "is_active": false,
      "id": "produk_biller"
    },
    {
      "name": "Privacy Policy",
      "is_active": false,
      "id": "privacy_policy"
    },
    {
      "name": "Hubungi Kami",
      "is_active": false,
      "id": "hubungi_kami"
    }
  ].obs;
  var vouchers = [
    {
      "name": "call of Duty Mobile",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
    {
      "name": "PUBG Mobile",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
    {
      "name": "Free Fire",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
    {
      "name": "Mobille Legends",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
    {
      "name": "Mobille Legends",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
    {
      "name": "Mobille Legends",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
    {
      "name": "Mobille Legends",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
    {
      "name": "Mobille Legends",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
    {
      "name": "Mobille Legends",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
    {
      "name": "Mobille Legends",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
    {
      "name": "Mobille Legends",
      "nominal": "Rp.175.000",
      "diskon": "Rp.150.000",
      "images": "images/assets/cod.png"
    },
  ].obs;

  var List = [
    'Inovatif: Kami selalu berusaha untuk menciptakan solusi kreatif dan efektif untuk memenuhi kebutuhan pelanggan dan mitra kami.',
    'Terpercaya: Kami selalu menjaga integritas dan profesionalisme dalam setiap transaksi dan interaksi yang kami lakukan.',
    'Peduli: Kami selalu berempati dan menghargai pelanggan dan mitra kami sebagai bagian dari keluarga DVI',
    'Berkembang: Kami selalu belajar dan meningkatkan kualitas diri dan layanan kami agar dapat memberikan nilai tambah bagi semua pihak.'
  ].obs;
  var Listprivacy = [
    'Menyediakan dan memelihara layanan kami.',
    'Menginformasikan Anda tentang perubahan layanan dan pembaruan.',
    'Menanggapi pertanyaan atau permintaan dukungan pelanggan.',
    'Menyediakan informasi terkait produk atau layanan yang mungkin menarik bagi Anda, berdasarkan preferensi yang Anda bagikan.'
  ].obs;
}