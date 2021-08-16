import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:niralakam_widget/theme/niralakam-share-theme.dart';
import 'package:proguidancelayout/ad_manager.dart';
import 'package:proguidancelayout/injection_locator.dart';
import 'package:proguidancelayout/services/service.dart';
import 'package:proguidancelayout/utils/app_bar.dart';
import 'package:proguidancelayout/utils/app_theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BasicSettingViewModel extends Cubit {
  final service = locator<Services>();
  BasicSettingViewModel(state) : super(state) {
    this.int();
  }
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
    var data = await service.getSettings();
    List<Widget> listViews = <Widget>[];
    if (data != null && data.length > 0) {
      var index = 0;
      var adsCount = 0;
      data.forEach((element) {
        index = index + 1;
        switch (element.type.toUpperCase()) {
          case 'H1':
            listViews.add(
              content(
                element.value,
                AppTheme.textStyleDoubleExtraLarge,
              ),
            );
            break;
          case 'H2':
            listViews.add(
              content(
                element.value,
                AppTheme.textStyleMedium,
              ),
            );
            break;
          case 'P':
            listViews.add(
              paragraph(
                element.value,
                NiralakamSharedTheme.subContentHeader,
              ),
            );
            break;
          case 'IMG':
            listViews.add(customImage(element.value));
            break;
        }
        if (index % 5 == 0 &&
            adsCount <= AdManager.maxAdd &&
            AdManager.isShowAdd) {
          adsCount = adsCount + 1;
          listViews.add(AdManager.getNativeAdmob(true));
        }
      });
    }
    this.form.control('listData').value = listViews;
    await EasyLoading.dismiss();
  }
}
