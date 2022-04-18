import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pesawat/cubit/page_cubit.dart';

import '../../shared/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String imageUrl;
  final int index;
  const CustomBottomNavigationItem({
    Key? key,
    required this.imageUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kPrimaryColor
                : kGreyColor,
          ),
          Container(
            height: 2,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kTransparanColor,
            ),
          ),
        ],
      ),
    );
  }
}
