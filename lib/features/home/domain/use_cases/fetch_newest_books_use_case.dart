import 'package:bookly_ebook_app/core/errors/failures.dart';
import 'package:bookly_ebook_app/core/utils/use_cases/no_param_use_case.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/home/domain/repos/home_repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>>
{
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future <Either<Failure, List<BookEntity>>> call() async
  {
    return await homeRepo.fetchNewestBooks();
  }
}