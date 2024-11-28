import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, required this.onChanged});

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {

    final TextEditingController searchController = TextEditingController();


    return TextField(
      cursorColor: Colors.white,
      controller: searchController,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search',
        suffixIcon: const Opacity(
          opacity: 0.8,
          child: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 22,
          ),
        ),
        enabledBorder: customOutlineInputBorder(),
        focusedBorder: customOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder ()
  {
   return OutlineInputBorder(
     borderSide: const BorderSide(
       color: Colors.white,
     ),
     borderRadius: BorderRadius.circular(12),
   );
  }

}
