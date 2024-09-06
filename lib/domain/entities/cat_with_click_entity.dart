class CatWithClickEntity {
  final String imageId;
  final String imageUrl;
  final Favorite? favorite;
  final Vote? vote;
  final List<Category>? categories;
  final String? breedName;
  final DateTime? createdAt;

  const CatWithClickEntity({
    required this.imageId,
    required this.imageUrl,
    this.favorite,
    this.vote,
    this.categories,
    this.createdAt,
    this.breedName,
  });

  CatWithClickEntity copyWith({
    String? imageId,
    String? imageUrl,
    Favorite? favorite,
    Vote? vote,
    List<Category>? categories,
    String? breedName,
    DateTime? createdAt,
  }) {
    return CatWithClickEntity(
      imageId: imageId ?? this.imageId,
      imageUrl: imageUrl ?? this.imageUrl,
      favorite: favorite ?? this.favorite,
      vote: vote ?? this.vote,
      categories: categories ?? this.categories,
      breedName: breedName ?? this.breedName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class Favorite {
  final int id;
  const Favorite({
    required this.id,
  });

  Favorite copyWith({
    int? id,
  }) {
    return Favorite(
      id: id ?? this.id,
    );
  }
}

class Vote {
  final int id;
  final int value;
  const Vote({
    required this.id,
    required this.value,
  });

  Vote copyWith({
    int? id,
    int? value,
  }) {
    return Vote(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }
}

class Category {
  final int id;
  final String name;

  const Category({required this.id, required this.name});

  Category copyWith({
    int? id,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
