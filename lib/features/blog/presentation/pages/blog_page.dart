import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const BlogPage());
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 10),
        backgroundColor: Colors.transparent,
        title: Text(
          'Hi, Abeer',
          style: TextStyle(
            fontFamily: 'Funneldisplay',
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Icon(
            CupertinoIcons.person_crop_circle,
            color: Colors.grey.shade900,
            size: 45,
          ),
        ),
        actions: [
          Card(
            color: Colors.grey.shade100,
            shape: CircleBorder(),
            elevation: 0.4,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'addBlogPage');
              },
              icon: Icon(Icons.add_outlined, color: Colors.black, size: 22),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Discover Latest \nBlogs',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'FunnelDisplay',
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
