import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState>
{
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitialState());

  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  bool loading = false;

  Future<void> fetchFeaturedBooks() async
  {
    loading = true;
    emit(FeaturedBooksLoadingState());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold((failure){
      loading = false;
      emit(FeaturedBooksFailureState(failure.error));
    }, (books){
      loading = false;
      emit(FeaturedBooksSuccessState(books));
    });
  }
}
