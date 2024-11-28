import 'package:bookly_ebook_app/features/home/presentation/views/widgets/newest_books_shimmer/newest_books_shimmer_details_row_line.dart';
import 'package:bookly_ebook_app/features/home/presentation/views/widgets/newest_books_shimmer/newest_books_shimmer_line.dart';
import 'package:flutter/material.dart';

class NewestBooksShimmerListViewItem extends StatelessWidget {
  const NewestBooksShimmerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: w * 0.22,
          height: h * 0.155,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(
          width: w * 0.05,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewestBooksShimmerLine(
                height: h * 0.02,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              NewestBooksShimmerLine(
                height: h * 0.02,
                width: w * 0.3,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              const NewestBooksShimmerDetailsRowLine(),
            ],
          ),
        ),
      ],
    );
  }
}
