import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_catalog/domain/category.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailledActivity extends StatelessWidget {
  DetailledActivity({required this.activity, super.key});

  late Activity activity;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var scaleAdd = 0.8;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Circle(
                    scaleAdd: scaleAdd,
                    w: w,
                    backgroundColor: Colors.grey,
                    color: Colors.red,
                    scale: 2.5,
                    alignment: Alignment.topRight,
                    offset: Offset(0, 0)),
                Circle(
                    scaleAdd: scaleAdd,
                    w: w,
                    scale: 4,
                    backgroundColor: Colors.grey,
                    color: Colors.red,
                    alignment: Alignment.bottomLeft,
                    offset: Offset(0, 0)),
                Circle(
                    scaleAdd: scaleAdd,
                    w: w,
                    scale: 1.8,
                    backgroundColor: Colors.grey,
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    offset: Offset(30, 20)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    context.router.pop();
                  },
                  child: Container(
                    width: w / 8,
                    height: w / 8,
                    decoration: const BoxDecoration(
                        boxShadow: [],
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(45))),
                    alignment: Alignment.topCenter,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 5, 0),
                      child: Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Align(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        maxLines: 1,
                        activity.name,
                        style:
                            TextStyle(fontSize: h / 14, fontFamily: 'Roboto'),
                      )),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: h / 3,
                      width: w / 1,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(activity.imageUrl)))),
                ),
                Text(activity.description),
                Text(activity.adress),
              ],
            ),
          ],
        ),
      ),
    );
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
  }) : super(key: key);
  final double scale;
  final double scaleAdd;
  final double w;
  final Color backgroundColor;
  final Color color;
  final Alignment alignment;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Stack(
        children: [
          Transform.translate(
            offset: offset,
            child: Transform.scale(
              scale: scale + scaleAdd,
              child: Container(
                height: w / 4,
                width: w / 4,
                decoration: BoxDecoration(
                    color: backgroundColor, shape: BoxShape.circle),
              ),
            ),
          ),
          Transform.translate(
            offset: offset,
            child: Transform.scale(
              scale: scale,
              child: Container(
                height: w / 4,
                width: w / 4,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
