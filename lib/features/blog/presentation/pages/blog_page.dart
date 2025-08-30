import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 10,),
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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.person_alt,
            color: Colors.black,
            size: 30,
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
              icon: Icon(
                Icons.add_outlined,
                color: Colors.black,
                size: 22,
              ),
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
