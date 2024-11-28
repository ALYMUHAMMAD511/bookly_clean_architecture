import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../home/presentation/views/widgets/books_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.books,});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) =>
          GestureDetector(
            child: BooksListViewItem(
              image: books[index].image ?? 'https://diybookcovers.com/wp-content/uploads/2023/07/scifi4thumb.jpg',
              books: books[index],
            ),
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kBookDetailsView,
                extra: books[index],
              );
            },
          ),
      separatorBuilder: (context, index) =>
      const SizedBox(
        height: 20,
      ),
      itemCount: books.length,
    );
  }
}
