import 'package:bookly_ebook_app/core/errors/failures.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo
{
  Future <Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0});
  Future <Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber = 0});
  Future <Either<Failure, List<BookEntity>>> fetchSimilarBooks({required String category});
}