import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.errorText,
    required this.icons,
    this.obscureText = false,
    this.suffixIcon,
  });
  final TextEditingController textController;
  final String hintText;
  final String errorText;
  final IconData icons;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: TextFormField(
        obscureText: obscureText,
        controller: textController,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: const Color.fromARGB(255, 231, 231, 231),
          hintText: hintText,
          prefixIcon: Icon(
            icons,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(215, 172, 166, 216),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(214, 156, 4, 4),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Color(0xD8DBD7FA),
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
      ),
    );
  }
}
