import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:digital_voucher_indonesia/pages/widget/text.dart';
import 'package:digital_voucher_indonesia/assets/colors.dart';

class TextFieldApp {
  static Widget groupColumn(
      {hintText,
      controller,
      keyBoardType,
      bgColor,
      width,
      title,
      validator,
      onChange,
      format,
      enabled,
      icon,
      isPassword}) {
    return Container(
      width: width ?? MediaQuery.of(Get.context!).size.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextApp.label(
              text: title,
              weigh: FontWeight.w500,
              size: 14.0,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              enabled: enabled ?? true,
              inputFormatters: format,
              keyboardType: keyBoardType ?? TextInputType.text,
              controller: controller,
              decoration: icon == null || icon == ""
                  ? InputDecoration(
                      hintText: hintText ?? "",
                      hintStyle: TextStyle(color: ColorsApp.Secondary),
                      contentPadding: const EdgeInsets.only(
                          left: 15, top: 8, right: 15, bottom: 0),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                        ),
                      ),
                      fillColor: bgColor ?? Colors.transparent,
                      filled: true,
                    )
                  : InputDecoration(
                      // suffixIcon: Suc,
                      prefixIcon: Icon(
                        icon,
                        color: ColorsApp.border,
                      ),
                      hintText: hintText ?? "",
                      hintStyle: TextStyle(color: ColorsApp.Secondary),
                      contentPadding: const EdgeInsets.only(
                          left: 15, top: 8, right: 15, bottom: 0),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                        ),
                      ),
                      fillColor: bgColor ?? Colors.transparent,
                      filled: true,
                    ),
              style: TextStyle(
                color: ColorsApp.blackDefault,
              ),
              validator: validator,
              onChanged: onChange,
            ),
          ],
        ),
      ),
    );
  }

  static Widget groupColumnPassword(
      {hintText,
      controller,
      keyBoardType,
      bgColor,
      width,
      title,
      validator,
      onChange,
      format,
      enabled,
      icon,
      isPassword,
      onTap,
      visble}) {
    return Container(
      width: width ?? MediaQuery.of(Get.context!).size.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextApp.label(
              text: title,
              weigh: FontWeight.w500,
              size: 14.0,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              enabled: enabled ?? true,
              // inputFormatters: format,
              keyboardType: TextInputType.text,
              obscureText: visble,
              controller: controller,
              decoration: icon == null || icon == ""
                  ? InputDecoration(
                      // suffixIcon: InkWell(
                      //     onTap: onTap,
                      //     child: visble == true
                      //         ? Icon(
                      //             Icon.
                      //             color: ColorsApp.Secondary,
                      //           )
                      //         : Icon(
                      //             Iconsax.eye,
                      //             color: ColorsApp.Secondary,
                      //           )),
                      hintText: hintText ?? "",
                      hintStyle: TextStyle(color: ColorsApp.Secondary),
                      contentPadding: const EdgeInsets.only(
                          left: 15, top: 8, right: 15, bottom: 0),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                        ),
                      ),
                      fillColor: bgColor ?? Colors.transparent,
                      filled: true,
                    )
                  : InputDecoration(
                      // suffixIcon: InkWell(
                      //     onTap: onTap,
                      //     child: visble == true
                      //         ? Icon(
                      //             Iconsax.eye_slash,
                      //             color: ColorsApp.Secondary,
                      //           )
                      //         : Icon(
                      //             Iconsax.eye,
                      //             color: ColorsApp.Secondary,
                      //           )),
                      // suffixIcon: Suc,
                      prefixIcon: Icon(
                        icon,
                        color: ColorsApp.border,
                      ),
                      hintText: hintText ?? "",
                      hintStyle: TextStyle(color: ColorsApp.Secondary),
                      contentPadding: const EdgeInsets.only(
                          left: 15, top: 8, right: 15, bottom: 0),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: bgColor ?? ColorsApp.border,
                        ),
                      ),
                      fillColor: bgColor ?? Colors.transparent,
                      filled: true,
                    ),
              style: TextStyle(
                color: ColorsApp.blackDefault,
              ),
              validator: validator,
              onChanged: onChange,
            ),
          ],
        ),
      ),
    );
  }
}
