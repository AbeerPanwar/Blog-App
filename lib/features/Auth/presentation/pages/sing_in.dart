import 'package:blog_app/features/Auth/presentation/widgets/auth_button.dart';
import 'package:blog_app/features/Auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/Auth/presentation/widgets/glass_box.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 25,),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/core/images/background_image.jpg'),
            fit: BoxFit.cover,  
          ),
        ),
        alignment: Alignment(0, 0.8),
        child: GlassBox(
          width: MediaQuery.of(context).size.width - 50,
          height: 550,
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Log in to manage your blogs',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white54,
                  ),
                ),
                SizedBox(
                  height: 30,
                ), 
                AuthField(
                  hintText: 'Email',
                  suffixIcon: Icon(Icons.email_outlined),
                  controller: emailController,
                ),
                SizedBox(
                  height: 15,
                ),  
                AuthField(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                  controller: passwordController,
                  isPassword: true,
                ),
                SizedBox(
                  height: 30,
                ),
                AuthButton(
                  text: 'Sign In',
                  onTap: (){},
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?  ',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'signUpPage');
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.green.shade800 ,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}