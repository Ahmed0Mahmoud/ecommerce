import 'package:ecommerce/core/utils/app_router.dart';
import 'package:ecommerce/features/home/data/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  final ProductModel model;
  const ProductCard({super.key, required this.model});
  checkUrl(String url){
    final String imageUrl;
    if (url == "https://www.google.com/imgres?q=imagen&imgurl=https%3A%2F%2Fimages.squarespace-cdn.com%2Fcontent%2Fv1%2F66b4c85b196d2a781c6d469c%2F1723123804144-0NHSZVOKX0WZHZ394I05%2FMeanArea_transparent_rostral.png&imgrefurl=https%3A%2F%2Fwww.imagen-project.org%2F&docid=I2dQXbwsj3ZBYM&tbnid=8yCclcgUSrPsEM&vet=12ahUKEwibj9yH6aWMAxVEhP0HHeHmMIgQM3oECFsQAA..i&w=2500&h=1406&hcb=2&ved=2ahUKEwibj9yH6aWMAxVEhP0HHeHmMIgQM3oECFsQAA" ||
        url == "https://placehold.co/600x400" || url == 'https://placeimg.com/640/480/any' ||  url == "https://placehold.co/200x200") {
      imageUrl = "https://media.istockphoto.com/id/1075374570/vector/coming-soon.jpg?s=612x612&w=0&k=20&c=6W1rSRAoJnxtMSi98mGD7LjiXA3xQMotLn8hJnmXjzI=";
    }

    else{
      imageUrl = model.images!.first;
    }
    return imageUrl;
  }
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Approuter.productDetailsViewRoute,extra: model);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 6,
              spreadRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Expanded(
             child: Container(
               alignment: Alignment.center,
                child: Hero(
                  tag: 'hero${model.id}',
                  transitionOnUserGestures: true,
                  child: Image.network(
                    checkUrl(model.images!.first),
                    fit: BoxFit.cover,
                  ),
                ),
                        ),
           ),
            Text(
              model.title?? "empty",
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'NotoSerif',

              ),
            ),
            Text(
              '\$ ${model.price} ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'NotoSerif',
                color: Color(0xff808080),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


