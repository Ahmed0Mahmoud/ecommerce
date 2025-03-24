import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        spacing: 13,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fit Polo T Shirt',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          Row(
            spacing: 6,
            children: [
              Icon(Icons.star, color: Colors.yellow),
              Text(
                '4.0/5',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1A1A1A),
                ),
              ),
              Text(
                '(45 reviews)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff808080),
                ),
              ),
            ],
          ),
          Text(
            'Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff808080),
            ),
          ),
        ],
      ),
    );
  }
}
