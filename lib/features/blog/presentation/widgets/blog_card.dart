import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/presentation/pages/blog_view_page.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final Color color;
  final Blog blog;
  final Color textColor;
  final Color tileColor;
  final Color tileTextColor;
  final Color iconColor;
  final Color iconTextColor;
  const BlogCard({
    super.key,
    required this.color,
    required this.blog,
    required this.textColor,
    required this.tileColor,
    required this.iconColor,
    required this.tileTextColor,
    required this.iconTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      height: 220,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: blog.topics
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(5),
                          child: Chip(
                            backgroundColor: tileColor,
                            side: null,
                            label: Text(
                              e,
                              style: TextStyle(
                                fontFamily: 'funnelDisplay',
                                fontWeight: FontWeight.bold,
                                color: tileTextColor,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Text(
                blog.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'funnelDisplay',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '~ ${blog.userName}',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'funnelDisplay',
                ),
              ),
              Card(
                color: iconColor,
                shape: CircleBorder(),
                elevation: 0,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context, BlogViewPage.route());
                  },
                  icon: Icon(
                    Icons.arrow_outward_rounded,
                    color: iconTextColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
