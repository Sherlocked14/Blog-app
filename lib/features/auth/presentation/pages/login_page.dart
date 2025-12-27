import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_feild.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
    builder: (context) => const LoginPage(),
  );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child:Form(
          key: formKey,
          child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign up.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            AuthFeild(hintText: 'Email',controller: emailController,),
            SizedBox(height: 20),
            AuthFeild(hintText: 'Password',controller: passwordController,isObscureText: true,),
            SizedBox(height: 20),
            AuthGradientButton(buttonText: "Sign in"),
            SizedBox(height: 20),
            GestureDetector(
              onTap:(){
                Navigator.push(
                  context, 
                  SignupPage.route(),
                  );
              },
              child:RichText(text: TextSpan(
              text:"Don't have an account? ",
              style: Theme.of(context).textTheme.titleMedium,
              children: [TextSpan(
                text: "Sign up",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppPallete.gradient2,
                  fontWeight: FontWeight.bold
                )
              ),
              ]
            ),
            ),)
          ],
        ),)
      ),
    );
  }
}
