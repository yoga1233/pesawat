import 'package:flutter/material.dart';
import 'package:pesawat/models/destination_model.dart';
import 'package:pesawat/shared/theme.dart';

import '../pages/detail_page.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destinations;
  const DestinationTile(this.destinations, {Key? key, r}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(destinations),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        padding: const EdgeInsets.only(
          left: 10,
          right: 24,
        ),
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(
                left: 10,
                right: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(destinations.imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinations.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    destinations.city,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 31,
            ),
            Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.only(
                right: 2,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_star.png'),
                ),
              ),
            ),
            Text(
              destinations.rating.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
