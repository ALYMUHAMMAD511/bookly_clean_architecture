import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_cases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase)
      : super(NewestBooksInitialState());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  bool loading = false;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      loading = true;
      emit(NewestBooksLoadingState());
    } else {
      loading = true;
      emit(NewestBooksPaginationLoadingState());
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber);

    result.fold((failure) {
      if (pageNumber == 0) {
        loading = false;
        emit(
          NewestBooksFailureState(failure.error),
        );
      } else {
        loading = false;
        emit(
          NewestBooksPaginationFailureState(failure.error),
        );
      }
    }, (books) {
      loading = false;
      emit(NewestBooksSuccessState(books));
    });
  }
}
