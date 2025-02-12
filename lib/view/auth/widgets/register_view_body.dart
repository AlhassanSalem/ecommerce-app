import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/core/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late TextEditingController _nameContoller;
  late TextEditingController _emailContoller;
  late TextEditingController _passwordContoller;

  @override
  void initState() {
    super.initState();
    _nameContoller = TextEditingController();
    _emailContoller = TextEditingController();
    _passwordContoller = TextEditingController();
  }

  @override
  void dispose() {
    _nameContoller.dispose();
    _emailContoller.dispose();
    _passwordContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CREATE ACCOUNT',
          style: Styles.textStyle18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to ecommerce app',
              style: Styles.textStyle16,
            ),
            Text(
              'Please enter required data below...',
              style: Styles.textStyle14,
            ),
            SizedBox(
              height: 16.h,
            ),
            TextFieldApp(
              emailController: _nameContoller,
              lableText: 'Name',
              hintText: 'Enter Your Name',
              prefix: Icons.person,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFieldApp(
              emailController: _emailContoller,
              lableText: 'Email',
              hintText: 'Enter Your Email',
              prefix: Icons.email,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFieldApp(
              emailController: _passwordContoller,
              lableText: 'Password',
              hintText: 'Enter password',
              prefix: Icons.lock,
            ),
            SizedBox(
              height: 16.sp,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'CREATE',
                style: Styles.textStyle14.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
