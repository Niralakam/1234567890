import 'package:ProGuidance/ad_manager.dart';
import 'package:ProGuidance/injection_locator.dart';
import 'package:ProGuidance/services/service.dart';
import 'package:ProGuidance/views/maps_view/sub_widget/map_info_widget.dart';
import 'package:ProGuidance/views/maps_view/sub_widget/map_initial_widget.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/model/map_details_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MapDetailsViewModel extends Cubit {
  final service = locator<Services>();
  MapDetailsViewModel(state, AnimationController animationController)
      : super(state) {
    _animationController = animationController;
    this.init("Erangel");
  }
  AnimationController _animationController;
  final form = FormGroup(
    {
      'allListData': FormArray<MapDetailsWidgetModel>([]),
      'mapData': FormArray<String>([]),
      'selectedMap': FormControl<String>(),
    },
  );

  FormControl<String> get selectedMap =>
      form.control('selectedMap') as FormControl<String>;

  FormArray<MapDetailsWidgetModel> get allListData =>
      form.control('allListData') as FormArray<MapDetailsWidgetModel>;

  FormArray<String> get mapData => form.control('mapData') as FormArray<String>;
  init(value) async {
    // await EasyLoading.show(
    //   status: 'loading...',
    //   maskType: EasyLoadingMaskType.black,
    // );
    if (mapData.value.length == 0) {
      var maps = await service.getMaps();
      this.form.control('mapData').value = maps;
    }
    if (allListData.value.length == 0) {
      var details = await service.getMapsDetails();
      this.form.control('allListData').value = details;
    }
    this.form.control('selectedMap').value = value;
    // await EasyLoading.dismiss();
  }

  updateListData(value) {
    List<Widget> listViews = [];
    if (allListData.value.length != 0) {
      var tempData = allListData.value
          .firstWhere((element) => element.name == value, orElse: () => null);
      if (tempData != null) {
        listViews.add(
          Padding(
            padding: const EdgeInsets.only(
              left: AppTheme.paddingDoubleExtraLarge,
              right: AppTheme.paddingDoubleExtraLarge,
              bottom: 0,
            ),
            child: Text(
              "All car, vechile locations and other deatils got from official website",
              textAlign: TextAlign.start,
              style: AppTheme.subContentHeaderWithRed,
            ),
          ),
        );
        MapElement selected = tempData.maps[0];
        listViews.add(
          MapInitialWidget(
            mainScreenAnimation: AppTheme.animationOption(_animationController),
            mainScreenAnimationController: _animationController,
            maps: tempData.maps,
            selected: selected,
          ),
        );
        listViews.add(MapInfoWidget(
          animation: AppTheme.animationOption(_animationController),
          animationController: _animationController,
          mapDetails: tempData.details,
        ));
        listViews.add(AdManager.getNativeAdmob(true));
      }
    }
    return listViews;
  }
}
