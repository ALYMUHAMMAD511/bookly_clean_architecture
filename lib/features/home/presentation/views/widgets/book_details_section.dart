import 'package:bookly_ebook_app/core/utils/styles.dart';
import 'package:bookly_ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

import 'books_action.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.203,
          ),
          child: CustomBookItem(
            aspectRatio: 0.69 / 1,
            image: bookEntity.image ?? 'https://diybookcovers.com/wp-content/uploads/2023/07/scifi4thumb.jpg',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookEntity.title ?? 'Unknown',
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          bookEntity.author ?? 'Unknown',
          style: Styles.textStyle18.copyWith(
            color: const Color(0XFFB7B6BC),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookEntity.rating ?? 0,
          count: bookEntity.ratingCount ?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: BooksAction(
            bookEntity: bookEntity,
          ),
        ),
      ],
    );
  }
}
