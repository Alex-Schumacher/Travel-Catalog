import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_catalog/domain/Activity.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:travel_catalog/presentation/widget/AnimatedCircle.dart';

import '../../infrastructure/algorithms.dart';

class DetailledActivity extends StatefulWidget {
  DetailledActivity(
      {required this.backgroundImageUrl, required this.activity, super.key});

  late Activity activity;
  late String backgroundImageUrl;

  @override
  State<DetailledActivity> createState() => _DetailledActivityState();
}

class _DetailledActivityState extends State<DetailledActivity> {
  List<Alignment> alignments = [
    const Alignment(-1, -1),
    const Alignment(-1, 0),
    const Alignment(-1, 1),
    const Alignment(0, -1),
    const Alignment(0, 0),
    const Alignment(0, 1),
    const Alignment(1, -1),
    const Alignment(1, 0),
    const Alignment(1, 1)
  ];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    var scaleAdd = 0.8;
    Circle RandomCircle() {
      var index = Random().nextInt(alignments.length);
      var alignment = alignments[index];
      alignments.removeAt(index);
      double alignmentX = Random().nextInt(2) * (Random().nextBool() ? -1 : 1);
      double alignmentY = Random().nextInt(2) * (Random().nextBool() ? -1 : 1);
      /* var alignment = Alignment(alignmentX, alignmentY);*/
      var _scaleAdd = Random().nextDouble() + 0.4;
      var _scale = Random().nextDouble() + Random().nextInt(2) + 1;
      double offsetX = Random().nextInt(20) * (Random().nextBool() ? -1 : 1);
      double offsetY = Random().nextInt(20) * (Random().nextBool() ? -1 : 1);
      var offset = Offset(offsetX, offsetY);
      var duration = Duration(seconds: Random().nextInt(6) + 4);
      var color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

      return Circle(
        scaleAdd: _scaleAdd,
        w: w,
        scale: _scale,
        backgroundColor: Colors.white,
        color: Colors.white70,
        alignment: alignment,
        offset: offset,
        duration: duration,
      );
    }

    return Scaffold(
        body: Stack(children: [
      /*BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              height: h,
              width: w,
            ),
          ),*/

      Stack(
        children: [
          for (int i = 0; i < 8; i++) RandomCircle(),
          Container(
              height: h / 2,
              width: w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.activity.imageUrl)))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: h / 2,
              width: w,
              decoration: BoxDecoration(
                boxShadow: [
                  /*BoxShadow(
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0, -10),
                          color: Colors.black54)*/
                ],
                color: Color.fromARGB(125, 53, 53, 53),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      maxLines: 1,
                      widget.activity.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: h / 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500),
                    ),
                    AutoSizeText(
                      maxLines: 3,
                      widget.activity.description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: h / 25,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    AutoSizeText(
                      maxLines: 2,
                      widget.activity.adress,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: h / 40,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: InkWell(
                        onTap: () {
                          //  launchMaps(50.08707, 14.41768);
                        },
                        child: Container(
                          height: h / 10,
                          width: h / 10,
                          decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Icon(
                            Icons.pin_drop_outlined,
                            size: h / 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.router.pop();
            },
            child: Container(
              width: w / 8,
              height: w / 8,
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white54,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(30))),
              alignment: Alignment.topCenter,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 5, 0),
                child: Icon(Icons.arrow_back_rounded),
              ),
            ),
          ),
        ],
      ),
      /* Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  maxLines: 1,
                  widget.activity.name,
                  style: TextStyle(
                      fontSize: h / 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                )),
          ),
       */
    ]));
  }
}

class Circle extends StatelessWidget {
  const Circle({
    Key? key,
    required this.scaleAdd,
    required this.w,
    required this.scale,
    required this.backgroundColor,
    required this.color,
    required this.alignment,
    required this.offset,
    required this.duration,
  }) : super(key: key);
  final double scale;
  final double scaleAdd;
  final double w;
  final Color backgroundColor;
  final Color color;
  final Alignment alignment;
  final Offset offset;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AnimatedCircle(
        duration: duration,
        child: Stack(
          children: [
            /* Transform.translate(
              offset: offset,
              child: Transform.scale(
                scale: scale + scaleAdd,
                child: Container(
                  height: w / 4,
                  width: w / 4,
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(blurRadius: 2)]),
                ),
              ),
            ),*/
            Transform.translate(
              offset: offset,
              child: Transform.scale(
                scale: scale,
                child: Container(
                  height: w / 4,
                  width: w / 4,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(blurRadius: 4, color: Colors.black26)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
