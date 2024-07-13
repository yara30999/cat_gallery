/*
      'adabtability',
      'child_friendly',
      'dog_friendly',
      'stranger_friendly',
      'health_issues',
      'social_needs',
      'shedding_level',
      'affection_level',
      'energy_level',
      'grooming',
      'intelligence',
    */
class CatBreedEntity {
  Weight weight;
  String id;
  String referenceImageId;
  String wikipediaUrl;
  String vetstreetUrl;
  String name;
  String temperament; //الطبع
  String origin;
  String description;
  String lifeSpan;
  //measurments values
  int adaptability;
  int affectionLevel;
  int childFriendly;
  int dogFriendly;
  int energyLevel;
  int grooming;
  int healthIssues;
  int intelligence;
  int sheddingLevel;
  int socialNeeds;
  int strangerFriendly;

  CatBreedEntity({
    required this.weight,
    required this.id,
    required this.name,
    required this.vetstreetUrl,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.wikipediaUrl,
    required this.referenceImageId,
  });
}

class Weight {
  String imperial; //(lbs) 7 to 10 pounds
  String metric; //(kg) 3 to 5 kilograms

  Weight({
    required this.imperial,
    required this.metric,
  });
}
