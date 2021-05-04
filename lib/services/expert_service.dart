import 'dart:convert';
import 'package:fal/functions.dart';
import 'package:http/http.dart';

class ExpertServiceWeb {
  final url = "http://localhost:3000/api/";

  Future<Map<String, dynamic>> who(String token) async {
    final uri = Uri.parse(url + 'me');
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    Response response;
    if ((response = await get(uri, headers: headers)).statusCode == 401)
      return null;
    Map<String, dynamic> map = jsonDecode(response.body);
    return map;
  }

  Future<Map<String, dynamic>> logKey(String key) async {
    final uri = Uri.parse(url + 'logKey');
    Map<String, String> headers = {'Content-type': 'application/json'};
    String json = '{"key": "$key"}';
    Response response;
    if ((response = await post(uri, headers: headers, body: json)).statusCode ==
        401) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(response.body);
    map = await who(map['access_token']);
    experts.add(jsonEncode(map));
    updateExperts(experts);
    return map;
  }

  bool checkExpert(String key) {
    for (var item in experts) {
      if (jsonDecode(item)['key'] == key) return true;
    }
    return false;
  }
}
