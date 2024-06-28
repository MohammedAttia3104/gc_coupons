class StoreDataModel {
  final int storeId;
  final String storeImage;
  final String storeUrl;
  final String storeName;
  final String slug;
  final String count;

  StoreDataModel({
    required this.storeId,
    required this.storeImage,
    required this.storeUrl,
    required this.storeName,
    required this.slug,
    required this.count,
  });

  factory StoreDataModel.fromJson(Map<String, dynamic> json) {
    return StoreDataModel(
      storeId: json["store_id"],
      storeImage: json["store_image"],
      storeUrl: json["store_url"],
      storeName: json["store_name"],
      slug: json["slug"],
      count: json["count"],
    );
  }
}
