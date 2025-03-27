import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cart_cubit.dart';
import '../../manager/cart_state.dart';
import 'cart_item_card.dart';
import 'custom_appbar.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartAdded) {
          return Column(
            children: [
              CustomAppBar(title: 'My Cart'),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: state.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: CartItemCard(model: state.cartItems[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Divider(thickness: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1A1A),
                          ),
                        ),
                        Text(
                          '\$ ${state.totalPrice}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A1A1A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    MaterialButton(
                      color: Color(0xff3669C9),
                      height: 60,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff3669C9)),
                      ),
                      onPressed: () {
                        // Navigate to Checkout
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Go To Checkout',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_rounded, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is CartFailure) {
          return Center(child: Text('Error loading cart.'));
        } else {
          return Center(
              child: Text(
                'Cart is Empty...',
                style: TextStyle(fontSize: 20),
              ));
        }
      },
    );
  }
}