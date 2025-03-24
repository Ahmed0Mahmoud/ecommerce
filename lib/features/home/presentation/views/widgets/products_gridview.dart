import 'package:ecommerce/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.7, // Adjust aspect ratio if needed
        ),
        itemBuilder: (context, index) {
          return ProductCard();
        },
        itemCount: 8,
      ),
    );
  }
}
