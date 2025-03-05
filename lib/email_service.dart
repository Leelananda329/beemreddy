import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constants.dart';

class EmailService {
  static  String apiKey = Constants.brevoApiKey; // Replace with your Brevo API Key

  static Future<bool> sendEmail({
    required String recipientEmail,
    required String subject,
    required String message,
  }) async {
    const String brevoUrl = "https://api.brevo.com/v3/smtp/email";

    final response = await http.post(
      Uri.parse(brevoUrl),
      headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "api-key": apiKey,
      },
      body: jsonEncode({
        "sender": {"name": "Beem Reddy Insurance Agency", "email": "mbeemreddy@gmail.com"},
        "to": [
          {"email": "MBEEMREDDY@gmail.com", "name": "Recipient"}
        ],
        "subject": subject,
        "htmlContent": "<p>$message</p>",
      }),
    );

    if (response.statusCode == 201) {
      return true; // Email sent successfully
    } else {
      print("Error: ${response.body}");
      return false;
    }
  }
}
