import 'package:blog_app/core/common/widgets/loading.dart';
import 'package:blog_app/core/common/widgets/show_snackbar.dart';
import 'package:blog_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/Auth/presentation/widgets/auth_button.dart';
import 'package:blog_app/features/Auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/Auth/presentation/widgets/glass_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 25),
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
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if(state is AuthFailure){
                showSnackbar(context, state.message);
              }
            },
            builder: (context, state) {
              if(state is AuthLoading){
                return Loading();
              }

              return Form(
                key: formkey,
                child: Column(
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Log in to manage your blogs',
                      style: TextStyle(fontSize: 16, color: Colors.white54),
                    ),
                    SizedBox(height: 30),
                    AuthField(
                      hintText: 'Name',
                      suffixIcon: Icon(Icons.person),
                      controller: nameController,
                    ),
                    SizedBox(height: 15),
                    AuthField(
                      hintText: 'Email',
                      suffixIcon: Icon(Icons.email_outlined),
                      controller: emailController,
                    ),
                    SizedBox(height: 15),
                    AuthField(
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.visibility_off),
                      controller: passwordController,
                      isPassword: true,
                    ),
                    SizedBox(height: 30),
                    AuthButton(
                      text: 'Sign Up',
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                            AuthSignUp(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?  ',
                          style: TextStyle(color: Colors.white54, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, 'signInPage');
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
