import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 18.0),
      decoration: InputDecoration(
        hoverColor: Colors.white,
        labelText: "Title",
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 2, color: Colors.white, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(29.0),
        ),
      ),
    );
  }
}
