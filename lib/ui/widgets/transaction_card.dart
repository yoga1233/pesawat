import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pesawat/models/transaction_model.dart';

import '../../shared/theme.dart';
import 'booking_detail_items.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // ignore: prefer_const_constructors
      margin: EdgeInsets.only(
        top: 30,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: NetworkImage(transaction.destination.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: regular,
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
                transaction.destination.rating.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              )
            ],
          ),
          // NOTE : Booking details
          const SizedBox(
            height: 20,
          ),
          Text(
            'Booking Details',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BookingDetailsItem(
            tittle: 'Traveler',
            valueText: transaction.amountOfTraveler.toString(),
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            tittle: 'Seat',
            valueText: transaction.selectedSeat,
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            tittle: 'Insurance',
            valueText: transaction.insurance.toString(),
            valueColor: kGreenColor,
          ),
          BookingDetailsItem(
            tittle: 'Refundable',
            valueText: transaction.refundable.toString(),
            valueColor: kRedColor,
          ),
          BookingDetailsItem(
            tittle: 'VAT',
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            tittle: 'Price',
            valueText: NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(transaction.price),
            valueColor: kBlackColor,
          ),
          BookingDetailsItem(
            tittle: 'Grand Total',
            valueText: NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(transaction.grandTotal),
            valueColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
