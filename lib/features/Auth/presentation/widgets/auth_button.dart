import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  const AuthButton({
    super.key, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightGreen.shade800,),
        borderRadius: BorderRadius.circular(15),
        color: Colors.lightGreen.shade700,
      ),
      child: ElevatedButton(
        onPressed: (){}, 
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.lightGreen.shade700,
          fixedSize: Size(double.maxFinite, 60) 
        ) ,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        )
      ),
    );
  }
}