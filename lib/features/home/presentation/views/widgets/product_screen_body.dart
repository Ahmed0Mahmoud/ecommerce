import 'package:ecommerce/features/home/presentation/views/widgets/product_details.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/product_image_detail.dart';
import 'package:flutter/material.dart';

import 'custom_appbar.dart';

class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Details'),
        SizedBox(height: 20),
        ProductImageDetail(),
        ProductDetails(),
        Spacer(),
        Divider(thickness: 2),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
          child: Row(
            spacing: 20,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808080),
                    ),
                  ),
                  Text(
                    '\$ 1,190',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1A1A1A),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: MaterialButton(
                  color: Color(0xff3669C9),
                  height: 60,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff3669C9)),
                  ),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'added',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.done_outline, color: Colors.green),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Icon(Icons.mail, color: Colors.white),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
