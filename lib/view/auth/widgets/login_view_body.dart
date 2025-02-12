import 'package:ecommerce_app/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOGIN',
          style: Styles.textStyle20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back...',
              style: Styles.textStyle18,
            ),
            Text(
              'Please Enter email and password...',
              style: Styles.textStyle14,
            ),
            SizedBox(
              height: 16.h,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter email',
                labelText: 'Email',
                labelStyle:
                    GoogleFonts.montserrat(fontSize: 12, color: Colors.black),
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 12,
                ),
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
