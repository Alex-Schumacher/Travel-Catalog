enum CityCategory { activity, hotel, restaurant }

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
}
