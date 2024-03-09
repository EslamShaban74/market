import 'dart:io';

import 'package:black_market/app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../data/model/responses/failure/failure.dart';
import '../presentation/resources/colors_manager.dart';
import '../presentation/resources/font_manager.dart';
import '../presentation/resources/strings_manager.dart';
import '../presentation/resources/style_manager.dart';
import '../presentation/resources/values_manager.dart';

class Utils {
  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  Future<dynamic> displayErrorDialog(
      {required BuildContext context,
      required Failure failure,
      String? title}) async {
    dismissDialog(context);
    if (!Platform.isIOS) {
      return showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(title!.orEmpty().isEmpty ? AppStrings.error : title,
              style: Theme.of(context).textTheme.titleLarge),
          content: Text(failure.message,
              style: Theme.of(context).textTheme.bodyMedium),
          actions: <Widget>[
            TextButton(
              child: const Text(AppStrings.ok),
              onPressed: () {
                {
                  Navigator.pop(dialogContext);
                }
              },
            ),
          ],
        ),
      );
    }

    return showCupertinoDialog(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(title.orEmpty().isEmpty ? AppStrings.error : title!,
            style: Theme.of(context).textTheme.titleLarge),
        content: Text(failure.message,
            style: Theme.of(context).textTheme.bodyMedium),
        actions: <Widget>[
          CupertinoDialogAction(
              child: const Text(AppStrings.ok),
              onPressed: () {
                Navigator.pop(dialogContext);
              }),
        ],
      ),
    );
  }

  showPopupLoading(BuildContext context, {String? message}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.2),
              child: Center(
                child: Container(
                  height: AppSize.s100.r,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(AppSize.s14.sp),
                      boxShadow: const [BoxShadow(color: Colors.black26)]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Platform.isIOS
                            ? CupertinoActivityIndicator(
                                color: ColorManager.white,
                                radius: AppSize.s16.h)
                            : SizedBox(
                                width: AppSize.s30.r,
                                height: AppSize.s30.r,
                                child: CircularProgressIndicator(
                                    color: ColorManager.primary)),
                        AppSize.s10.verticalSpace,
                        DefaultTextStyle(
                            style: getRegularStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s14.sp,
                                fontFamily: getFontFamily(context)),
                            child: Text(message ?? AppStrings.loading))
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  String convertTimeStampToDateTimeFormat(int? timeStamp) {
    if(timeStamp!=null){
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp*1000 ,isUtc: true);
    dateTime.toLocal();
   return DateFormat('yyyy-MM-dd – HH:mm a').format(dateTime);
    }else{
      return"";
    }
  }
}
