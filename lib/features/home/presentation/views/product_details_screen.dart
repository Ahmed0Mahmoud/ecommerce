import 'package:ecommerce/features/home/presentation/views/widgets/product_screen_body.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel model;
  const ProductDetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ProductScreenBody(model: model,)));
  }
}
