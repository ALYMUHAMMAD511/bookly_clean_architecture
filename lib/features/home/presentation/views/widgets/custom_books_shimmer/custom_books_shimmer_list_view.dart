import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../manager/cubits/featured_books_cubit/featured_books_cubit.dart';

class CustomBooksShimmerListView extends StatelessWidget {
  const CustomBooksShimmerListView({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: height,
      child: Shimmer.fromColors(
        enabled: BlocProvider.of<FeaturedBooksCubit>(context).loading,
        baseColor: Colors.grey[600]!,
        highlightColor: Colors.grey[400]!,
        direction: ShimmerDirection.ltr, // Left to right shimmer
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(12),
                ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 15,
          ),
          itemCount: 10, // Simulate 10 loading skeletons
        ),
      ),
    );
  }
}