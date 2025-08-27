import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AuthButton({
    super.key, 
    required this.text, 
    required this.onTap,
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
        onPressed: onTap, 
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