import 'package:bookly_ebook_app/core/errors/failures.dart';
import 'package:bookly_ebook_app/core/utils/use_case.dart';
import 'package:bookly_ebook_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../home/domain/entities/book_entity.dart';

class SearchUseCase extends UseCase<List<BookEntity>, String>{
  final SearchRepo searchRepo;

  SearchUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(String param) async {
    return await searchRepo.searchBooks(query: param);
  }
}
