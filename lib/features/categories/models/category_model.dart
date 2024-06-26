class CategoryModel {
  String? id;
  String? name;
  String? slug;
  String? count;

  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.count,
  });

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['count'] = count;
    return map;
  }
}
