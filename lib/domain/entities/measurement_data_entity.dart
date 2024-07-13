import '../../generated/l10n.dart';

class IndividualMeasurementBar {
  final int x; // position on x axis.
  final int y; // value on y axis.
  IndividualMeasurementBar({
    required this.x,
    required this.y,
  });
}

class MeasurementDataEntity {
  final int adaptability;
  final int healthIssues;
  final int childFriendly;
  final int dogFriendly;
  final int strangerFriendly;
  final int sheddingLevel;
  final int affectionLevel;
  final int energyLevel;
  final int grooming;
  final int intelligence;
  final int socialNeeds;

  final List<IndividualMeasurementBar> measurementDataBars;
  //must be in the same order of the measurementDataBars
  List<String> get labels => [
        S.current.adabtability,
        S.current.child_friendly,
        S.current.dog_friendly,
        S.current.stranger_friendly,
        S.current.health_issues,
        S.current.social_needs,
        S.current.shedding,
        S.current.affection,
        S.current.energy,
        S.current.grooming,
        S.current.intelligence,
      ];

  MeasurementDataEntity({
    required this.adaptability,
    required this.healthIssues,
    required this.childFriendly,
    required this.dogFriendly,
    required this.strangerFriendly,
    required this.sheddingLevel,
    required this.affectionLevel,
    required this.energyLevel,
    required this.grooming,
    required this.intelligence,
    required this.socialNeeds,
  }) : measurementDataBars = [
          IndividualMeasurementBar(x: 1, y: adaptability),
          IndividualMeasurementBar(x: 2, y: childFriendly),
          IndividualMeasurementBar(x: 3, y: dogFriendly),
          IndividualMeasurementBar(x: 4, y: strangerFriendly),
          IndividualMeasurementBar(x: 5, y: healthIssues),
          IndividualMeasurementBar(x: 6, y: socialNeeds),
          IndividualMeasurementBar(x: 7, y: sheddingLevel),
          IndividualMeasurementBar(x: 8, y: affectionLevel),
          IndividualMeasurementBar(x: 9, y: energyLevel),
          IndividualMeasurementBar(x: 10, y: grooming),
          IndividualMeasurementBar(x: 11, y: intelligence),
        ];
}
