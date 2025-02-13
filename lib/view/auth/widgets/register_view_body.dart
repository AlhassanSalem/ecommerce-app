import 'package:ecommerce_app/core/extension/extension_context.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/core/widgets/text_field_widget.dart';
import 'package:ecommerce_app/database/controller/user_db_controller.dart';
import 'package:ecommerce_app/models/process_response.dart';
import 'package:ecommerce_app/models/user.dart';
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
        title: const Text(
          'CREATE ACCOUNT',
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
              controller: _nameContoller,
              lableText: 'Name',
              hintText: 'Enter Your Name',
              prefix: Icons.person,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFieldApp(
              controller: _emailContoller,
              lableText: 'Email',
              hintText: 'Enter Your Email',
              prefix: Icons.email,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFieldApp(
              controller: _passwordContoller,
              lableText: 'Password',
              hintText: 'Enter password',
              prefix: Icons.lock,
            ),
            SizedBox(
              height: 16.sp,
            ),
            ElevatedButton(
              onPressed: () => _performRegister(),
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

  void _performRegister() async {
    if (user.isValid) {
      ProcessResponse response = await UserDbController().register(user);
      context.showSnakBar(message: response.message, success: response.success);
      if (response.success) {
        Navigator.pop(context);
      }
    } else {
      context.showSnakBar(message: 'Enter Required Data');
    }
  }

  User get user {
    User user = User();
    user.name = _nameContoller.text;
    user.email = _emailContoller.text;
    user.password = _passwordContoller.text;
    return user;
  }
}
