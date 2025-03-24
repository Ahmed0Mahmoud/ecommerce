import 'package:flutter/material.dart';

class ProductImageDetail extends StatelessWidget {
  const ProductImageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 341,
        height: 350,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/images/tshirt.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
