import 'package:flutter/material.dart';

class TextFieldApp extends StatefulWidget {
  const TextFieldApp({
    super.key,
    required this.emailController,
    required this.lableText,
    required this.hintText,
    required this.prefix,
    this.textInputType = TextInputType.text,
  });

  final TextEditingController emailController;
  final TextInputType textInputType;
  final String lableText;
  final String hintText;
  final IconData prefix;

  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.emailController,
      obscureText: _obscureText,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.lableText,
        prefixIcon: Icon(widget.prefix),
        suffixIcon: widget.lableText == 'Password'
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
}
