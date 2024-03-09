import 'package:black_market/app/di.dart';
import 'package:black_market/presentation/common/home_screen_widgets/currency_exchange_portrait_widget.dart';
import 'package:black_market/presentation/resources/colors_manager.dart';
import 'package:black_market/presentation/resources/font_manager.dart';
import 'package:black_market/presentation/resources/strings_manager.dart';
import 'package:black_market/presentation/resources/style_manager.dart';
import 'package:black_market/presentation/resources/values_manager.dart';
import 'package:black_market/presentation/screens/home_screen/view_model/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import r'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common/home_screen_widgets/currency_exchange_landscape_widget.dart';
import '../../../common/home_screen_widgets/gold_prices_landscape_widget.dart';
import '../../../common/home_screen_widgets/gold_prices_portrait_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel _homeViewModel = getItInstance<HomeViewModel>();

  void _onInit() {
    Future.wait([
      _homeViewModel.getGoldPrices(context),
      _homeViewModel.getCurrencyExchangeRate(context),
    ]);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _homeViewModel,
      child: Scaffold(body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return SafeArea(
            child: DefaultTabController(
                length: 2,
                child: RefreshIndicator(
                  onRefresh: ()async{
                    _homeViewModel.getCurrencyExchangeRate(context);
                  },
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
                              const Icon(Icons.currency_exchange_sharp,color: Colors.white,),
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
                                margin: EdgeInsets.symmetric(
                                    horizontal: AppMargin.m20.w),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s20.r),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 16.0,
                                      offset: const Offset(0.0, 6.0),
                                      color: Colors.black.withOpacity(0.16),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.fromLTRB(
                                    24.0, 3.0, 24.0, 0.0),
                                child: TabBar(
                                  labelColor: ColorManager.primary,
                                  indicatorColor: ColorManager.primary,
                                  isScrollable: false,
                                  tabs: const [
                                    Tab(
                                      child:
                                          Text(AppStrings.currencyExchangeRate),
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
                        child: Consumer<HomeViewModel>(
                          builder: (context,provider,_) {
                            return TabBarView(
                              children: [
                                CurrencyExchangePortraitWidget(homeViewModel: provider,),
                                GoldPricesPortraitWidget(homeViewModel: provider,)
                              ],
                            );
                          }
                        ),
                      )
                    ],
                  ),
                )),
          );
        } else {
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.currency_exchange_sharp,color: Colors.white,size: AppSize.s40,),
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
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: AppMargin.m20.w),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s20.r),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 16.0,
                                    offset: const Offset(0.0, 6.0),
                                    color: Colors.black.withOpacity(0.16),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                  24.0, 3.0, 24.0, 0.0),
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
                                  (BuildContext context, HomeViewModel provider,
                                      _) {
                                return TabBarView(
                                  children: [
                                    CurrencyExchangeLandscapeWidget(
                                        homeViewModel: provider),
                                    GoldPricesLandscapeWidget(
                                        homeViewModel: provider)
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
      }),),
    );
  }
}
