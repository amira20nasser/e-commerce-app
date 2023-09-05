import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onTapAction})
      : super(key: key);
  final String text;
  final VoidCallback onTapAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 90),
      child: InkWell(
        onTap: onTapAction,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
