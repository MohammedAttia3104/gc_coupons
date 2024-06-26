class CategoryModel {
  final String id;
  final String name;
  final String slug;
  final String count;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.count,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      count: json["count"],
    );
  }
}
