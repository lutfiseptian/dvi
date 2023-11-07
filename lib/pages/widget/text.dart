import 'package:digital_voucher_indonesia/assets/colors.dart';
import 'package:flutter/material.dart';

class TextApp {
  static Widget label(
      {required text,
      size,
      color,
      weigh,
      family,
      decoration,
      align,
      letterSpacing,
      height,
      onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign: align ?? TextAlign.left,
        style: TextStyle(
        
          color: color ?? ColorsApp.black,
          decoration: decoration ?? TextDecoration.none,
          fontSize: size ?? 12,
          fontWeight: weigh ?? FontWeight.w500,
          height: height ?? 1.2,
          letterSpacing: letterSpacing ?? 0.5,
        ),
      ),
    );
  }
}
