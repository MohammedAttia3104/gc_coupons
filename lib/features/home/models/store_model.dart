import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'store_model.g.dart';

@HiveType(typeId: 0)
class StoreModel extends Equatable {
  @HiveField(0)
  final String storeId;
  @HiveField(1)
  final String storeUrl;
  @HiveField(2)
  final String storeName;
  @HiveField(3)
  final String slug;
  @HiveField(4)
  final String count;
  @HiveField(5)
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
