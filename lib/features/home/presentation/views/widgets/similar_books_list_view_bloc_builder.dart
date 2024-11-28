import 'package:bookly_ebook_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error.dart';
import '../../manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'custom_books_shimmer/custom_books_shimmer_list_view.dart';

class SimilarBooksListViewBlocBuilder extends StatelessWidget {
  const SimilarBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if(state is SimilarBooksSuccessState)
        {
          return SimilarBooksListView(
            books: state.bookEntity,
          );
        }
        else if(state is SimilarBooksFailureState)
        {
          return CustomError(error: state.error);
        }
        else
        {
          return CustomBooksShimmerListView(
            height: h * 0.15,
            width: w * 0.2,
          );
        }
      },
    );
  }
}
