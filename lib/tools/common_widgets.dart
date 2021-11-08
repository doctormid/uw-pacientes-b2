import 'package:doctor_profile/extensions/extensions.dart';
import 'package:doctor_profile/tools/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget appBar(String title, context, {bool hasBackBtn = false}) => Row(
      textDirection: TextDirection.rtl,
      children: [
        MaterialButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          minWidth: 30,
          height: 30,
          elevation: 0,
          color: Colors.white10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          child: SvgPicture.asset('images/basket.svg', color: Colors.white, width: 20, height: 20),
        ),
        const SizedBox(width: 5),
        MaterialButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          minWidth: 30,
          height: 30,
          elevation: 0,
          color: Colors.white10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          child: SvgPicture.asset('images/messages.svg', color: Colors.white, width: 20, height: 20),
        ),
        const SizedBox(width: 5),
        MaterialButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          minWidth: 30,
          height: 30,
          elevation: 0,
          color: Colors.white10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          child: SvgPicture.asset('images/bell.svg', color: Colors.white, width: 20, height: 20),
        ),
        const SizedBox(width: 5),
        Expanded(child: Center(child: Text(title, style: titleStyle.copyWith(color: Colors.white)))),
        const SizedBox(width: 5),
        if (hasBackBtn)
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            padding: EdgeInsets.zero,
            minWidth: 30,
            height: 30,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: SvgPicture.asset('images/back.svg', color: Colors.white, width: 24, height: 24),
          ),
      ],
    ).viewPadding(top: 10, left: 16, right: 16, bottom: 10);

Widget searchBar(String hint) => Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: hintStyle,
          prefixIconConstraints: const BoxConstraints(maxHeight: 16, minWidth: 40),
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 5, top: 0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        ),
      ),
    );
