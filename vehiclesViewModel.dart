import 'package:ProGuidance/ad_manager.dart';
import 'package:ProGuidance/injection_locator.dart';
import 'package:ProGuidance/services/service.dart';
import 'package:ProGuidance/utils/title_widget/title_widget.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:ProGuidance/utils/card_horizontal_first_widget/card_horizontal_first_widget.dart';

class VehiclesViewModel extends Cubit {
  final service = locator<Services>();
  VehiclesViewModel(state, AnimationController animationController)
      : super(state) {
    _animationController = animationController;
    this.int();
  }
  AnimationController _animationController;
  final form = FormGroup(
    {
      'listData': FormArray<Widget>([]),
    },
  );
  int() async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    List<Widget> listViews = [];
    var response = await service.getVehicles();
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
          CardHorizontalFirstWidget(
            mainScreenAnimation:
                AppTheme.animationOption(this._animationController),
            mainScreenAnimationController: this._animationController,
            data: element.details,
          ),
        );
      });
    }
    listViews.add(AdManager.getNativeAdmob(true));
    this.form.control('listData').value = listViews;
    await EasyLoading.dismiss();
  }
}
