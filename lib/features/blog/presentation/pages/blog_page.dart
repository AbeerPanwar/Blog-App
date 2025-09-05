import 'package:blog_app/core/common/widgets/loading.dart';
import 'package:blog_app/core/common/widgets/show_snackbar.dart';
import 'package:blog_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/Auth/presentation/pages/sing_in.dart';
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



  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: Colors.grey.shade900,
              ),
              height: 600,
              width: double.infinity,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 3,
                        width: 35,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      fontFamily: 'funnelDisplay',
                    ),
                  ),
                  Divider(height: 30),
                  Card(
                    color: Colors.green.shade100,
                    shape: CircleBorder(),
                    child: Container(
                      alignment: Alignment(0, 0),
                      height: 80,
                      width: 80,
                      child: Text(
                        state.user.name[0],
                        style: TextStyle(
                          color: Colors.green.shade600,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    state.user.name.toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Card(
                          color: Colors.green.shade100,
                          shape: CircleBorder(),
                          child: Container(
                            alignment: Alignment(0, 0),
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.person,
                              size: 25,
                              color: Colors.green.shade600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Personal Information',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Card(
                      color: Colors.grey.shade800,
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      state.user.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 1),
                                  ],
                                ),
                              ),
                              Divider(color: Colors.grey.shade600),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Email ID',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      state.user.email,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSignOutSuccessFailure) {
                        showSnackbar(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        Loading();
                      }
                      return GestureDetector(
                        onTap: () {
                          context.read<AuthBloc>().add(AuthSignOutRequested());
                          Navigator.pop(context);
                          Navigator.of(context).pushAndRemoveUntil(
                            SignInPage.route(),
                            (route) => false,
                          );
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width - 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                            child: Text(
                              'Sign out',
                              style: TextStyle(
                                color: Colors.green.shade600,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return Text('');
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
    });
    context.read<BlogBloc>().add(BlogGetAllBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 10),
        backgroundColor: Colors.transparent,
        title: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AuthSuccess) {
              final fullName = state.user.name.split(' ');
              return Text(
                'Hey, ${fullName.first}',
                style: TextStyle(
                  fontFamily: 'Funneldisplay',
                  color: Colors.green.shade600,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            return Text('');
          },
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              showBottomSheet();
            },
            child: Icon(
              CupertinoIcons.person_crop_circle,
              color: Colors.grey.shade900,
              size: 55,
            ),
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
                      final revBlogs = state.blogs.reversed.toList();
                      final blog = revBlogs[index];
                      return BlogCard(
                        iconTextColor: Colors.black,
                        iconColor: index == 0
                            ? Colors.green.shade100
                            : Colors.grey.shade400,
                        textColor: index == 0 ? Colors.white : Colors.black,
                        tileTextColor: index == 0 ? Colors.black : Colors.white,
                        tileColor: index == 0
                            ? Colors.green.shade100
                            : Colors.grey.shade800,
                        color: index == 0
                            ? Colors.green.shade700
                            : Colors.grey.shade100,
                        blog: blog,
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
