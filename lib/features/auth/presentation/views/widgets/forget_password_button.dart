import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: InkWell(
        onTap: () {},
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forget Password?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff939393),
            ),
          ),
        ),
      ),
    );
  }
}
