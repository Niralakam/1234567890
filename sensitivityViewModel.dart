import 'package:ProGuidance/ad_manager.dart';
import 'package:ProGuidance/injection_locator.dart';
import 'package:ProGuidance/services/service.dart';
import 'package:ProGuidance/utils/card_horizontal_second_widget/card_horizontal_second_widget.dart';
import 'package:ProGuidance/utils/title_widget/title_widget.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SensitivityViewModel extends Cubit {
  final service = locator<Services>();
  SensitivityViewModel(
    state,
    AnimationController animationController,
    String url,
  ) : super(state) {
    _animationController = animationController;
    _url = url;
    this.init();
  }
  AnimationController _animationController;
  String _url;
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
    var response = await service.getSensitivity(_url);
    int indexValue = 1, j = 0;
    if (response != null && response.length > 0) {
      response.forEach((element) {
        listViews.add(
          TitleWidget(
            titleTxt: element.title,
            subTxt: '',
            animation: AppTheme.animationOption(this._animationController),
            animationController: this._animationController,
          ),
        );
        listViews.add(
          CardHorizontalSecondWidget(
            mainScreenAnimation:
                AppTheme.animationOption(this._animationController),
            mainScreenAnimationController: this._animationController,
            data: element.details,
          ),
        );
        if ((indexValue % 3) == 0) {
          j = j + 1;
          if (j <= AdManager.maxAdd) {
            listViews.add(AdManager.getNativeAdmob(true));
          }
        }
        indexValue = indexValue + 1;
      });
    }
    this.form.control('listData').value = listViews;
    await EasyLoading.dismiss();
  }
}
