import 'package:flutter/material.dart';
import 'package:pesawat/shared/theme.dart';
import 'package:pesawat/ui/widgets/custom_text_form_field.dart';

import '../widgets/custom_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tittle() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get\nyour next journey',
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
            const CustomTextFormField(
                tittle: 'Full Name', hintText: 'Your full name'),
            const CustomTextFormField(
                tittle: 'Email Address', hintText: 'Your email address'),
            const CustomTextFormField(
              tittle: 'Password',
              hintText: 'password',
              obsecureText: true,
            ),
            const CustomTextFormField(tittle: 'Hobby', hintText: 'Hobby'),
            CustomButton(
                tittle: 'Get Started',
                margin: const EdgeInsets.only(top: 30, bottom: 30),
                onPress: () {
                  Navigator.pushNamed(context, '/bonus');
                }),
          ],
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
        ],
      )),
    );
  }
}
