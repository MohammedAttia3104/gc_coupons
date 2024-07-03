import 'package:gc_coupons/core/widgets/quick_share_button.dart';
import 'package:gc_coupons/features/store/presentation/widgets/favourite_store_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/features/store/models/store_data_model.dart';
import 'package:gc_coupons/generated/assets.dart';
import 'package:share_plus/share_plus.dart';

class StoreBar extends StatelessWidget {
  final StoreDataModel storeModel;

  const StoreBar({
    super.key,
    required this.storeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.only(top: 35.h),
        width: MediaQuery.sizeOf(context).width,
        //height: 35.h,
        decoration: const BoxDecoration(
          color: AppColors.kWhiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_sharp),
            ),
            Expanded(
              child: Text(
                storeModel.storeName ?? '',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
            ),
            // const Spacer(),
            //trailing
            FavouriteStoreIconWidget(storeModel: storeModel),
            IconButton(
              onPressed: () async {
                const String appUrl =
                    'https://play.google.com/store/apps/details?id=com.gccoupons&pcampaignid=web_share';
                final String imagePath =
                    await downloadImage(storeModel.storeImage!);

                final List<XFile> files = [XFile(imagePath)];
                final result = await Share.shareXFiles(files,
                    text:
                        (' Hey! Check out ${storeModel.storeName} Coupons & Promo Codes at GC Coupons.\n${storeModel.storeUrl}\nDownload the App: $appUrl'));
                debugPrint(result.toString());
                if (result.status == ShareResultStatus.success) {
                  debugPrint('Thank you for sharing the picture!');
                }
              },
              icon: SvgPicture.asset(
                Assets.assetsIconsShareNodesSolid,
                fit: BoxFit.contain,
                height: 20.h,
                width: 20.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
