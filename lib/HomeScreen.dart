import 'package:beems/widget/header_text.dart';
import 'package:beems/widget/placeholder.dart';
import 'package:beems/widget/text.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns content properly
          children: [
            Stack(
              children: [
                Image.asset("assets/images/sharedimage.jpg",fit:BoxFit.fitWidth, // Fits the width of the container
                width: double.infinity ,
              height: 800,),
                Container(
                  padding:EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 250,left: 10),
                  color: Colors.white,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomePlaceholder("CONTACT WITH US"),
                      const HeaderText("Write a message or call anytime"),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0),
                        child: const CustomePlaceholder("Visit office"),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/gps.png', width: 24, height: 24),
                          SizedBox(width: 10,),
                          Expanded(child: const CustomText("BeemReddy Insurance Services,H.No: 4-12-918,AutoSaiNagar,Vanasthalipuram,Opp Rajadhani Hotel, Hyderabad, Telangana, 500070")),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 1,
                        color: Colors.black45,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0),
                        child: const CustomePlaceholder("Phone"),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/phone.png',color: Colors.green, width: 24, height: 24),
                          SizedBox(width: 10,),
                          Expanded(child: const CustomText("9010414599 | 9392947599 | 9440367676")),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 1,
                        color: Colors.black45,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 34.0),
                        child: const CustomePlaceholder("Email"),
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/email.png',color: Colors.red, width: 24, height: 24),
                          const SizedBox(width: 10,),
                          const Expanded(child: CustomText("MBEEMREDDY@gmail.com | mbeemreddy@yahoo.com")),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/insurance.png",),
                  const SizedBox(width: 100),
                  const Expanded( // Prevents overflow
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text left
                      children: [
                        Text(
                          Constants.aboutUS,
                          softWrap: true,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          Constants.bestInsurance,
                          softWrap: true,
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: double.infinity, // Ensures text does not overflow
                          child: Text(
                            Constants.description,
                            softWrap: true,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

    );

  }
}
