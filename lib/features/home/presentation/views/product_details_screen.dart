import 'package:ecommerce/features/home/presentation/views/widgets/product_screen_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ProductScreenBody()));
  }
}
