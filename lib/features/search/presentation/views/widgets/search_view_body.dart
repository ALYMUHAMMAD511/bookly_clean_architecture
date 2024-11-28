import 'package:bookly_ebook_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_ebook_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_ebook_app/features/search/presentation/views/widgets/search_result_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onChanged: (value) {
              BlocProvider.of<SearchCubit>(context).searchBooks(value);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: SearchResultListViewBlocBuilder()
          ),
        ],
      ),
    );
  }
}
