class PlanetsModel {
  late int id;
  late String name;
  late String description;
  late String image;
  late String diameter;
  late String weight;
  late String distanceSun;
  late String gravity;
  late String rotation;
  late String translation;
  late String temperature;
  late List<dynamic> satellite;
  late String curiosity;
  late List<dynamic> photos;

  PlanetsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.diameter,
    required this.weight,
    required this.distanceSun,
    required this.gravity,
    required this.rotation,
    required this.translation,
    required this.temperature,
    required this.satellite,
    required this.curiosity,
    required this.photos,
  });

  PlanetsModel.fromJson(Map<String, dynamic> json )
  {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    diameter = json['diameter'];
    weight = json['weight'];
    distanceSun = json['distanceSun'];
    gravity = json['gravity'];
    rotation = json['rotation'];
    translation = json['translation'];
    temperature = json['temperature'];
    satellite = json['satellite'];
    curiosity = json['curiosity'];
    photos = json['photos'];
  }
}
