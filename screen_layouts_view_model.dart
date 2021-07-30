import 'package:ProGuidance/ad_manager.dart';
import 'package:ProGuidance/injection_locator.dart';
import 'package:ProGuidance/services/service.dart';
import 'package:ProGuidance/utils/card_with_image_only_widget/card_with_image_only_widget.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/utils/title_widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ScreenLayoutsViewModel extends Cubit {
  final service = locator<Services>();
  ScreenLayoutsViewModel(
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
    var response = await service.getScreenLayouts();
    if (response != null && response.length > 0) {
      response.forEach((element) {
        listViews.add(
          TitleWidget(
            titleTxt: element.key,
            subTxt: '',
            animation: AppTheme.animationOption(this._animationController),
            animationController: this._animationController,
          ),
        );
        listViews.add(
          CardWithImageOnlyWidget(
            mainScreenAnimation:
                AppTheme.animationOption(this._animationController),
            mainScreenAnimationController: this._animationController,
            data: element,
          ),
        );
      });
    }
    listViews.add(AdManager.getNativeAdmob(true));
    this.form.control('listData').value = listViews;
    await EasyLoading.dismiss();
  }
}
