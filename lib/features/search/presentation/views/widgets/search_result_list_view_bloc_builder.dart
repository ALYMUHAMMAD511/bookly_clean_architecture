import 'package:bookly_ebook_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../manager/search_cubit/search_cubit.dart';

class SearchResultListViewBlocBuilder extends StatelessWidget {
  const SearchResultListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessState)
        {
          return SearchResultListView(
            books: state.bookEntity,
          );
        }
        else
        {
          return const Center(
            child: Text(
              'Search for a Book',
              style: Styles.textStyle18,
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}
