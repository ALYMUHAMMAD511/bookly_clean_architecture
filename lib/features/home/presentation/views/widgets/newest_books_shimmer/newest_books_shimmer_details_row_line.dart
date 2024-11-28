import 'package:bookly_ebook_app/features/home/presentation/views/widgets/newest_books_shimmer/newest_books_shimmer_line.dart';
import 'package:flutter/material.dart';

class NewestBooksShimmerDetailsRowLine extends StatelessWidget {
  const NewestBooksShimmerDetailsRowLine({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        NewestBooksShimmerLine(
          width: w * 0.2,
        ),
        const Spacer(),
        NewestBooksShimmerLine(
          width: w * 0.12,
        ),
        SizedBox(
          width: w * 0.02,
        ),
        NewestBooksShimmerLine(
          width: w * 0.12,
        ),
        SizedBox(
          width: w * 0.02,
        ),
      ],
    );
  }
}
