import 'package:bookly_ebook_app/core/errors/failures.dart';

import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/home/domain/repos/home_repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/use_cases/use_case.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String>
{
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future <Either<Failure, List<BookEntity>>> call(String param) async
  {
    return await homeRepo.fetchSimilarBooks(category: param);
  }
}