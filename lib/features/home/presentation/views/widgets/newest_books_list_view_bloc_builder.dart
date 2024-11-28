import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error.dart';
import '../../manager/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'newest_books_list_view.dart';
import 'newest_books_shimmer/newest_books_shimmer_list_view.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if(state is NewestBooksSuccessState)
        {
          return NewestBooksListView(
            books: state.books,
          );
        }
        else if(state is NewestBooksFailureState)
        {
          return CustomError(error: state.error);
        }
        else
        {
          return const NewestBooksShimmerListView();
        }
      },
    );
  }
}
