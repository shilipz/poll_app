import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:poll_app/core/secrets/app_secrets.dart';
import 'package:poll_app/features/new_poll/data/models/poll_model/datum.dart';

class PostDataRepo {
  Future<Map<String, dynamic>> postData(String topic, String statement,
      List<String>? options, String pollType) async {
    String jsonData = json.encode(Datum(
        topic: topic,
        statement: statement,
        textOptions: options,
        pollType: 'text'));

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      http.Response response = await http.post(
        Uri.parse(AppSecrets.newPollURL),
        headers: headers,
        body: jsonData,
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      int statusCode = responseData['code'];
      // String reason = responseData['reason'];

      if (statusCode == 200) {
        log("Data posted successfully!");
        return {'success': true};
      } else {
        log("Failed to post data. Status code: ${response.statusCode}");
        log("Response: ${response.body}");
        return {'success': false, 'reason': responseData['reason']};
      }
    } catch (error) {
      log("Error posting data: $error");
      return {'success': true};
    }
  }
}
