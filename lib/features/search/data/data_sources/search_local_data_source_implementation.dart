import 'package:bookly_ebook_app/constants.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/search/data/data_sources/search_local_data_source.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchLocalDataSourceImplementation extends SearchLocalDataSource
{
  @override
  List<BookEntity> searchBooks({required String query}) {
    var box = Hive.box<BookEntity>(kSearchBox);
    return box.values.toList();
  }

}