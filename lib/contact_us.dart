import 'dart:convert';

import 'package:beems/constants.dart';
import 'package:beems/widget/CustomEditField.dart';
import 'package:beems/widget/header_text.dart';
import 'package:beems/widget/placeholder.dart';
import 'package:beems/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'Colors/color.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'email_service.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool _isLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns top
        children: [
          Expanded(
            // Ensures the column takes only necessary space
            flex: 1, // Assigns a smaller ratio
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
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: const CustomText(
                            "BeemReddy Insurance Services,H.No: 4-12-918,Auto Sai Nagar,Vanasthalipuram,Opp Rajadhani Hotel, Hyderabad, Telangana, 500070")),
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
                    Image.asset('assets/images/phone.png',
                        color: Colors.green, width: 24, height: 24),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: const CustomText(
                            "9010414599 | 9392947599 | 9440367676")),
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
                    Image.asset('assets/images/email.png',
                        color: Colors.red, width: 24, height: 24),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                        child: CustomText(
                            "MBEEMREDDY@gmail.com | mbeemreddy@yahoo.com")),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 50), // Added spacing
          Expanded(
            // Ensures it takes equal space
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: CustomEditfield("Your Name",
                            controller: nameController)),
                    const SizedBox(width: 20), // Added spacing
                    Expanded(
                        child: CustomEditfield("Email Address",
                            controller: emailController)),
                  ],
                ),
                const SizedBox(height: 20), // Added spacing
                Row(
                  children: [
                    Expanded(
                        child: CustomEditfield("Subject",
                            controller: subjectController)),
                    const SizedBox(width: 20), // Added spacing
                    Expanded(
                        child: CustomEditfield("Phone",
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ])),
                  ],
                ),
                const SizedBox(height: 20), // Added spacing
                CustomEditfield("Write a message",
                    width: 5, controller: messageController),
                const SizedBox(height: 50), // Added spacing
                _isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: 200, // Set the width
                        height: 50, // Set the height
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.primaryColor, // Background color
                            foregroundColor: Colors.white, // Text color
                          ),
                          onPressed: () async {
                            if (Validate()) {
                              // sendEmail();
                              setState(() {
                                _isLoading=true;
                              });
                              String message = """
                                      User Details<br><br>
                                      Name: ${nameController.text}<br>
                                      Email: ${emailController.text}<br>
                                      Subject: ${subjectController.text}<br>
                                      Mobile: ${phoneController.text}<br>
                                      Message: ${messageController.text}<br>
                                      """;
                              print("message $message");
                              bool isSent = await EmailService.sendEmail(
                                recipientEmail: emailController.text.trim(),
                                subject: "Your Insurance Inquiry",
                                message:
                                    " ${message} \n Thank you for reaching out to Beem Reddy Insurance Agency",
                              );

                              if (isSent) {
                                setState(() {
                                  _isLoading=false;
                                });
                                showMessage("Email sent successfully!");
                              } else {
                                showMessage("Failed to send email.");
                                setState(() {
                                  _isLoading=false;
                                });
                              }
                            }
                          },
                          child: const Text('Send'),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendEmail() async {
    setState(() {
      _isLoading = true;
    });
    const serviceID = "Beem's"; // From EmailJS
    const templateID = "Beem's"; // From EmailJS
    const userID = "X9wS4cuzzEfq645t7"; // From EmailJS

    String message =
        "Name : ${nameController.text}\n Email : ${emailController.text}\n Subject : ${subjectController.text}\n Mobile : ${phoneController.text}\n Message : ${messageController.text}\n";
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "service_id": serviceID,
        "template_id": templateID,
        "user_id": userID,
        "template_params": {
          "name": nameController.text,
          "email": emailController.text,
          "message": message,
        },
      }),
    );

    setState(() {
      _isLoading = false;
    });
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email sent successfully!")),
      );
      nameController.text = "";
      subjectController.text = "";
      emailController.text = "";
      messageController.text = "";
      phoneController.text = "";
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to send email.")),
      );
    }
  }

  bool Validate() {
    if (nameController.text.trim().isEmpty) {
      showMessage("Name should not be empty");
      return false;
    } else if (emailController.text.trim().isEmpty) {
      showMessage("Email should not be empty");
      return false;
    } else if (!isValidEmail(emailController.text.trim())) {
      showMessage("Please enter valid email id");
      return false;
    } else if (phoneController.text.trim().isEmpty) {
      showMessage("Phone should not be empty");
      return false;
    } else if (phoneController.text.trim().length != 10) {
      showMessage("Please enter valid mobile number");
      return false;
    } else if (messageController.text.trim().isEmpty) {
      showMessage("message should not be empty");
      return false;
    }
    return true;
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  bool isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
}
