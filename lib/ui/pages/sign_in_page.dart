import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pesawat/cubit/auth_cubit.dart';
import 'package:pesawat/shared/theme.dart';
import 'package:pesawat/ui/widgets/custom_text_form_field.dart';

import '../widgets/custom_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget tittle() {
      return Container(
        margin: const EdgeInsets.only(top: 60),
        child: Text(
          'Sign In with your\nexisting account',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      return Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            CustomTextFormField(
              tittle: 'Email Address',
              hintText: 'Your email address',
              controller: emailController,
            ),
            CustomTextFormField(
              tittle: 'Password',
              hintText: 'password',
              obsecureText: true,
              controller: passwordController,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.eror),
                    backgroundColor: Colors.amber,
                  ));
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomButton(
                    tittle: 'Get Started',
                    margin: const EdgeInsets.only(top: 30, bottom: 30),
                    onPress: () {
                      context.read<AuthCubit>().signIn(
                          email: emailController.text,
                          password: passwordController.text);
                    });
              },
            ),
          ],
        ),
      );
    }

    tacButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Text(
            'don\'t Have an account? Sign Up',
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          tittle(),
          inputSection(),
          tacButton(),
        ],
      )),
    );
  }
}
