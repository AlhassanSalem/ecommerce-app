import 'package:flutter/material.dart';

class TextFieldApp extends StatefulWidget {
  const TextFieldApp({
    super.key,
    required this.controller,
    required this.lableText,
    required this.hintText,
    required this.prefix,
    this.textInputType = TextInputType.text,
  });

  final TextEditingController controller;
  final TextInputType textInputType;
  final String lableText;
  final String hintText;
  final IconData prefix;

  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isPassword ? !_obscureText : _obscureText,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.lableText,
        prefixIcon: Icon(widget.prefix),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              )
            : null,
      ),
    );
  }

  bool get isPassword => widget.lableText == 'Password';
}
