import 'package:ProGuidance/ad_manager.dart';
import 'package:ProGuidance/injection_locator.dart';
import 'package:ProGuidance/model/card_horizontal_first_with_sub_widget_model.dart';
import 'package:ProGuidance/model/dropdown_weapons_model.dart';
import 'package:ProGuidance/utils/comparision_initial_widget/comparision_initial_widget.dart';
import 'package:ProGuidance/utils/comparision_range_widget/comparision_range_widget.dart';
import 'package:ProGuidance/services/service.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/utils/title_widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:reactive_forms/reactive_forms.dart';

class WeaponCompareViewModel extends Cubit {
  final service = locator<Services>();
  WeaponCompareViewModel(state, AnimationController animationController)
      : super(state) {
    _animationController = animationController;
    this.init("Erangel");
  }
  AnimationController _animationController;
  final form = FormGroup(
    {
      'allListData': FormArray<CardHorizontalFirstWithSubWidgetModel>([]),
      'firstDropdownData': FormArray<DropdownWeaponsModel>([]),
      'secondDropdownData': FormArray<DropdownWeaponsModel>([]),
      'firstSelectedValue': FormControl<DropdownWeaponsModel>(),
      'secondSelectedValue': FormControl<DropdownWeaponsModel>(),
    },
  );

  FormControl<DropdownWeaponsModel> get firstSelectedValue =>
      form.control('firstSelectedValue') as FormControl<DropdownWeaponsModel>;

  FormControl<DropdownWeaponsModel> get secondSelectedValue =>
      form.control('secondSelectedValue') as FormControl<DropdownWeaponsModel>;

  FormArray<CardHorizontalFirstWithSubWidgetModel> get allListData =>
      form.control('allListData')
          as FormArray<CardHorizontalFirstWithSubWidgetModel>;

  FormArray<DropdownWeaponsModel> get firstDropdownData =>
      form.control('firstDropdownData') as FormArray<DropdownWeaponsModel>;
  FormArray<DropdownWeaponsModel> get secondDropdownData =>
      form.control('secondDropdownData') as FormArray<DropdownWeaponsModel>;

  init(value) async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    if (firstDropdownData.value.length == 0) {
      var data = await service.getDropdownWeapons();
      this.form.control('firstDropdownData').value = data;
      this.form.control('secondDropdownData').value = data;
    }
    if (allListData.value.length == 0) {
      var data = await service.getWeaponsDetails();
      this.form.control('allListData').value = data;
    }
    this.form.control('firstSelectedValue').value = firstDropdownData.value[0];
    this.form.control('secondSelectedValue').value = firstDropdownData.value[1];
    await EasyLoading.dismiss();
  }

  updateName(value) {
    var result = "";
    if (allListData.value.length != 0) {
      var firstData = allListData.value.firstWhere(
          (element) => element.title == value.key,
          orElse: () => null);
      if (firstData != null) {
        var firstDetailsData = firstData.details.firstWhere(
            (element) => element.key == value.value,
            orElse: () => null);
        if (firstDetailsData != null) {
          result = firstDetailsData.key;
        }
      }
    }
    return result;
  }

  updateImage(DropdownWeaponsModel value) {
    var result = "";
    if (allListData.value.length != 0) {
      var firstData = allListData.value.firstWhere(
          (element) => element.title == value.key,
          orElse: () => null);
      if (firstData != null) {
        var firstDetailsData = firstData.details.firstWhere(
            (element) => element.key == value.value,
            orElse: () => null);
        if (firstDetailsData != null) {
          result = firstDetailsData.src;
        }
      }
    }
    return result;
  }

  updateListData(DropdownWeaponsModel first, DropdownWeaponsModel second) {
    List<Widget> listViews = [];
    if (allListData.value.length != 0) {
      var firstData = allListData.value.firstWhere(
          (element) => element.title == first.key,
          orElse: () => null);
      var secondData = allListData.value.firstWhere(
          (element) => element.title == second.key,
          orElse: () => null);
      if (firstData != null && secondData != null) {
        var firstDetailsData = firstData.details.firstWhere(
            (element) => element.key == first.value,
            orElse: () => null);
        var secondDetailsData = secondData.details.firstWhere(
            (element) => element.key == second.value,
            orElse: () => null);
        if (firstDetailsData != null && secondDetailsData != null) {
          listViews.add(
            Padding(
              padding: const EdgeInsets.only(
                top: AppTheme.paddingTripleExtraSmall,
                left: AppTheme.paddingDoubleExtraLarge,
                right: AppTheme.paddingDoubleExtraLarge,
                bottom: AppTheme.paddingTripleExtraSmall,
              ),
              child: Text(
                "Damage = Base damage × Hit area damage × Weapon class area damage × Range modifier",
                textAlign: TextAlign.start,
                style: AppTheme.subContentHeaderWithRed,
              ),
            ),
          );
          var comparisonInitialModel = {
            "firstWeapon": firstDetailsData.key.toUpperCase(),
            "secondWeapon": secondDetailsData.key.toUpperCase(),
            "firstImage": firstDetailsData.src,
            "secondImage": secondDetailsData.src,
          };

          listViews.add(
            ComparisonInitialWidget(
              mainScreenAnimation:
                  AppTheme.animationOption(_animationController),
              mainScreenAnimationController: _animationController,
              data: comparisonInitialModel,
            ),
          );
          listViews.add(
            TitleWidget(
              titleTxt: 'Weapon Range Info',
              subTxt: '',
              animation: AppTheme.animationOption(_animationController),
              animationController: _animationController,
            ),
          );

          listViews.add(ComparisonRangeWidget(
            animation: AppTheme.animationOption(_animationController),
            animationController: _animationController,
            firstData: firstDetailsData,
            secondData: secondDetailsData,
          ));
          listViews.add(AdManager.getNativeAdmob(true));
        }
      }
    }
    return listViews;
  }
}
