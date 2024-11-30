import 'package:bookly_ebook_app/core/utils/functions/show_snack_bar.dart';
import 'package:bookly_ebook_app/core/widgets/custom_error.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'custom_books_shimmer/custom_books_shimmer_list_view.dart';
import 'featured_books_list_view.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({super.key});

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          books.addAll(state.books);
        }

        if(state is FeaturedBooksPaginationFailureState)
        {
          showSnackBar(context,
            state.error,
            Colors.red,
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState ||
            state is FeaturedBooksPaginationLoadingState ||
            state is FeaturedBooksPaginationFailureState) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksFailureState) {
          return CustomError(error: state.error);
        } else {
          return CustomBooksShimmerListView(
            height: h * 0.276,
            width: w * 0.416,
          );
        }
      },
    );
  }
}
