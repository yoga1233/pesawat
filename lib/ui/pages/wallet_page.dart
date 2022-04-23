import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth_cubit.dart';
import '../../shared/theme.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthSuccess) {
        return Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            height: 200,
            width: 300,
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/image_card.png'),
                ),
                boxShadow: [
                  BoxShadow(
                      color: kPrimaryColor.withOpacity(0.5),
                      blurRadius: 50,
                      offset: const Offset(0, 10)),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: whiteTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: light,
                            ),
                          ),
                          Text(
                            state.user.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 24,
                      width: 24,
                      margin: const EdgeInsets.only(right: 6),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_plane.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Pay',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 41,
                ),
                Text(
                  'Balance',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                  ),
                ),
                Text(
                  'IDR 280.000.000',
                  style: whiteTextStyle.copyWith(
                    fontSize: 26,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    }));
  }
}
