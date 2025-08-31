part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class BlogUpload extends BlogEvent {
  final String userId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  BlogUpload({
    required this.userId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
