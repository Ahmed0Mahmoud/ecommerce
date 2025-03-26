import 'package:ecommerce/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/categories_model/categories_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoriesModel catModel;
  final int index;

  const CategoryCard({super.key, required this.catModel, required this.index});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        final categoryCubit = context.read<CategoryCubit>();
        categoryCubit.getCurrecntIndex(index: index);
        print('index = ${categoryCubit.curIndex}');
        context.read<ProductCubit>().getProducts(categoryCubit.curIndex);
      },
      child: IntrinsicWidth(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                catModel.image != null && catModel.image!.isNotEmpty
                    ? catModel.image!
                    : "https://t4.ftcdn.net/jpg/00/81/38/59/360_F_81385977_wNaDMtgrIj5uU5QEQLcC9UNzkJc57xbu.jpg",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xff999999)),
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12,
            ),

            child: Text(
              '  ${catModel.name}  ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
