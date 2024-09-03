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
}

class Favorite {
  final int id;
  const Favorite({
    required this.id,
  });
}

class Vote {
  final int id;
  final int value;
  const Vote({
    required this.id,
    required this.value,
  });
}

class Category {
  final int id;
  final String name;

  const Category({required this.id, required this.name});
}
