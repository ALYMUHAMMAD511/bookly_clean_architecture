import 'package:bookly_ebook_app/features/home/presentation/views/widgets/custom_books_shimmer/custom_books_shimmer_list_view_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem(
      {super.key, required this.aspectRatio, required this.image});

  final double aspectRatio;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, progress) => const CustomBooksShimmerListViewItem(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}