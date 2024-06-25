import 'package:hive/hive.dart';

part 'trending_model.g.dart';

@HiveType(typeId: 1)
class TrendingCoupon {
  @HiveField(0)
  final int couponId;
  @HiveField(1)
  final String couponDesc;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final int storeId;
  @HiveField(5)
  final String imageUrl;
  @HiveField(6)
  final String storeName;
  @HiveField(7)
  final String storeUrl;
  @HiveField(8)
  final List<int> categoryIds;
  @HiveField(9)
  final DateTime expire;
  @HiveField(10)
  final int ctype;
  @HiveField(11)
  final int? exclusive;
  @HiveField(12)
  final int used;
  @HiveField(13)
  final String couponCode;

  TrendingCoupon({
    required this.couponId,
    required this.couponDesc,
    required this.title,
    required this.date,
    required this.storeId,
    required this.imageUrl,
    required this.storeName,
    required this.storeUrl,
    required this.categoryIds,
    required this.expire,
    required this.ctype,
    this.exclusive,
    required this.used,
    required this.couponCode,
  });

  factory TrendingCoupon.fromJson(Map<String, dynamic> json) {
    final List<int> categoryIds = [];
    if (json['category_id'] is String) {
      categoryIds.add(int.parse(json['category_id']));
    } else if (json['category_id'] is List) {
      categoryIds
          .addAll(json['category_id'].map((id) => int.parse(id)).toList());
    }
    return TrendingCoupon(
      couponId: json['coupon_id'],
      couponDesc: json['coupon_desc'],
      title: json['title'],
      date: DateTime.parse(json['date']),
      storeId: json['store_id'],
      imageUrl: json['image_url'],
      storeName: json['store_name'],
      storeUrl: json['store_url'],
      categoryIds: categoryIds,
      expire: DateTime.parse(json['expire']),
      ctype: json['ctype'],
      exclusive: json['exclusive'],
      used: json['used'],
      couponCode: json['coupon_code'],
    );
  }
}
