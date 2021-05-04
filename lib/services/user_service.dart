import 'dart:convert';
import 'package:fal/functions.dart';
import 'package:fal/models/expert.dart';
import 'package:fal/models/user.dart';
import 'package:http/http.dart';

class UserServiceWeb {
  String url;

  UserServiceWeb() {
    if (selectedExpert != null) {
      this.url = Expert().fromMap(jsonDecode(selectedExpert)).url;
    } else
      url = null;
  }

  Future<Map<String, dynamic>> who(String token) async {
    if (url == null) return null;
    final uri = Uri.parse(this.url + 'api/me');
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    Response response;
    if ((response = await get(uri, headers: headers)).statusCode == 401)
      return null;
    Map<String, dynamic> map = jsonDecode(response.body);
    return map;
  }

  Future<Map<String, dynamic>> login(String credentials) async {
    if (url == null) return null;
    final uri = Uri.parse(this.url + 'api/login');
    Map<String, String> headers = {'Content-type': 'application/json'};
    Response response;
    if ((response = await post(uri, headers: headers, body: credentials))
            .statusCode ==
        401) {
      print('ok');
      return null;
    }
    Map<String, dynamic> map = jsonDecode(response.body);
    var token = map['access_token'];
    map = await who(map['access_token']);
    user = User().fromMap(map).toStringJson(token: token);
    updateUser(user);
    return map;
  }
}
