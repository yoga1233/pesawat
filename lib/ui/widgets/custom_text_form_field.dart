import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String tittle;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  const CustomTextFormField(
      {Key? key,
      required this.tittle,
      required this.hintText,
      this.obsecureText = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tittle,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                hintText: hintText,
                focusColor: kPrimaryColor),
            obscureText: obsecureText,
            cursorColor: kBlackColor,
          ),
        ],
      ),
    );
  }
}
