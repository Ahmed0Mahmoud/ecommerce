import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // IconButton(
          //     onPressed: onPressed, icon: Icon(Icons.arrow_back_outlined,color: Color(0xff1A1A1A),size:30,weight: 5,)),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'NotoSerif',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
