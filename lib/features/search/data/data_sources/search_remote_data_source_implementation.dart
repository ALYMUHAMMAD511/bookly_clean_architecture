import 'package:bookly_ebook_app/core/utils/api_service.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/search/data/data_sources/search_remote_data_source.dart';

import '../../../home/data/models/book_model/book_model.dart';

class SearchRemoteDataSourceImplementation extends SearchRemoteDataSource
{
  final ApiService apiService;

  SearchRemoteDataSourceImplementation(this.apiService);

  @override
  Future<List<BookEntity>> searchBooks({required String query}) async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=$query',
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