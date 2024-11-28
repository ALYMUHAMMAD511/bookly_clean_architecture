import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource
{
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchSimilarBooks({required String category});
}