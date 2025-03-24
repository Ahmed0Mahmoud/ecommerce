import 'package:flutter/material.dart';

import '../../../data/models/categories_model/categories_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoriesModel catModel;

  const CategoryCard({super.key, required this.catModel});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              catModel.image != null && catModel.image!.isNotEmpty
                  ? catModel.image!
                  : "https://t4.ftcdn.net/jpg/00/81/38/59/360_F_81385977_wNaDMtgrIj5uU5QEQLcC9UNzkJc57xbu.jpg",
            ),            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff999999)),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
          ),

          child: Text(
            '  ${catModel.name}  ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),
          ),
        ),
      ),
    );
  }
}
