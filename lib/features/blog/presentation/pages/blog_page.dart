import 'package:blog_app/core/common/widgets/loading.dart';
import 'package:blog_app/core/common/widgets/show_snackbar.dart';
import 'package:blog_app/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const BlogPage());
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(BlogGetAllBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 10),
        backgroundColor: Colors.transparent,
        title: Text(
          'Hey, Abeer',
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
            size: 55,
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
            padding: const EdgeInsets.only(right: 80),
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
          BlocConsumer<BlogBloc, BlogState>(
            listener: (context, state) {
              if (state is BlogFailure) {
                return showSnackbar(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is BlogLoading) {
                return Loading();
              }
              if (state is BlogsDisplaySuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.blogs.length,
                    itemBuilder: (context, index) {
                      final blog = state.blogs[index];
                      return BlogCard(
                        color: index % 3 == 0 ? Colors.teal.shade400 : index % 3 == 1 ? Colors.amber.shade700 : Colors.cyan.shade700, 
                        blog: blog
                      );
                    },
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
