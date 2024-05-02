import 'package:explorexpert/features/user_auth/presentation/pages/payment_successfull_page.dart';
import 'package:explorexpert/features/user_auth/presentation/widgets/payments_provider_card.dart';
import 'package:flutter/material.dart';

import '../widgets/essentials.dart';

class RoomBookingPage extends StatelessWidget {
  const RoomBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/ExploreXpertTitleAppBar.png',
          height: 25,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/userprofile1.png'),
              radius: 25,
            ),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 25,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PaymentsProviderCard(
                        thumbnailpath: 'assets/images/Visa.png',
                      ),
                      PaymentsProviderCard(
                        thumbnailpath: 'assets/images/Mastercard.png',
                      ),
                      PaymentsProviderCard(
                        thumbnailpath: 'assets/images/Westernunion.png',
                      ),
                      PaymentsProviderCard(
                        thumbnailpath: 'assets/images/GPay.jpg',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width - 30,
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/CreditCard.png'))),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    color: EXColors.primaryDark,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: EXColors.primaryDark)),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add new card',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: EXColors.secondaryLight),
                      ),
                      Icon(
                        Icons.add_circle,
                        color: EXColors.secondaryLight,
                        size: 35,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        surfaceTintColor: EXColors.primaryDark,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 10,
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentSuccessfullPage()),
              );
            },
            color: EXColors.specialDark,
            height: 50,
            mouseCursor: MaterialStateMouseCursor.clickable,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pay Now',
                  style: TextStyle(
                      color: EXColors.secondaryLight,
                      fontSize: 22,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.payments,
                  color: EXColors.specialLight,
                  size: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
