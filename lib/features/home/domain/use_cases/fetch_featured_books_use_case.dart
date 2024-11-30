// ignore_for_file: avoid_renaming_method_parameters

import 'package:bookly_ebook_app/core/errors/failures.dart';
import 'package:bookly_ebook_app/core/utils/use_case.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/home/domain/repos/home_repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int>
{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future <Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async
  {
    return await homeRepo.fetchFeaturedBooks(
      pageNumber: pageNumber,
    );
  }
}