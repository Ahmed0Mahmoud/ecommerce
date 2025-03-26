import 'package:ecommerce/features/home/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel model;
  const ProductDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        spacing: 13,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title ?? "empty",
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
            model.description ?? "empty" , maxLines: 4,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff808080),
              overflow: TextOverflow.ellipsis
            ),
          ),
        ],
      ),
    );
  }
}
