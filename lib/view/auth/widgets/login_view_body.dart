import 'package:ecommerce_app/core/styles.dart';
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
            TextFieldApp(emailController: _emailController, textInputType: TextInputType.emailAddress,),
          ],
        ),
      ),
    );
  }
}

class TextFieldApp extends StatelessWidget {
  const TextFieldApp({
    super.key,
    required this.emailController,
    this.textInputType = TextInputType.text,
  });

  final TextEditingController emailController;
  final TextInputType textInputType ;
 

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      keyboardType: textInputType,
      decoration: const InputDecoration(
        hintText: 'Enter email',
        labelText: 'Email',
      ),
    );
  }
}
