import 'package:flutter/material.dart';

class TextFieldPrime extends StatelessWidget {
  TextFieldPrime(
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      required this.hintText,
      required this.iconData,
      this.maxlines,
      this.isPassword = false,
      this.isSuffices = false,
      this.onChange,
      this.iconDataSuffices = Icons.visibility_outlined});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final IconData iconData;
  final bool isSuffices;
  var onChange;
  int? maxlines;

  IconData iconDataSuffices;
  bool isPassword;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return TextFormField(
        maxLines: maxlines,
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        onChanged: onChange ?? (a) {},
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          prefixIcon: Icon(iconData),
          suffixIcon: isSuffices
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                      if (isPassword) {
                        iconDataSuffices = Icons.visibility_off;
                      } else {
                        iconDataSuffices = Icons.visibility_outlined;
                      }
                    });
                  },
                  icon: Icon(iconDataSuffices))
              : null,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText';
          } else {
            if (isPassword) {
              if (controller.text.length < 6) {
                return "password must be more than 6 digits";
              }
            }
          }
          return null;
        },
      );
    });
  }
}
