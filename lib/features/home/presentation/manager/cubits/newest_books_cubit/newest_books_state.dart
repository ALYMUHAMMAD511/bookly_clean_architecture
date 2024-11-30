part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState
{
  const NewestBooksState();
}

final class NewestBooksInitialState extends NewestBooksState {}

final class NewestBooksLoadingState extends NewestBooksState {}

final class NewestBooksPaginationLoadingState extends NewestBooksState {}

final class NewestBooksSuccessState extends NewestBooksState
{
  final List<BookEntity> books;

  const NewestBooksSuccessState(this.books);
}

final class NewestBooksFailureState extends NewestBooksState
{
  final String error;

  const NewestBooksFailureState(this.error);
}

final class NewestBooksPaginationFailureState extends NewestBooksState
{
  final String error;

  const NewestBooksPaginationFailureState(this.error);
}

