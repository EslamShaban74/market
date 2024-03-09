import 'package:black_market/presentation/screens/home_screen/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import r'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils.dart';
import '../../resources/colors_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';

class GoldPricesLandscapeWidget extends StatelessWidget {
  const GoldPricesLandscapeWidget({super.key, required this.homeViewModel});

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        homeViewModel.getGoldPrices(context);
      },
      child: Column(
        children: [
          SizedBox(height: AppSize.s14.h),
          Text(
            AppStrings.goldPricesInEgypt,
            style: getBoldStyle(color: Colors.amber, fontSize: FontSize.s20),
          ),
          SizedBox(height: AppSize.s8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${AppStrings.lastUpdate} : ",
                style: getBoldStyle(color: Colors.grey, fontSize: FontSize.s12),
              ),
              Text(
                Utils().convertTimeStampToDateTimeFormat(
                    homeViewModel.goldPrice!.timestamp),
                style: getBoldStyle(color: Colors.grey, fontSize: FontSize.s12),
              ),
            ],
          ),
          SizedBox(height: AppSize.s10.h),
          Expanded(
            child: GridView.builder(
              itemCount: homeViewModel.goldPrice!.pricesGram.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(
                    horizontal: AppMargin.m20.w, vertical: AppMargin.m10.w),
                padding: EdgeInsets.symmetric(vertical: AppPadding.p20.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s20.r),
                    border: Border.all(color: ColorManager.primary)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        homeViewModel.goldPrice!.pricesGram
                            .elementAt(index)
                            .karat,
                        style: getRegularStyle(
                            color: ColorManager.black, fontSize: FontSize.s20),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        homeViewModel.goldPrice!.pricesGram
                            .elementAt(index)
                            .value
                            .toStringAsFixed(2),
                        style: getRegularStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s26),
                      ),
                    ),
                    Expanded(
                        child: Text(AppStrings.egp,
                            style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s20))),
                  ],
                ),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            ),
          ),
        ],
      ),
    );
  }
}
