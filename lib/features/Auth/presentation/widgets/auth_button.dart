import 'package:blog_app/core/common/widgets/loading.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  const AuthButton({
    super.key, 
    required this.text, 
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade900,),
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade700,
      ),
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.grey.shade700,
          fixedSize: Size(double.maxFinite, 60) 
        ) ,
        child: isLoading? Loading() : Text(
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