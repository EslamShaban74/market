import 'package:black_market/presentation/screens/home_screen/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import r'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/colors_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';
import 'currency_exchange_landscape_widget.dart';
import 'gold_prices_landscape_widget.dart';

class HomeUpperLandscapeWidget extends StatelessWidget {
  const HomeUpperLandscapeWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: DefaultTabController(
            length: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(AppSize.s14),
                            bottomRight: Radius.circular(AppSize.s14))),
                    child: Center(
                      child: Text(
                        AppStrings.market,
                        style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s30.sp),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: AppMargin.m20.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppSize.s20.r),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16.0,
                              offset: const Offset(0.0, 6.0),
                              color: Colors.black.withOpacity(0.16),
                            ),
                          ],
                        ),
                        padding:
                            const EdgeInsets.fromLTRB(24.0, 3.0, 24.0, 0.0),
                        child: TabBar(
                          labelColor: ColorManager.primary,
                          indicatorColor: ColorManager.primary,
                          isScrollable: false,
                          tabs: [
                            Tab(
                              child: Text(
                                AppStrings.currencyExchangeRate,
                                style: getRegularStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSize.s14),
                              ),
                            ),
                            Tab(
                              child: Text(
                                AppStrings.goldPrices,
                                style: getRegularStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSize.s14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Consumer<HomeViewModel>(builder:
                            (BuildContext context, HomeViewModel provider, _) {
                          return TabBarView(
                            children: [
                              CurrencyExchangeLandscapeWidget(
                                  homeViewModel: provider),
                              GoldPricesLandscapeWidget(homeViewModel: provider)
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
