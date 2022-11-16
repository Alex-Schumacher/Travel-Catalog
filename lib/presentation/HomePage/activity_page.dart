import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:travel_catalog/domain/category.dart';
import 'package:travel_catalog/dummy_data.dart';
import 'package:travel_catalog/presentation/routes/router.gr.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({
    required this.backgroundImageUrl,
    super.key,
  });
  late String backgroundImageUrl;

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

var isSelected = true;
CityCategory category = CityCategory.activity;

List<Activity> selectedActivities = [];

getSelectedActivities() {
  selectedActivities =
      activities.where((activity) => activity.category == category).toList();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    getSelectedActivities();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(widget.backgroundImageUrl),
                      fit: BoxFit.fitHeight)),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                height: h,
                width: w,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: w / 1.1,
                height: h / 1.1,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: h / 1.1,
                width: w / 1.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: h / 33.35),
                      child: Text(
                        'Prague',
                        style:
                            TextStyle(fontSize: h / 20, color: Colors.white70),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h / 33.35),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [CityCategories(w, h)],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap:
                              true, //reduit la hauteur du listView pour juste afficher la hauteur nécéssaire.
                          itemCount: selectedActivities.length,
                          itemBuilder: (context, index) => ActivityCard(
                            backgroundImageUrl: widget.backgroundImageUrl,
                            w: w,
                            h: h,
                            activity: selectedActivities[index],
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder(
                      builder: (context, snapshot) {
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row CityCategories(double w, double h) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CityCategoryWidget(
          w,
          h,
          CityCategory.activity,
          'activités',
          const BorderRadius.only(
              topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
        ),
        CityCategoryWidgetDivider(h: h),
        CityCategoryWidget(w, h, CityCategory.hotel, 'hôtels', null),
        CityCategoryWidgetDivider(h: h),
        CityCategoryWidget(
          w,
          h,
          CityCategory.restaurant,
          'restaurants',
          const BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
        ),
      ],
    );
  }

  InkWell CityCategoryWidget(double w, double h, CityCategory _category,
      String categoryName, BorderRadius? borderRadius) {
    return InkWell(
      onTap: (() {
        setState(() {
          category = _category;
        });
      }),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          width: w / 3.6,
          height: h / 10,
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: category == _category ? Colors.black54 : Colors.white70),
          child: Text(
            categoryName,
            style: TextStyle(
                color: category == _category ? Colors.white : Colors.black),
          )),
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key? key,
    required this.w,
    required this.h,
    required this.activity,
    required this.backgroundImageUrl,
  }) : super(key: key);

  final double w;
  final double h;
  final Activity activity;
  final String backgroundImageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h / 66.7, horizontal: w / 20),
      child: InkWell(
        onTap: () {
          context.router.push(DetailledActivity(
              backgroundImageUrl: backgroundImageUrl, activity: activity));
        },
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          width: w,
          height: h / 10,
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                  width: w / 6,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black38,
                          width: 2.5,
                          style: BorderStyle.solid),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(activity.imageUrl)))),
              Expanded(
                child: Center(
                  child: Text(
                    activity.name,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityCategoryWidgetDivider extends StatelessWidget {
  const CityCategoryWidgetDivider({
    Key? key,
    required this.h,
  }) : super(key: key);

  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h / 10,
      width: 1,
      color: Colors.black54,
    );
  }
}
