import '../../../home/domain/entities/book_entity.dart';

abstract class SearchLocalDataSource
{
  List<BookEntity> searchBooks({required String query});
}