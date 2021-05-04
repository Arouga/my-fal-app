import 'package:badges/badges.dart';
import 'package:fal/models/assure.dart';
import 'package:fal/models/mission.dart';
import 'package:fal/models/parallax_card_item.dart';
import 'package:fal/views/missions/components/mission_item.dart';
import 'package:flutter/material.dart';

import 'package:fal/constants.dart';

class MissionDetails extends StatefulWidget {
  @override
  MissionDetailsState createState() => MissionDetailsState();
}

class MissionDetailsState extends State<MissionDetails> {
  Mission mission = new Mission();
  MissionDetailsState({Key key, this.mission});

  @override
  Widget build(BuildContext context) {
    return Container();
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
