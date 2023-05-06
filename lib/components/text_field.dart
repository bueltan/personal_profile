import 'package:flutter/material.dart';

class TextFieldContact extends StatelessWidget {
  const TextFieldContact({
    super.key,
    required this.textController,
    required this.maxLines,
    required this.validator,
    required this.hintText,
    this.autofocus = false,
  });

  final TextEditingController textController;
  final int maxLines;
  final String? Function(String? p1)? validator;
  final String hintText;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      autofocus: autofocus,
      cursorColor: Colors.greenAccent,
      controller: textController,
      maxLines: maxLines,
      validator: validator ,
      style: const TextStyle(
                    shadows: [Shadow(color: Colors.black,blurRadius: 5)],
                      fontSize: 19,
                      fontFamily: "UbuntuMono",
                      color: Colors.white,
                      ),
      decoration:  InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0, horizontal: 20.0),
        hintStyle:TextStyle(color: Colors.white.withOpacity(0.5)) ,
        hintText: hintText,
        
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.deepPurpleAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.greenAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}