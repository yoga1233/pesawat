import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pesawat/cubit/auth_cubit.dart';
import 'package:pesawat/cubit/destination_cubit.dart';
import 'package:pesawat/cubit/page_cubit.dart';
import 'package:pesawat/cubit/seat_cubit.dart';
import 'package:pesawat/cubit/transaction_cubit.dart';
import 'package:pesawat/ui/pages/bonus_page.dart';
import 'package:pesawat/ui/pages/get_started_page.dart';
import 'package:pesawat/ui/pages/main_page.dart';
import 'package:pesawat/ui/pages/sign_in_page.dart';
import 'package:pesawat/ui/pages/sign_up_page.dart';
import 'package:pesawat/ui/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pesawat/ui/pages/succes_checkout_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/sign-in': (context) => SignInPage(),
          '/success': (context) => const SuccessCheckoutPage(),
        },
      ),
    );
  }
}
