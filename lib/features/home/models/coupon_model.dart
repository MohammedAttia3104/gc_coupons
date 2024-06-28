import 'package:hive/hive.dart';

part 'coupon_model.g.dart';

@HiveType(typeId: 1)
class CouponModel {
  @HiveField(0)
  final String couponId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String couponDesc;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String storeId;
  @HiveField(5)
  final String imageUrl;
  @HiveField(6)
  final String storeName;
  @HiveField(7)
  final String storeUrl;
  @HiveField(8)
  final String categoryId;
  @HiveField(9)
  final String expire;
  @HiveField(10)
  final String ctype;
  @HiveField(11)
  final String? exclusive;
  @HiveField(12)
  final String used;
  @HiveField(13)
  final String couponCode;

  CouponModel({
    required this.couponId,
    required this.title,
    required this.couponDesc,
    required this.date,
    required this.storeId,
    required this.imageUrl,
    required this.storeName,
    required this.storeUrl,
    required this.categoryId,
    required this.expire,
    required this.ctype,
    this.exclusive,
    required this.used,
    required this.couponCode,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    dynamic categoryId;
    if (json["category_id"] is List) {
      categoryId = json["category_id"].join(",");
    } else if (json["category_id"] is String) {
      categoryId = json["category_id"];
    } else {
      categoryId =
          "default_value"; // replace "default_value" with your desired default value
    }

    return CouponModel(
      couponId: json["coupon_id"],
      title: json["title"],
      couponDesc: json["coupon_desc"],
      date: json["date"],
      storeId: json["store_id"],
      imageUrl: json["image_url"],
      storeName: json["store_name"],
      storeUrl: json["store_url"],
      categoryId: categoryId,
      expire: json["expire"],
      ctype: json["ctype"],
      exclusive: json["exclusive"] ?? '0',
      used: json["used"],
      couponCode: json["coupon_code"] ?? '0',
    );
  }
}
