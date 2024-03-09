import 'package:black_market/presentation/screens/home_screen/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import r'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';

class CurrencyExchangePortraitWidget extends StatelessWidget {
  const CurrencyExchangePortraitWidget({super.key, required this.homeViewModel});

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        homeViewModel.getCurrencyExchangeRate(context);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppMargin.m20.w, vertical: AppMargin.m40.w),
              padding: EdgeInsets.symmetric(vertical: AppPadding.p30.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s20.r),
                  border: Border.all(color: ColorManager.primary)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssets.americaFlag,
                        height: AppSize.s26.h,
                      ),
                      SizedBox(width: AppSize.s10.w),
                      Text(
                        AppStrings.usd,
                        style: getRegularStyle(
                            color: Colors.black, fontSize: FontSize.s24),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              AppStrings.bankPrice,
                              style: getRegularStyle(
                                  color: Colors.black, fontSize: FontSize.s14.sp),
                            ),
                            Text(
                              homeViewModel.currencyExchangePrice?.currency.usdEGP
                                  .toStringAsFixed(2)??"",
                              style: getRegularStyle(
                                  color: Colors.black, fontSize: FontSize.s20.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        color: ColorManager.darkGrey,
                        height: AppSize.s30.h,
                      ),
                      Expanded(
                        child: Column(children: [
                          Text(
                            AppStrings.lastUpdate,
                            style: getRegularStyle(
                                color: Colors.black, fontSize: FontSize.s14.sp),
                          ),
                          Text(
                            Utils().convertTimeStampToDateTimeFormat(homeViewModel
                                .currencyExchangePrice?.dateTimeStamp),
                            overflow: TextOverflow.ellipsis,
                            style: getRegularStyle(
                                color: Colors.grey, fontSize: FontSize.s12.sp),
                          ),
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
