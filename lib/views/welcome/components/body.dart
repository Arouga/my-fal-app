import 'package:fal/services/expert_service.dart';
import 'package:fal/widgets/change_lang.dart';
import 'package:fal/dictionnary.dart';
import 'package:fal/functions.dart';
import 'package:flutter/material.dart';
import 'package:fal/widgets/rounded_button.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  final myController = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    getTranslation("welcome_title", lang.languageCode),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: getTranslation(
                                    "register_key_field_label",
                                    lang.languageCode),
                                prefixIcon: Icon(Icons.vpn_key_rounded)),
                            controller: myController,
                            onEditingComplete: () {
                              if (_formKey.currentState.validate()) {
                                keyLog(myController.text);
                              }
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return getTranslation(
                                    "required_field_alert", lang.languageCode);
                              } else if (experts.contains(value)) {
                                return getTranslation(
                                    "register_key_exists", lang.languageCode);
                              } else
                                return null;
                            },
                          ),
                          width: size.width * 0.7,
                        ),
                        SizedBox(height: size.height * 0.05),
                        RoundedButton(
                          text: getTranslation(
                              "validate_button", lang.languageCode),
                          press: () {
                            if (_formKey.currentState.validate()) {
                              keyLog(myController.text);
                            }
                          },
                        ),
                        // RoundedButton(
                        //   text: "DEMO",
                        //   press: () {
                        //     Navigator.pushNamed(context, '/demo');
                        //   },
                        // ),
                      ])),
                  ChangeLang(refresh: () {
                    if (this.mounted) this.setState(() {});
                  })
                ],
              ),
            ),
          ],
        ));
  }

  keyLog(String key) {
    ExpertServiceWeb().logKey(key).then((value) {
      if (value != null) {
        Navigator.pushNamedAndRemoveUntil(context, viewPath(), (e) => false);
      } else
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(key + " is not a valid registration key"),
          backgroundColor: Colors.red,
        ));
    });
  }
}
