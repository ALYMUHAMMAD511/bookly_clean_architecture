import 'package:bookly_ebook_app/constants.dart';
import 'package:bookly_ebook_app/core/utils/api_service.dart';
import 'package:bookly_ebook_app/core/utils/functions/cache_books_data.dart';
import 'package:bookly_ebook_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}',
    );

    List<BookEntity> books = getBooksList(data);
    cacheBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science&startIndex=${pageNumber * 10}',
    );

    List<BookEntity> books = getBooksList(data);
    cacheBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=$category',
    );

    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data)
  {
    List<BookEntity> books = [];
    for (var bookMap in data['items'])
    {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
