import 'package:beems/Colors/color.dart';
import 'package:beems/contact_us.dart';
import 'package:beems/widget/CustomEditField.dart';
import 'package:beems/widget/header_text.dart';
import 'package:beems/widget/placeholder.dart';
import 'package:beems/widget/text.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class InsuranceRequestScreen extends StatefulWidget {

 const InsuranceRequestScreen(this.insuranceType, {super.key});
  final String insuranceType;

  @override
  State<InsuranceRequestScreen> createState() => _InsuranceRequestScreenState();
}

class _InsuranceRequestScreenState extends State<InsuranceRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Added padding to avoid edge issues
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns elements properly
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: getInsuranceImage(widget.insuranceType),
                ),
                const SizedBox(width: 20), // Reduced spacing for better layout
                Expanded( // Prevents overflow
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text left
                    children: [
                     getInsuranceType(widget.insuranceType),
                      const SizedBox(height: 8), // Added spacing
                      getInsuranceDec(widget.insuranceType),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Added spacing
            const ContactUs(),
          ],
        ),
      ),
    );
  }

  Widget getInsuranceImage(String insuranceType) {

    final type = insuranceType.toLowerCase();
    print("insurance type $type");

    if (type == "car") {
      return Image.asset("assets/images/car_insurance.png", width: 500, fit: BoxFit.contain);
    } else if (type == "bike") {
      return Image.asset("assets/images/bike_insurance.png", width: 500, fit: BoxFit.contain);
    } else if (type == "health" || type == "term" ||type == Constants.groupHealthInsurance.toLowerCase() ) {
      return Image.asset("assets/images/health_insurance.png", width: 500, fit: BoxFit.contain);
    } else if (type == Constants.commercialVehicle.toLowerCase()) {
      return Image.asset("assets/images/lorrys.jpg", width: 500, fit: BoxFit.contain);
    } else {
      return const SizedBox.shrink(); // Return an empty widget if no match
    }
  }

 Widget getInsuranceType(String type) {

   if(type.toLowerCase()=="car".toLowerCase()) {
    return HeaderText(Constants.carInsurance);
   } else if(type.toLowerCase()=="bike".toLowerCase()) {
    return HeaderText(Constants.bikeInsuranceHeader);
   }
   else if(type.toLowerCase()=="health".toLowerCase()) {
    return HeaderText(Constants.healthInsuranceHeader);
   }else if(type.toLowerCase()=="term".toLowerCase()) {
     return HeaderText(Constants.termInsurance);
   }else if(type.toLowerCase()==Constants.commercialVehicle.toLowerCase()) {
     return HeaderText(Constants.commercialVehicle);
   }else if(type.toLowerCase()==Constants.groupHealthInsurance.toLowerCase()) {
     return HeaderText(Constants.groupHealthInsurance);
   }else{
     return SizedBox.shrink();
   }
 }

  Widget getInsuranceDec(String type) {

    if(type.toLowerCase()=="car".toLowerCase()) {
      return const CustomText(Constants.carInsuranceDec);
    } else if(type.toLowerCase()=="bike".toLowerCase()) {
      return const CustomText(Constants.bikeInsuranceDec);
    } else if(type.toLowerCase()=="health".toLowerCase()) {
      return const CustomText(Constants.healthInsuranceDec);
    }else if(type.toLowerCase()=="term".toLowerCase()) {
      return const CustomText(Constants.termInsuranceDec);
    }else if(type.toLowerCase()==Constants.commercialVehicle.toLowerCase()) {
      return const CustomText(Constants.commercialVehicleDec);
    }else if(type.toLowerCase()==Constants.groupHealthInsurance.toLowerCase()) {
      return const CustomText(Constants.groupHealthInsuranceDec);
    }else{
      return SizedBox.shrink();
    }
  }
}
