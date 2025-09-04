import 'dart:io';

import 'package:blog_app/core/common/cubit/app_user_cubit/app_user_cubit.dart';
import 'package:blog_app/core/common/utils/image_picker.dart';
import 'package:blog_app/core/common/widgets/loading.dart';
import 'package:blog_app/core/common/widgets/show_snackbar.dart';
import 'package:blog_app/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/features/blog/presentation/pages/blog_page.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_add_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> selectedCategory = [];
  File? image;

  void uploadBlog() {
    if (formKey.currentState!.validate() &&
        selectedCategory.isNotEmpty &&
        image != null) {
      final userId =
          (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;
      context.read<BlogBloc>().add(
        BlogUpload(
          userId: userId,
          title: titleController.text.trim(),
          content: contentController.text.trim(),
          image: image!,
          topics: selectedCategory,
        ),
      );
    }
  }

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 12),
        leadingWidth: 85,
        backgroundColor: Colors.transparent,
        leading: Card(
          color: Colors.grey.shade100,
          shape: CircleBorder(),
          elevation: 0.5,
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.grey.shade900,
                  title: Text(
                    'Delete',
                    style: TextStyle(
                      fontFamily: 'FunnelDisplay',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  content: Text(
                    'Do you want to discard this blog?',
                    style: TextStyle(
                      fontFamily: 'FunnelDisplay',
                      fontSize: 16,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('No', style: TextStyle(color: Colors.blue)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: Text('Yes', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
        actions: [
          Card(
            color: Colors.grey.shade100,
            shape: CircleBorder(),
            elevation: 0.5,
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.grey.shade900,
                    title: Text(
                      'Upload',
                      style: TextStyle(
                        fontFamily: 'FunnelDisplay',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    content: Text(
                      'Do you want to upload this blog?',
                      style: TextStyle(
                        fontFamily: 'FunnelDisplay',
                        fontSize: 16,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('No', style: TextStyle(color: Colors.blue)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          uploadBlog();
                        },
                        child: Text('Yes', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.done_rounded, color: Colors.black, size: 22),
            ),
          ),
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogFailure) {
            showSnackbar(context, state.error);
          } else if (state is BlogUploadSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              BlogPage.route(),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return Loading();
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    image != null
                        ? GestureDetector(
                            onTap: () {
                              selectImage();
                            },
                            child: SizedBox(
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(20),
                                child: Image.file(image!, fit: BoxFit.cover),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              selectImage();
                            },
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                dashPattern: [15, 4],
                                strokeCap: StrokeCap.round,
                                color: Colors.grey.shade600,
                                radius: Radius.circular(20),
                              ),
                              child: SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.folder_open,
                                      color: Colors.black,
                                      size: 40,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Select your Image',
                                      style: TextStyle(
                                        fontFamily: 'FunnelDisplay',
                                        color: Colors.grey.shade900,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            [
                                  'Technology',
                                  'Buisness',
                                  'Entertainment',
                                  'Programming',
                                  'Pyschological',
                                ]
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (selectedCategory.contains(e)) {
                                          selectedCategory.remove(e);
                                        } else {
                                          selectedCategory.add(e);
                                        }
                                        setState(() {});
                                      },
                                      child: Chip(
                                        backgroundColor:
                                            selectedCategory.contains(e)
                                            ? Colors.green.shade500
                                            : Colors.grey.shade300,
                                        side: selectedCategory.contains(e)
                                            ? null
                                            : BorderSide(
                                                color: Colors.grey.shade600,
                                              ),
                                        label: Text(
                                          e,
                                          style: TextStyle(
                                            fontFamily: 'funnelDisplay',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                    SizedBox(height: 20),
                    BlogAddField(
                      controller: titleController,
                      hintText: 'Blog Title',
                    ),
                    SizedBox(height: 20),
                    BlogAddField(
                      controller: contentController,
                      hintText: 'Blog Content',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
