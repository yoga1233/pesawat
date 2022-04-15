import 'package:flutter/material.dart';
import 'package:pesawat/shared/theme.dart';
import 'package:pesawat/ui/pages/choose_seat_page.dart';
import 'package:pesawat/ui/widgets/custom_button.dart';
import 'package:pesawat/ui/widgets/interest_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget background() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/image_destination1.png',
            ),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            // NOTE : EMBLEM
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 24,
              width: 108,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_emblem.png',
                  ),
                ),
              ),
            ),
            // NOTE : Tittle
            Container(
              margin: const EdgeInsets.only(
                top: 256,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lake Ciliwung',
                          style: whiteTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        Text(
                          'Tangerang',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
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
                    '4.5',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            // NOTE : Descriptions
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: kWhiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE : About
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular, height: 2.6),
                  ),
                  // NOTE : Photo
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Photo',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        margin: const EdgeInsets.only(
                          top: 6,
                          right: 16,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                                image: AssetImage('assets/image_photo1.png'))),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        margin: const EdgeInsets.only(
                          top: 6,
                          right: 16,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                                image: AssetImage('assets/image_photo2.png'))),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        margin: const EdgeInsets.only(
                          top: 6,
                          right: 16,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                                image: AssetImage('assets/image_photo3.png'))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // NOTE: Interest
                  Text(
                    'Interest',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: const [
                      InterestItem(tittle: 'Kids Park'),
                      InterestItem(tittle: 'Honor Bridge'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      InterestItem(tittle: 'City Museum'),
                      InterestItem(tittle: 'Centrall Mall'),
                    ],
                  ),
                ],
              ),
            ),
            // NOTE: Price and Book Button
            Container(
              margin: const EdgeInsets.only(top: 31),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IDR 2.500.000',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'per orang',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    tittle: 'Book Now',
                    margin: const EdgeInsets.all(0),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const ChooseSeat()),
                        ),
                      );
                    },
                    width: 170,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          background(),
          customShadow(),
          content(),
        ],
      ),
    );
  }
}
