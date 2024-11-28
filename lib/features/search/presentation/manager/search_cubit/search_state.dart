part of 'search_cubit.dart';

@immutable
abstract class SearchState
{
  const SearchState();
}

final class SearchInitialState extends SearchState {}


final class SearchSuccessState extends SearchState
{
  final List<BookEntity> bookEntity;

  const SearchSuccessState(this.bookEntity);
}

final class SearchFailureState extends SearchState
{
  final String error;

  const SearchFailureState(this.error);
}