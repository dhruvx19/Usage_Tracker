import 'package:flutter/material.dart';

// Custom text field widget with styling
Widget textField({
  required String
      labeltext, 
  required TextInputType
      keyboardtype, 
  required bool
      obscureText, 
  required TextEditingController
      controller, 
}) {
  return Column(
    crossAxisAlignment:
        CrossAxisAlignment.start, 
    children: [
      TextField(
        controller:
            controller, 
        autofocus: false, 
        keyboardType: keyboardtype, 
        obscureText: obscureText, 
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.black),
          labelText: labeltext,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10), 
          ),
        ),
      ),
    ],
  );
}
