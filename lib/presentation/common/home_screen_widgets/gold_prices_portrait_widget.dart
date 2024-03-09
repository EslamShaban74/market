import 'package:black_market/app/utils.dart';
import 'package:black_market/presentation/resources/colors_manager.dart';
import 'package:black_market/presentation/resources/font_manager.dart';
import 'package:black_market/presentation/resources/strings_manager.dart';
import 'package:black_market/presentation/resources/style_manager.dart';
import 'package:black_market/presentation/resources/values_manager.dart';
import 'package:black_market/presentation/screens/home_screen/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import r'package:flutter_screenutil/flutter_screenutil.dart';

class GoldPricesPortraitWidget extends StatelessWidget {
  const GoldPricesPortraitWidget({super.key, required this.homeViewModel});

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
                    homeViewModel.goldPrice?.timestamp),
                style: getBoldStyle(color: Colors.grey, fontSize: FontSize.s12),
              ),
            ],
          ),
          SizedBox(height: AppSize.s10.h),
          Expanded(
              child: ListView.builder(
            itemCount: homeViewModel.goldPrice?.pricesGram.length??0,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppMargin.m20.w, vertical: AppMargin.m10.w),
              padding: EdgeInsets.symmetric(vertical: AppPadding.p20.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s20.r),
                  border: Border.all(color: ColorManager.primary)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(homeViewModel.goldPrice!.pricesGram
                      .elementAt(index)
                      .karat),
                  Text(homeViewModel.goldPrice!.pricesGram
                      .elementAt(index)
                      .value
                      .toStringAsFixed(2)),
                  const Text(AppStrings.egp),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
