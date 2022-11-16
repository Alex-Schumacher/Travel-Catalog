import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_catalog/dummy_data.dart';
import 'package:travel_catalog/presentation/routes/router.gr.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../infrastructure/algorithms.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double getHeight() {
    var image = Image.asset('assets/images/Prague_2.jpg');
    Completer completer = Completer();
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    }));
    return image.height!;
  }

  var currentBackgroundImageUrl = "assets/images/Prague_2.jpg";

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    /*precacheImage(const ExactAssetImage('assets/images/Prague_2.jpg'), context);
    precacheImage(const ExactAssetImage('assets/images/Prague_1.jpg'), context);*/
    // print(getHeight());
    loadImages() {
      precacheImage(
          const ExactAssetImage('assets/images/Prague_2.jpg'), context);
      precacheImage(
          const ExactAssetImage('assets/images/Prague_1.jpg'), context);

      for (var i = 0; i < activities.length; i++) {
        precacheImage(NetworkImage(activities[i].imageUrl), context);
      }
    }

    loadImages();

    return Scaffold(
      body: Stack(
        children: [
          /*Transform.scale(
            scale: h / 2.7,
            child: const Center(child: image),
            children: stack()
          ),*/

          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(currentBackgroundImageUrl),
                    fit: BoxFit.fitHeight)),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: w,
                height: h / 2.5,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.black38,
                ),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(40)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Prague',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          const Text(
                            'A beautiful city in the czech republic',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 20),
                          ),
                          Row(
                            children: [
                              backgroundImageBackground(
                                  w, "assets/images/Prague_1.jpg"),
                              backgroundImageBackground(
                                  w, 'assets/images/Prague_2.jpg'),
                              backgroundImageBackground(
                                  w, 'assets/images/Prague_3.jpg'),
                              backgroundImageBackground(
                                  w, 'assets/images/Prague_4.jpg')
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () => context.router.push(
                                      ActivityRoute(
                                          backgroundImageUrl:
                                              currentBackgroundImageUrl)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: w / 1.5,
                                    height: h / 10,
                                    decoration: const BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: Text(
                                      'plus d\'informations',
                                      style: TextStyle(
                                          fontSize: h / 37,
                                          fontFamily: 'Roboto'),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: InkWell(
                                  onTap: () {
                                    launchMaps(50.08707, 14.41768);
                                  },
                                  child: Container(
                                    height: h / 10,
                                    width: h / 10,
                                    decoration: const BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    child: Icon(
                                      Icons.pin_drop_outlined,
                                      size: h / 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget backgroundImageBackground(double w, String assetPath) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          setState(() {
            currentBackgroundImageUrl = assetPath;
          });
        },
        child: Container(
          height: w / 5,
          width: w / 5,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(assetPath), fit: BoxFit.fill),
              color: Colors.grey,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
        ),
      ),
    );
  }
}

/*Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: h / 5,
                width: w / 5,
                decoration:
                    BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              )
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.search),
                      Text('recherche endroit'),
                      Container(),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: h / 16,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 4),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
              ),
            ),
            Container(
              height: h / 12,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(35))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.airplanemode_active,
                      size: 40,
                    ),
                    Icon(
                      Icons.bookmarks,
                      size: 40,
                    ),
                  ]),
            ),
          ],
        ),
      ]),
    );
  }
}
*/
