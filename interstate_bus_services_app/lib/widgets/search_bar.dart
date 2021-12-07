import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  // final String text;
  // final ValueChanged<String> onChanged;
  // final String hintText;
  const SearchBar({
    Key? key,
    // required this.text,
    // required this.onChanged,
    // required this.hintText,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final styleActive = TextStyle(color: Colors.black);
    // final styleHint = TextStyle(color: Colors.black54);
    // final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(7),
      child: TextField(
        style: TextStyle(fontSize: 19),
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search),
          // suffixIcon: widget.text.isNotEmpty
          //     ? GestureDetector(
          //         child: Icon(Icons.close, color: style.color),
          //         onTap: () {
          //           controller.clear();
          //           widget.onChanged('');
          //           FocusScope.of(context).requestFocus(FocusNode());
          //         },
          //       )
          //     : null,
          hintText: 'Where do you want to go?',
        ),
      ),
    );
  }
}
