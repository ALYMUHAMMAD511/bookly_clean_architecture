import 'package:bookly_ebook_app/core/errors/failures.dart';
import 'package:bookly_ebook_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_ebook_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_ebook_app/features/home/domain/repos/home_repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/book_entity.dart';

class HomeRepoImplementation extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplementation({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });


  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBooks();
      if(books.isNotEmpty)
      {
        return right(books);
      }

      books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return (left(
          ServerFailure.fromDioException(e),
        ));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if(books.isNotEmpty)
      {
        return right(books);
      }

      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return (left(
          ServerFailure.fromDioException(e),
        ));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({required String category}) async
  {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchSimilarBooks(category: category);
      if (books.isNotEmpty) {
        return right(books);
      }

      books = await homeRemoteDataSource.fetchSimilarBooks(category: category);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return (left(
          ServerFailure.fromDioException(e),
        ));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}