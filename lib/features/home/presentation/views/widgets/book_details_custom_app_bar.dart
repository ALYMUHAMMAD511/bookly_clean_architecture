import 'package:flutter/material.dart';

class BookDetailsCustomAppBar extends StatelessWidget {
  const BookDetailsCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: ()
      {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.close,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
