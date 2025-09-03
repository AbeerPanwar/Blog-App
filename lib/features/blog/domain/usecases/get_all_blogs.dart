import 'package:blog_app/core/error/faliure.dart';
import 'package:blog_app/core/usecase/use_case.dart';
import 'package:blog_app/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBlogs implements UseCase {
  final BlogRepository blogRepository;
  GetAllBlogs(this.blogRepository);

  @override
  Future<Either<Faliure, dynamic>> call(params) async {
    return await blogRepository.getAllBlogs();
  }
}