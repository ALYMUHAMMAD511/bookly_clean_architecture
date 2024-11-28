import '../../../home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource
{
  Future <List<BookEntity>> searchBooks({required String query});
}