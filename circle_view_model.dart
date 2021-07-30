import 'package:ProGuidance/ad_manager.dart';
import 'package:ProGuidance/injection_locator.dart';
import 'package:ProGuidance/services/service.dart';
import 'package:ProGuidance/utils/title_widget/title_widget.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/model/card_vertical_content_widget_model.dart';
import 'package:ProGuidance/utils/card_vertical_content_widget/card_vertical_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CircleViewModel extends Cubit {
  final service = locator<Services>();
  CircleViewModel(state, AnimationController animationController)
      : super(state) {
    _animationController = animationController;
    this.init("Erangel");
  }
  AnimationController _animationController;
  final form = FormGroup(
    {
      'allListData': FormArray<CardVerticalContentWidgetModel>([]),
      'mapData': FormArray<String>([]),
      'selectedMap': FormControl<String>(),
    },
  );

  FormControl<String> get selectedMap =>
      form.control('selectedMap') as FormControl<String>;

  FormArray<CardVerticalContentWidgetModel> get allListData =>
      form.control('allListData') as FormArray<CardVerticalContentWidgetModel>;

  FormArray<String> get mapData => form.control('mapData') as FormArray<String>;

  init(value) async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    if (mapData.value.length == 0) {
      var maps = await service.getMaps();
      this.form.control('mapData').value = maps;
    }
    if (allListData.value.length == 0) {
      var circleDetails = await service.getCircleDetails();
      this.form.control('allListData').value = circleDetails;
    }
    this.form.control('selectedMap').value = value;
    await EasyLoading.dismiss();
  }

  updateListData(value) {
    List<Widget> listViews = [];
    if (allListData.value.length != 0) {
      var tempData = allListData.value.where((element) => element.map == value);
      int indexValue = 1, j = 0;
      if (tempData != null && tempData.length > 0) {
        tempData.forEach(
          (element) {
            listViews.add(
              TitleWidget(
                titleTxt: element.title,
                subTxt: '',
                animation: AppTheme.animationOption(this._animationController),
                animationController: this._animationController,
              ),
            );
            listViews.add(
              CardVerticalContentWidget(
                animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Interval((1 / tempData.length) * 1, 1.0,
                        curve: Curves.fastOutSlowIn),
                  ),
                ),
                animationController: _animationController,
                title: element.key,
                value: element.value,
                bottomContent: element.bottomContent,
                topContent: element.topContent,
              ),
            );
            if ((indexValue % 3) == 0) {
              j = j + 1;
              if (j <= AdManager.maxAdd) {
                listViews.add(AdManager.getNativeAdmob(true));
              }
            }
            indexValue = indexValue + 1;
          },
        );
      }
    }
    return listViews;
  }
}
