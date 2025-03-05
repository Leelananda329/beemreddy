import 'package:beems/about_us.dart';
import 'package:beems/constants.dart';
import 'package:beems/contact_us.dart';
import 'package:beems/insurance_request_screen.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'menurow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String screenType = "home";
  String insuranceType = "home";

  void updateScreen(String newScreen,String type) {
    setState(() {
      screenType = newScreen;
      insuranceType=type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Beem's", style: TextStyle(color: Colors.white, fontSize: 20)),
                  Text("Insurance | Investments", style: TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
              MenuRow(updateScreen),
            ],
          ),
        ),
        body: navigateToScreen(),
      ),
    );
  }

  Widget navigateToScreen(){

    print("screenType $screenType");
    if(screenType.toLowerCase()==Constants.home.toLowerCase()){

      return HomeScreen();
    }else if(screenType.toLowerCase()==Constants.contact.toLowerCase()){

      return ContactUs();
    }else if(screenType.toLowerCase()==Constants.aboutUS.toLowerCase()){

      return AboutUS();
    }else{

      return InsuranceRequestScreen(insuranceType);
    }
  }
}
