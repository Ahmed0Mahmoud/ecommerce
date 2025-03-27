import 'package:ecommerce/features/home/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model/product_model.dart';


class CartItemCard extends StatelessWidget {
  final ProductModel model;


  const CartItemCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      width: 342,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 3, color: Colors.blueAccent),
      ),
      child: Row(
        spacing: 16,
        children: [
          Image.network(model.images!.first, width: 83, height: 79),
          Expanded(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          model.title ?? "empty",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1A1A1A),
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CartCubit>().RemoveFromCart(model);
                        },
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Size L',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff808080),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$ ${model.price}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1A1A1A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
