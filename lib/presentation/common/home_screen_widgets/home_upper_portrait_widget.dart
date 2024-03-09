import 'package:black_market/presentation/screens/home_screen/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import r'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/colors_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';
import 'currency_exchange_portrait_widget.dart';
import 'gold_prices_portrait_widget.dart';

class HomeUpperPortraitWidget extends StatelessWidget {
  const HomeUpperPortraitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: ColorManager.primary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.market,
                        style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s30.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(0.0, -50 / 2.0),
                    child: Center(
                      child: Container(
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
                          tabs: const [
                            Tab(
                              child: Text(AppStrings.currencyExchangeRate),
                            ),
                            Tab(
                              child: Text(AppStrings.goldPrices),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 3,
                child: Consumer<HomeViewModel>(builder: (context, provider, _) {
                  return TabBarView(
                    children: [
                      CurrencyExchangePortraitWidget(homeViewModel: provider),
                      GoldPricesPortraitWidget(homeViewModel: provider)
                    ],
                  );
                }),
              )
            ],
          )),
    );
  }
}
