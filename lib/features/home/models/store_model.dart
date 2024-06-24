import 'package:equatable/equatable.dart';

class StoreModel extends Equatable {
  final String storeId;
  final String storeUrl;
  final String storeName;
  final String slug;
  final String count;
  final String storeImage;

  const StoreModel({
    required this.storeId,
    required this.storeUrl,
    required this.storeName,
    required this.slug,
    required this.count,
    required this.storeImage,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      storeId: json["store_id"],
      storeUrl: json["store_url"],
      storeName: json["store_name"],
      slug: json["slug"],
      count: json["count"],
      storeImage: json["store_image"],
    );
  }

  @override
  List<Object> get props => [
        storeId,
        storeUrl,
        storeName,
        slug,
        count,
        storeImage,
      ];
}
