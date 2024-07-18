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
  final Weight weight;
  final String id;
  final String referenceImageId;
  final String wikipediaUrl;
  final String vetstreetUrl;
  final String name;
  final String temperament; //الطبع
  final String origin;
  final String description;
  final String lifeSpan;
  //measurments values
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int intelligence;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;

  const CatBreedEntity({
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
  final String imperial; //(lbs) 7 to 10 pounds
  final String metric; //(kg) 3 to 5 kilograms

  const Weight({
    required this.imperial,
    required this.metric,
  });
}
