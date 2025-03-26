
import 'package:ecommerce/features/home/presentation/manager/product_cubit/product_cubit.dart';
import 'package:ecommerce/features/home/presentation/manager/product_cubit/product_states.dart';
import 'package:ecommerce/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state){
        if(state is ProductsSuccess){
          return SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 20,
                childAspectRatio: 0.7, // Adjust aspect ratio if needed
              ),
              itemBuilder: (context, index) {
                return ProductCard(model: state.models[index],);
              },
              itemCount: state.models.length,
            ),
          );
        }
        else if(state is ProductsFailure){
         return SizedBox(
            child: Text(state.errMessage,),
          );
        }
        else {
          return Center(child: CircularProgressIndicator());
        }

      },
    );
  }
}
