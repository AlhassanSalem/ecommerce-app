import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/extension/extension_context.dart';
import 'package:ecommerce_app/core/styles.dart';
import 'package:ecommerce_app/core/widgets/text_field_widget.dart';
import 'package:ecommerce_app/database/controller/user_db_controller.dart';
import 'package:ecommerce_app/models/process_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOGIN',
          style: Styles.textStyle18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back...',
              style: Styles.textStyle16,
            ),
            Text(
              'Please Enter email and password...',
              style: Styles.textStyle14,
            ),
            SizedBox(
              height: 16.h,
            ),
            TextFieldApp(
              emailController: _emailController,
              lableText: 'Email',
              hintText: 'Enter Your Email',
              prefix: Icons.email,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFieldApp(
              emailController: _passwordController,
              lableText: 'Password',
              hintText: 'Enter password',
              prefix: Icons.lock,
            ),
            SizedBox(
              height: 16.sp,
            ),
            ElevatedButton(
              onPressed: () => _performLogin(),
              child: Text(
                'LOGIN',
                style: Styles.textStyle14.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: Styles.textStyle14.copyWith(color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register_view');
                  },
                  child: Text(
                    'Create now',
                    style: Styles.textStyle14.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _performLogin() async {
    ProcessResponse response = await UserDbController()
        .login(_emailController.text, _passwordController.text);

    if (response.success) {
      _navigateToHome(); 
    }
    context.showSnakBar(message: response.message, success: response.success);
    
  }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home_view');
  }
}
