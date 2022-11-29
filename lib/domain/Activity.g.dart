// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      category: $enumDecode(_$CityCategoryEnumMap, json['category']),
      name: json['name'] as String,
      description: json['description'] as String,
      adress: json['adress'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'category': _$CityCategoryEnumMap[instance.category]!,
      'name': instance.name,
      'description': instance.description,
      'adress': instance.adress,
      'imageUrl': instance.imageUrl,
    };

const _$CityCategoryEnumMap = {
  CityCategory.activity: 'activity',
  CityCategory.hotel: 'hotel',
  CityCategory.restaurant: 'restaurant',
};
