import 'package:ecommerce/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model/product_model.dart';
import 'custom_appbar.dart';

class ProductScreenBody extends StatelessWidget {
  final ProductModel model;
  const ProductScreenBody({super.key, required this.model});
  checkUrl(String url){
    final String imageUrl;
    if (url == "https://www.google.com/imgres?q=imagen&imgurl=https%3A%2F%2Fimages.squarespace-cdn.com%2Fcontent%2Fv1%2F66b4c85b196d2a781c6d469c%2F1723123804144-0NHSZVOKX0WZHZ394I05%2FMeanArea_transparent_rostral.png&imgrefurl=https%3A%2F%2Fwww.imagen-project.org%2F&docid=I2dQXbwsj3ZBYM&tbnid=8yCclcgUSrPsEM&vet=12ahUKEwibj9yH6aWMAxVEhP0HHeHmMIgQM3oECFsQAA..i&w=2500&h=1406&hcb=2&ved=2ahUKEwibj9yH6aWMAxVEhP0HHeHmMIgQM3oECFsQAA" ||
        url == "https://placehold.co/600x400" || url == 'https://placeimg.com/640/480/any') {
      imageUrl = "https://media.istockphoto.com/id/1075374570/vector/coming-soon.jpg?s=612x612&w=0&k=20&c=6W1rSRAoJnxtMSi98mGD7LjiXA3xQMotLn8hJnmXjzI=";
    }
    else{
      imageUrl = model.images!.first;
    }
    return imageUrl;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Details'),
        SizedBox(height: 20),
        Center(
            child: Hero(
              tag: 'hero${model.id}',
              transitionOnUserGestures: true,
              child: Container(
              alignment: Alignment.center,
              width: 341,
              height: 350,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image:  NetworkImage(
                  checkUrl(model.images!.first),
                ),fit: BoxFit.cover),
              ),
              ),
            ),
        ),
        SizedBox(height: 20),
        ProductDetails(model: model,),
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
                    '\$ ${model.price}',
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
                    context.read<CartCubit>().AddToCart(model);
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
