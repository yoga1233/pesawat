import 'package:flutter/material.dart';
import 'package:pesawat/cubit/auth_cubit.dart';
import 'package:pesawat/cubit/page_cubit.dart';
import 'package:pesawat/ui/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.eror),
            backgroundColor: Colors.amber,
          ));
        } else if (state is AuthInitial) {
          context.read<PageCubit>().setPage(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-in', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
            child: CustomButton(
                tittle: 'SignOut',
                margin: const EdgeInsets.symmetric(horizontal: 24),
                onPress: () {
                  context.read<AuthCubit>().signOut();
                }));
      },
    );
  }
}
