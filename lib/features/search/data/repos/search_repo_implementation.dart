import 'package:bookly_ebook_app/core/errors/failures.dart';
import 'package:bookly_ebook_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../data_sources/search_remote_data_source.dart';

class SearchRepoImplementation extends SearchRepo
{
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImplementation({
    required this.searchRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({required String query}) async
  {
    try {
      List<BookEntity> books;
      books = await searchRemoteDataSource.searchBooks(query: query);
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