import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBooksShimmerListViewItem extends StatelessWidget {
  const CustomBooksShimmerListViewItem({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height ?? h * 0.28,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[600]!,
        highlightColor: Colors.grey[400]!,
        direction: ShimmerDirection.ltr, // Left to right shimmer
        child: Container(
          width: w * 0.4,
          height: h * 0.2,
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}