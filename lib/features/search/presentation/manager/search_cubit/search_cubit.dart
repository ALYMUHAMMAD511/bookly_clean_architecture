import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/search/domain/use_cases/search_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitialState());

  final SearchUseCase searchUseCase;

  Future<void> searchBooks(String query) async {

    var result = await searchUseCase.call(query);

    result.fold((failure) {
      emit(
        SearchFailureState(failure.error),
      );
    }, (books) {
      emit(
        SearchSuccessState(books),
      );
    });
  }
}
