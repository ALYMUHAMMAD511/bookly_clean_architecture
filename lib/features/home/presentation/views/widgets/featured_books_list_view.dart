import 'package:bookly_ebook_app/core/utils/app_router.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.276,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index)
        {
          return Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: GestureDetector(
              child: CustomBookItem(
                aspectRatio: 0.69 / 1,
                image: books[index].image ?? 'https://diybookcovers.com/wp-content/uploads/2023/07/scifi4thumb.jpg',
              ),
              onTap: () {
                GoRouter.of(context).push(AppRouter.kBookDetailsView,
                  extra: books,
                );
              },
            ),
          );
        },
        itemCount: books.length,
      ),
    );
  }
}
