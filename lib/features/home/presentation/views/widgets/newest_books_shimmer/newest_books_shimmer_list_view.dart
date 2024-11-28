import 'package:bookly_ebook_app/features/home/presentation/views/widgets/newest_books_shimmer/newest_books_shimmer_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewestBooksShimmerListView extends StatelessWidget {
  const NewestBooksShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[600]!,
        highlightColor: Colors.grey[400]!,
        child: const NewestBooksShimmerListViewItem(),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: 10,
    );
  }
}
