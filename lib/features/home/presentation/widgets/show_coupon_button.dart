import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gc_coupons/core/constants/app_colors.dart';
import 'package:gc_coupons/core/constants/app_strings.dart';
import 'package:gc_coupons/core/constants/app_styles.dart';
import 'package:gc_coupons/core/functions/extract_html_body.dart';
import 'package:gc_coupons/core/widgets/custom_fancy_shimmer_image.dart';
import 'package:gc_coupons/core/widgets/custom_rounded_button.dart';
import 'package:gc_coupons/core/widgets/section_rounded_button.dart';
import 'package:gc_coupons/features/home/presentation/controllers/trending_coupons_cubit/trending_coupons_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/html_content.dart';

class ShowCouponButton extends StatelessWidget {
  const ShowCouponButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingCouponsCubit, TrendingCouponsState>(
      builder: (context, state) {
        if (state is TrendingCouponsLoaded) {
          String? descrip =
              extractHtmlBody(state.trendingCoupons[0].couponDesc);

          return SectionRoundedButton(
            title: AppStrings.showCoupon,
            backgroundColor: AppColors.showDealBtnColor,
            borderRadius: 10.0.r,
            buttonWidth: MediaQuery.sizeOf(context).width,
            titleColor: AppColors.kWhiteColor,
            buttonHight: 40.h,
            titleSize: 24.sp,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.65,
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.close,
                                  color: AppColors.kBlackColor,
                                  size: 24.r,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomFancyShimmerImage(
                                imageUrl: state.trendingCoupons[0].imageUrl,
                                onTap: () {},
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Text(
                                  state.trendingCoupons[0].title,
                                  style: TextStyle(
                                    color: AppColors.kBlackColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            AppStrings.description,
                            style: TextStyle(
                              color: AppColors.kBlackColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(
                            color: AppColors.kGreyColor,
                            thickness: 1,
                          ),
                          HtmlContent(
                            htmlData: state.trendingCoupons[0].couponDesc,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SectionRoundedButton(
                            title: '',
                            onTap: () {},
                            backgroundColor: Colors.cyanAccent[400],
                            buttonHight: 50.0.h,
                            buttonWidth: MediaQuery.sizeOf(context).width,
                            borderRadius: 10.0.r,
                            customWidget: SizedBox(
                              height: 50.h,
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    decoration: BoxDecoration(
                                      color: Colors.cyanAccent,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r),
                                        bottomLeft: Radius.circular(10.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        state.trendingCoupons[0].couponCode,
                                        style: TextStyle(
                                          color: AppColors.kBlackColor,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await Clipboard.setData(
                                        ClipboardData(
                                          text: state
                                              .trendingCoupons[0].couponCode,
                                        ),
                                      );
                                      ///Todo : Refactor Later
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Code Copied to Clipboard',
                                            style: AppStyles.style12Nor,
                                          ),
                                        ),
                                      );
                                      // AlertDialog(
                                      //   actions: <Widget>[
                                      //     TextButton(
                                      //       child: Text('OK'),
                                      //       onPressed: () {
                                      //         Navigator.of(context).pop();
                                      //       },
                                      //     ),
                                      //   ],
                                      //   title: Text(
                                      //     'Code Copied to Clipboard',
                                      //     style: AppStyles.style12Nor,
                                      //   ),
                                      //   shape: RoundedRectangleBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(10.r),
                                      //   ),
                                      //   backgroundColor: AppColors.kWhiteColor,
                                      //   actionsAlignment:
                                      //       MainAxisAlignment.center,
                                      // );
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ).w,
                                          child: Icon(
                                            FontAwesomeIcons.copy,
                                            size: 24.r,
                                            color: AppColors.kWhiteColor,
                                          ),
                                        ),
                                        Text(
                                          'Copy',
                                          style: TextStyle(
                                            color: AppColors.kWhiteColor,
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SectionRoundedButton(
                            title:
                                'Visit ${state.trendingCoupons[0].storeName}',
                            backgroundColor: AppColors.appNameColor,
                            borderRadius: 10.0.r,
                            buttonHight: 30.h,
                            buttonWidth: MediaQuery.sizeOf(context).width,
                            titleColor: AppColors.kBlackColor,
                            titleSize: 20.0.sp,
                            onTap: () async {
                              Uri url = Uri.parse(state.trendingCoupons[0].storeUrl);
                              try {
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Could not launch $url'),
                                    ),
                                  );
                                }
                              } catch (e) {
                                // Handle the exception
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('An error occurred while trying to launch $url: $e'),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
