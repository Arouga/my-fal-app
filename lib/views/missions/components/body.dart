import 'package:badges/badges.dart';
import 'package:fal/models/assure.dart';
import 'package:fal/models/mission.dart';
import 'package:fal/models/parallax_card_item.dart';
import 'package:fal/utils/page_transformer.dart';
import 'package:fal/views/missions/components/mission_item.dart';
import 'package:fal/widgets/parallax_cards.dart';
import 'package:flutter/material.dart';

import 'package:fal/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'package:fal/dictionnary.dart';
import 'package:fal/functions.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  final myController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  List<Mission> missionList = [
    new Mission(
        id: "4578745",
        ref: "mission_4578745",
        dateRecep: DateTime.now().toString(),
        assure: new Assure(
            id: "785455",
            nom: "Benchekroun",
            prenom: "Mohamed",
            cin: "EE745569",
            tel: "+212-6 56 45 00 67"),
        vehicule: "Mercedes",
        pointChock: "AVANT",
        dateSinistre: DateTime.now().toString(),
        typeMission: "DC",
        compagnie: "SAHAM",
        prestataire: "xxxx",
        observation: "",
        observationTech: "",
        photosAvant: [],
        photosApres: [],
        photosEnCours: [],
        photosAdverse: []),
  ];

  static List<ParallaxCardItem> parallaxCardItemsList = <ParallaxCardItem>[];
  void addItem(ParallaxCardItem item) {
    parallaxCardItemsList.add(item);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;

      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    dateController.text = "${selectedDate.toLocal()}".split(' ')[0];

    return ListView(
      children: [
        Container(
            height: 120,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              color: primaryColor,
            ),
            child: Column(children: [
              Row(children: [
                SizedBox(width: size.width * 0.06),
                Column(
                  children: [
                    Container(
                      width: size.width * 0.4,
                      child: TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: "Select date",
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.date_range_rounded,
                                color: Colors.white,
                              ),
                              fillColor: Colors.white),
                          controller: dateController,
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            _selectDate(context);
                          },
                          onEditingComplete: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          }),
                    ),
                  ],
                ),
                SizedBox(width: size.width * 0.06),
                Column(
                  children: [
                    Container(
                      width: size.width * 0.4,
                      child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Registration number",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon:
                                Icon(Icons.car_rental, color: Colors.white),
                          ),
                          onTap: () {
                            // FocusScope.of(context).requestFocus(new FocusNode());
                            // _selectDate(context);
                          },
                          onEditingComplete: () {
                            // FocusScope.of(context).requestFocus(new FocusNode());
                          }),
                    )
                  ],
                )
              ]),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Badge(
                            badgeColor: Colors.green,
                            badgeContent: Text('3'),
                            child: Text(
                              "Today       ",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.20,
                  ),
                  Column(children: [
                    TextButton(
                        onPressed: () {},
                        child: Badge(
                          badgeColor: Colors.orangeAccent,
                          badgeContent: Text('25'),
                          child: Text(
                            "Other       ",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ]),
                ],
              )
            ])),
        MissionItemState(mission: missionList.first).build(context),
      ],
    );
  }
  /*@override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(r
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: SizedBox.fromSize(
                    size: Size.fromHeight(500.0),
                    child: PageTransformer(
                      pageViewBuilder: (context, visibilityResolver) {
                        return PageView.builder(
                          controller: PageController(viewportFraction: 0.85),
                          itemCount: parallaxCardItemsList.length,
                          itemBuilder: (context, index) {
                            ParallaxCardItem item =
                                parallaxCardItemsList[index];
                            final pageVisibility =
                                visibilityResolver.resolvePageVisibility(index);

                            return ParallaxCards(
                              item: item,
                              pageVisibility: pageVisibility,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          )),
      bottomNavigationBar: new Stack(
        alignment: new FractionalOffset(.5, 1.0),
        children: [
          new Container(
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              color: primaryColor,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: new FloatingActionButton(
              onPressed: () async {
                _showPicker(context);
              },
              child: new Icon(Icons.camera_enhance_rounded),
            ),
          ),
        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.photo_library,
                        color: Colors.white,
                      ),
                      title: new Text(
                        getTranslation('gallery', lang.languageCode),
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                    ),
                    title: new Text(
                      getTranslation('camera', lang.languageCode),
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    PickedFile image = await ImagePicker.platform
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    this.addItem(new ParallaxCardItem(
        title: "photo test", body: "test", imagePath: image.path));
    refresh(this);
  }

  _imgFromGallery() async {
    PickedFile image = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    this.addItem(new ParallaxCardItem(
        title: "photo test", body: "test", imagePath: image.path));
    refresh(this);
  }*/
}
