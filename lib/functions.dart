import 'dictionnary.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslation(String key, String lang) {
  return dictionnary[key][lang];
}

getLang(List<State> body) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  switch (prefs.getString('lang')) {
    case 'fr':
      await prefs.setString('lang', 'fr');
      lang = Locale('fr');
      break;
    case 'en':
      await prefs.setString('lang', 'en');
      lang = Locale('en');
      break;
    case 'ar':
      await prefs.setString('lang', 'ar');
      lang = Locale('ar');
      break;
    case 'pt':
      await prefs.setString('lang', 'pt');
      lang = Locale('pt');
      break;
    default:
      await prefs.setString('lang', 'en');
      lang = Locale('en');
      break;
  }
  for (var item in body) {
    if (item.mounted) item.setState(() {});
  }
}

setLang(Locale newLang) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('lang', newLang.languageCode);
  lang = newLang;
}

updateExperts(List<String> experts) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList("experts", experts);
  experts = prefs.getStringList("experts");
}

List<String> experts = [];

setExperts() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList("experts") != null)
    experts = prefs.getStringList("experts");
}

String selectedExpert = null;

setSelectedExpert() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("selected_expert") != null)
    selectedExpert = prefs.getString("selected_expert");
}

updateSelectedExpert(String expert) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (expert == null)
    await prefs.remove('selected_expert');
  else
    await prefs.setString("selected_expert", expert);
  selectedExpert = expert;
  setSelectedExpert();
}

String user = null;

setUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("user") != null) user = prefs.getString("user");
}

updateUser(String user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (user == null)
    await prefs.remove('user');
  else
    await prefs.setString("user", user);
  user = user;
  setUser();
}

String viewPath() {
  print(selectedExpert);
  if (experts != null && experts.length != 0) {
    if (selectedExpert != null && selectedExpert != 'null') {
      if (user != null && user != 'null') return '/main';
      return '/login';
    }
    return '/select_expert';
  }
  return '/home';
}

refresh(State s) {
  s.setState(() {});
}
