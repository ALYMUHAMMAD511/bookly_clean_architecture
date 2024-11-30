import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void cacheBooksData(List<BookEntity> books, String boxName)
{
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}