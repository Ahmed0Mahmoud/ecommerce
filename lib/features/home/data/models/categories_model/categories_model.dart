class CategoriesModel {
  int? id;
  String? name;
  String? slug;
  String? image;
  DateTime? creationAt;
  DateTime? updatedAt;

  CategoriesModel({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      creationAt:
          json['creationAt'] == null
              ? null
              : DateTime.parse(json['creationAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'slug': slug,
    'image': image,
    'creationAt': creationAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
