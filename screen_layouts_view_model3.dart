import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:niralakam_widget/widget/title_widget/title_widget.dart';
import 'package:proguidancelayout/ad_manager.dart';
import 'package:proguidancelayout/injection_locator.dart';
import 'package:proguidancelayout/services/service.dart';
import 'package:proguidancelayout/utils/app_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:proguidancelayout/utils/CardImageWidget.dart';

class ScreenLayoutsViewModel3 extends Cubit {
  final service = locator<Services>();
  ScreenLayoutsViewModel3(
    state,
    AnimationController animationController,
  ) : super(state) {
    _animationController = animationController;
    this.init();
  }
  AnimationController _animationController;
  final form = FormGroup(
    {
      'listData': FormArray<Widget>([]),
    },
  );
  init() async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    List<Widget> listViews = [];
    var response = await service.getScreenLayouts('3');
    if (response != null && response.length > 0) {
      var index = 0;
      var adsCount = 0;
      response.forEach((element) {
        index = index + 1;
        listViews.add(
          TitleWidget(
            titleTxt: element.key,
            subTxt: '',
            animation: AppTheme.animationOption(this._animationController),
            animationController: this._animationController,
          ),
        );
        listViews.add(
          CardImageWidget(
            mainScreenAnimation:
                AppTheme.animationOption(this._animationController),
            mainScreenAnimationController: this._animationController,
            src: element.src,
          ),
        );

        if (index % 4 == 0 &&
            adsCount <= AdManager.maxAdd &&
            AdManager.isShowAdd) {
          adsCount = adsCount + 1;
          listViews.add(AdManager.getNativeAdmob(true));
        }
      });
    }
    listViews.add(AdManager.getNativeAdmob(true));
    this.form.control('listData').value = listViews;
    await EasyLoading.dismiss();
  }
}
