class CatWithClickEntity {
  final String imageId;
  final String imageUrl;
  final Favorite? favorite;
  final Vote? vote;
  final List<Category>? categories;
  final String? createdAt;

  const CatWithClickEntity({
    required this.imageId,
    required this.imageUrl,
    required this.favorite,
    required this.vote,
    required this.categories,
    required this.createdAt,
  });
}

class Favorite {
  final String id;
  const Favorite({
    required this.id,
  });
}

class Vote {
  final String id;
  final int value;
  const Vote({
    required this.id,
    required this.value,
  });
}

class Category {
  final String id;
  final String name;

  const Category({required this.id, required this.name});
}
