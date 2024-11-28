import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class SearchRepo
{
  Future <Either<Failure, List<BookEntity>>> searchBooks({required String query});
}