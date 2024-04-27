import 'dart:convert';
import 'dart:developer';

import 'package:poll_app/core/secrets/app_secrets.dart';
import 'package:poll_app/features/new_poll/data/models/poll_model/datum.dart';
import 'package:http/http.dart' as http;

class FetchPollData {
  Future<List<Datum>> fetchPolls() async {
    const apiUrl = AppSecrets.fetchPollsURL;

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final dynamic jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData != null) {
        final int code = jsonData['code'] ?? 0;

        if (code == 200) {
          final List<dynamic> dataList = jsonData['data'];
          final List<Datum> polls =
              dataList.map((data) => Datum.fromJson(data)).toList();
          return polls;
        } else {
          final String reason = jsonData['reason'] ?? 'Unknown error';
          log('Failed to fetch polls. Reason: $reason');
          return [];
        }
      } else {
        log("Failed to fetch polls. Status code: ${response.statusCode}");
        log("Response: ${response.body}");
        return [];
      }
    } catch (error) {
      log("Error fetching polls: $error");
      return [];
    }
  }
}
