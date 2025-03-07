import 'package:beems/contact_us.dart';
import 'package:beems/widget/CustomEditField.dart';
import 'package:beems/widget/header_text.dart';
import 'package:beems/widget/placeholder.dart';
import 'package:beems/widget/text.dart';
import 'package:flutter/material.dart';

import 'Colors/color.dart';
import 'constants.dart';

class AboutUS extends StatefulWidget {
  const AboutUS({super.key});

  @override
  State<AboutUS> createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {


  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: SingleChildScrollView( // Prevents Overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section: About Us Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 30), // Added spacing for better UI

            ContactUs()
            // Section: Contact and Form
          ],
        ),
      ),
    );
  }
}

