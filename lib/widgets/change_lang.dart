import 'package:fal/constants.dart';
import 'package:fal/dictionnary.dart';
import 'package:fal/functions.dart';
import 'package:flutter/material.dart';

class ChangeLang extends StatefulWidget {
  final Function refresh;

  const ChangeLang({Key key, this.refresh}) : super(key: key);

  @override
  ChangeLangState createState() => ChangeLangState();
}

class ChangeLangState extends State<ChangeLang> {
  Locale dropdownValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dropdownValue = lang;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Column(
          children: [
            DropdownButton(
              icon: Icon(Icons.language),
              elevation: 16,
              items: [
                DropdownMenuItem(
                  value: Locale('fr'),
                  child: Text('Français'),
                ),
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('ar'),
                  child: Text('العربية'),
                ),
                DropdownMenuItem(
                  value: Locale('pt'),
                  child: Text('Português'),
                )
              ],
              value: dropdownValue,
              onChanged: (Locale newValue) async {
                this.setState(() {
                  dropdownValue = newValue;
                });
                await setLang(newValue);
                this.widget.refresh();
              },
              style: TextStyle(color: primaryLightColor),
              underline: Container(
                height: 2,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
