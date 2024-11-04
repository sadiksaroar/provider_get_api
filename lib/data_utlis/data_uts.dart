import 'dart:convert';

import 'package:provider_get_api/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DataUts {
  Future<List<user_model>> getData() async {
    List<user_model> userData = [];

    try {
      var request = http.Request(
          "GET", Uri.parse('https://jsonplaceholder.typicode.com/users'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();

        List<dynamic> data = jsonDecode(rawData);

        data.forEach((element) {
          user_model userModel = user_model.fromJson(element);
          userData.add(userModel);
        });
        return userData;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
