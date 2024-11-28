import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase) : super(SimilarBooksInitialState());

  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoadingState());
    var result = await fetchSimilarBooksUseCase.call(category);

    result.fold(
      (failure) {
        emit(SimilarBooksFailureState(failure.error));
      },
      (books) {
        emit(SimilarBooksSuccessState(books));
      },
    );
  }
}
