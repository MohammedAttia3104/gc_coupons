import 'package:hive/hive.dart';


part 'store_data_model.g.dart';

@HiveType(typeId: 2)
class StoreDataModel extends HiveObject {
  @HiveField(0)
  final int storeId;
  @HiveField(1)
  final String? storeImage;
  @HiveField(2)
  final String? storeUrl;
  @HiveField(3)
  final String? storeName;
  @HiveField(4)
  final String? slug;
  @HiveField(5)
  final String? count;

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
      storeImage: json["store_image"] as String? ?? json["image_url"] as String?,
      storeUrl: json["store_url"] as String?,
      storeName: json["store_name"] as String?,
      slug: json["slug"] as String?,
      count: json["count"] as String?,
    );
  }
}
