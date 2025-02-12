import 'package:flutter/material.dart';

class TextFieldApp extends StatefulWidget {
  const TextFieldApp({
    super.key,
    required this.emailController,
    required this.lableText,
    required this.hintText,
    required this.prefix,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  });

  final TextEditingController emailController;
  final TextInputType textInputType;
  final String lableText;
  final String hintText;
  final IconData prefix;
  final bool obscureText;

  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.emailController,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.lableText,
        prefixIcon: Icon(widget.prefix),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                },
                icon: Icon(widget.obscureText?Icons.visibility : Icons.visibility_off),
              )
            : null,
      ),
    );
  }
}
