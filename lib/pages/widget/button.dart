import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

class ButtonApp {
  static Widget btn({bg, text, textColor, onTap, width}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: bg ?? ColorsApp.red,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Padding(
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
              child: TextApp.label(
                  text: text, color: textColor ?? Colors.white, size: 14.0)),
        ),
      ),
    );
  }

  static Widget buttonNotifikasi(
      {bg, text, textColor, onTap, width, textNotif}) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                    color: ColorsApp.red,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 16, right: 16),
                        child: Icon(
                          MdiIcons.cart,
                          color: Colors.white,
                        )))),
          ),
          textNotif == "" ||
                  textNotif == "0" ||
                  textNotif == 0 ||
                  textNotif == null
              ? SizedBox()
              : CircleAvatar(
                  radius: 10,
                  backgroundColor: ColorsApp.blue,
                  child: TextApp.label(
                      text: textNotif ?? "1", color: Colors.white),
                )
        ],
      ),
    );
  }
}
