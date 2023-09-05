import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String type;

  const CategoryItem({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, padding: EdgeInsets.zero, backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage('assets/images/SmartPhone.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        height: 100,
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                type,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
