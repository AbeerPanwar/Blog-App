import 'package:flutter/material.dart';

class BlogAddField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const BlogAddField({super.key, required this.controller, required this.hintText});

  static OutlineInputBorder  _border(width, Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: width,
        ),
        borderRadius: BorderRadius.circular(15),
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.black,),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'FunnelDisplay',
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade700,
        ),
        fillColor: Colors.grey.shade300,
        enabledBorder: _border(1.3, Colors.grey.shade900),
        focusedBorder: _border(2.0, Colors.black,),
      ),
      maxLines: null,
    );
  }
}