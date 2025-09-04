import 'package:flutter/material.dart';

class BlogViewPage extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const BlogViewPage());
  const BlogViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 85,
        leading: Card(
          color: Colors.grey.shade100,
          shape: CircleBorder(),
          elevation: 0.5,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
