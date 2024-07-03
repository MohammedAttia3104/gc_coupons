import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gc_coupons/core/functions/extract_html_body.dart';
import 'package:gc_coupons/features/home/models/coupon_model.dart';
import 'package:gc_coupons/generated/assets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class QuickShareButton extends StatelessWidget {
  final int index;
  final CouponModel couponModel;

  const QuickShareButton({
    super.key,
    required this.index,
    required this.couponModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Hey! Check out this coupon on GC Coupons.
        // Store: Carrefour UAE
        // Description: Redeem up to 60% Off on Consoles + 15 AED Additional Discount
        // Code: SAVING15
        // Download the App:
        const String appUrl =
            'https://play.google.com/store/apps/details?id=com.gccoupons&pcampaignid=web_share';
        final String imagePath = await downloadImage(couponModel.imageUrl);

        final List<XFile> files = [XFile(imagePath)];
        final result = await Share.shareXFiles(files,
            text:
                ('Hey! Check out this coupon on GC Coupons.\nStore: ${couponModel.storeName}\nDescription: ${extractHtmlBody(couponModel.couponDesc )}\nDiscount Code: ${couponModel.couponCode}\nDownload the App: $appUrl'));
        debugPrint(result.toString());
        if (result.status == ShareResultStatus.success) {
          debugPrint('Thank you for sharing the picture!');
        }
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: SvgPicture.asset(
          Assets.assetsIconsShareNodesSolid,
          fit: BoxFit.contain,
          height: 20.h,
          width: 20.w,
        ),
      ),
    );
  }
}

Future<String> downloadImage(String url) async {
  final Dio dio = Dio();

  // Get the application documents directory.
  final Directory directory = await getApplicationDocumentsDirectory();

  // Build the local file path.
  final String filePath = '${directory.path}/${url.split('/').last}';

  // Download the file.
  await dio.download(url, filePath);

  return filePath;
}
