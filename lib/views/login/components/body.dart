import 'package:fal/services/user_service.dart';
import 'package:fal/widgets/change_lang.dart';
import 'package:fal/constants.dart';
import 'package:fal/dictionnary.dart';
import 'package:fal/functions.dart';
import 'package:flutter/material.dart';
import 'package:fal/widgets/rounded_button.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  FocusNode passwordFocusNode = new FocusNode();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool hide_password = true;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo.png",
                    height: size.height * 0.25,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    getTranslation("login_title", lang.languageCode),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          child: TextFormField(
                              controller: usernameController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return getTranslation("required_field_alert",
                                      lang.languageCode);
                                }
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value))
                                  return getTranslation(
                                      "invalid_email_alert", lang.languageCode);
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: getTranslation(
                                      "username", lang.languageCode),
                                  prefixIcon: Icon(Icons.person)),
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(passwordFocusNode);
                              }),
                          width: size.width * 0.7,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          child: TextFormField(
                              focusNode: passwordFocusNode,
                              controller: passwordController,
                              obscureText: hide_password,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return getTranslation("required_field_alert",
                                      lang.languageCode);
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: getTranslation(
                                      "password", lang.languageCode),
                                  prefixIcon: Icon(Icons.lock)),
                              onFieldSubmitted: (value) async {
                                if (_formKey.currentState.validate()) {
                                  if (await UserServiceWeb().login(
                                      // '{"email": "${usernameController.text}", "password": "${passwordController.text}"}') !=
                                      // null
                                      '{"email: salma@cdma.ma" , "password: 123"}') != null)
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/main', (route) => false);
                                  else
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          Text("Your credentials are invalid"),
                                      backgroundColor: Colors.red,
                                    ));
                                }
                              }),
                          width: size.width * 0.7,
                        ),
                        SizedBox(height: size.height * 0.05),
                        RoundedButton(
                          text:
                              getTranslation("login_button", lang.languageCode),
                          press: () async {
                            if (_formKey.currentState.validate()) {
                              if (await UserServiceWeb().login(
                                  // '{"email": "${usernameController.text}", "password": "${passwordController.text}"}') !=
                                  // null
                                  '{"email: salma@cdma.ma" , "password: 123"}') != null)
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/main', (route) => false);
                              else
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Your credentials are invalid"),
                                  backgroundColor: Colors.red,
                                ));
                            }
                          },
                        ),
                      ])),
                  RoundedButton(
                    color: primaryLightColor,
                    text: getTranslation(
                        "select_other_expert_button", lang.languageCode),
                    press: () {
                      selectedExpert = 'null';
                      updateSelectedExpert('null');
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/select_expert', (route) => false);
                    },
                  ),
                  ChangeLang(refresh: () {
                    this.setState(() {});
                  })
                ],
              ),
            ),
          ],
        ));
  }
}
