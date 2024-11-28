import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/book_details_custom_app_bar.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers:[
        SliverFillRemaining(
          hasScrollBody: false,
          child:  Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BookDetailsCustomAppBar(),
                const SizedBox(
                  height: 36,
                ),
                BookDetailsSection(bookEntity: bookEntity,),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SimilarBooksSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ]
    );
  }
}
