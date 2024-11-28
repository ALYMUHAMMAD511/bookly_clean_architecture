import 'package:bookly_ebook_app/core/widgets/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'custom_books_shimmer/custom_books_shimmer_list_view.dart';
import 'featured_books_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccessState)
        {
          return FeaturedBooksListView(books: state.books);
        }
        else if(state is FeaturedBooksFailureState)
          {
            return CustomError(error: state.error);
          }
        else
        {
          return CustomBooksShimmerListView(
            height: h * 0.276,
            width: w * 0.416,
          );
        }
      },
    );
  }
}
