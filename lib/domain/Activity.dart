// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'Activity.g.dart';

enum CityCategory { activity, hotel, restaurant }

@JsonSerializable()
class Activity {
  late CityCategory category;
  late String name;
  late String description;
  late String adress;
  late String imageUrl;

  Activity(
      {required this.category,
      required this.name,
      required this.description,
      required this.adress,
      required this.imageUrl});

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
