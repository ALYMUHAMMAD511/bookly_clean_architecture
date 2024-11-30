import 'package:bookly_ebook_app/constants.dart';
import 'package:bookly_ebook_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeLocalDataSourceImplementation extends HomeLocalDataSource
{
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if(startIndex >= length  || endIndex > length)
    {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;
    if(startIndex >= length  || endIndex > length)
    {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}