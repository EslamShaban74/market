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

class CurrencyExchangeLandscapeWidget extends StatelessWidget {
  const CurrencyExchangeLandscapeWidget(
      {super.key, required this.homeViewModel});

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
            SizedBox(height: AppSize.s30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.americaFlag,
                  height: AppSize.s26,
                ),
                const SizedBox(width: AppSize.s10),
                Text(
                  AppStrings.usd,
                  style: getRegularStyle(
                      color: Colors.black, fontSize: FontSize.s18),
                ),
              ],
            ),
            SizedBox(height: AppSize.s10.h),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppMargin.m20.w, vertical: AppMargin.m10),
              padding: EdgeInsets.symmetric(vertical: AppPadding.p30.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s20.r),
                  border: Border.all(color: ColorManager.primary)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              AppStrings.bankPrice,
                              style: getRegularStyle(
                                  color: Colors.black, fontSize: FontSize.s16),
                            ),
                            Text(
                              homeViewModel
                                  .currencyExchangePrice!.currency.usdEGP
                                  .toStringAsFixed(2),
                              style: getRegularStyle(
                                  color: Colors.black, fontSize: FontSize.s24),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        color: ColorManager.darkGrey,
                        height: AppSize.s50,
                      ),
                      Expanded(
                        child: Column(children: [
                          Text(
                            AppStrings.lastUpdate,
                            style: getRegularStyle(
                                color: Colors.black, fontSize: FontSize.s16),
                          ),
                          Text(
                            Utils().convertTimeStampToDateTimeFormat(
                                homeViewModel
                                    .currencyExchangePrice!.dateTimeStamp),
                            overflow: TextOverflow.ellipsis,
                            style: getRegularStyle(
                                color: Colors.grey, fontSize: FontSize.s16),
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
