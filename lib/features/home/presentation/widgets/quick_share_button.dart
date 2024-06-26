import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class QuickShareButton extends StatelessWidget {
  const QuickShareButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(right: 8.0.w),
        child: SvgPicture.asset(
          'assets/icons/share-nodes-solid.svg',
          width: 30.w,
          height: 30.h,
        ),
      ),
    );
  }
}

void shareFiles() async {
  const String appUrl =
      'https://play.google.com/store/apps/details?id=com.gccoupons&pcampaignid=web_share';
  final List<XFile> files = [XFile('path/to/your/file')];
  final result = await Share.shareXFiles(files, text: 'Check out this file!');
  if (result.status == ShareResultStatus.success) {
    debugPrint('Thank you for sharing the picture!');
  }
}
