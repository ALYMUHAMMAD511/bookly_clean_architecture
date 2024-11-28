import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_cases/fetch_newest_books_use_case.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState>
{
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitialState());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  bool loading = false;

  Future<void> fetchNewestBooks() async
  {
    loading = true;
    emit(NewestBooksLoadingState());
    var result = await fetchNewestBooksUseCase.call();

    result.fold((failure){
      loading = false;
      emit(NewestBooksFailureState(failure.error));
    }, (books){
      loading = false;
      emit(NewestBooksSuccessState(books));
    });
  }
}
