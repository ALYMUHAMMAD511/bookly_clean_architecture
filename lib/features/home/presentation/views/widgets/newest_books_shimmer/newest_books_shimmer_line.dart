import 'package:flutter/material.dart';

class NewestBooksShimmerLine extends StatelessWidget {
  const NewestBooksShimmerLine({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: height ?? h * 0.02,
      width: width ?? w * 0.5,
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
