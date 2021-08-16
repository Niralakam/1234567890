import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:niralakam_widget/widget/application_details_widget/application_details_widget.dart';
import 'package:niralakam_widget/widget/common_widget/common_widget.dart';
import 'package:niralakam_widget/widget/title_widget/title_widget.dart';
import 'package:proguidancelayout/injection_locator.dart';
import 'package:proguidancelayout/services/service.dart';
import 'package:proguidancelayout/utils/app_theme.dart';
import 'package:proguidancelayout/utils/feedback_share_widget/feedback_share_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ApplicationViewModel extends Cubit {
  final service = locator<Services>();
  ApplicationViewModel(state, AnimationController animationController, width)
      : super(state) {
    _animationController = animationController;
    this.int(width);
  }
  AnimationController _animationController;
  final form = FormGroup(
    {
      'listData': FormArray<Widget>([]),
    },
  );
  int(width) async {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    var data = await service.getAboutUs();
    List<Widget> listViews = CommonWidget.getCommonApplicationPrivacyData(
      width,
      AppTheme.applicationtitle,
    );
    if (data != null && data.length > 0) {
      data.forEach((element) {
        listViews.add(
          Container(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: TitleWidget(
              titleTxt: element.title,
              subTxt: '',
              animation: AppTheme.animationOption(this._animationController),
              animationController: this._animationController,
            ),
          ),
        );
        if (element.details != null && element.details.length > 0) {
          element.details.forEach((detail) {
            listViews.add(
              ApplicationDetailsWidget(
                  animationController: this._animationController,
                  animation:
                      AppTheme.animationOption(this._animationController),
                  description: detail.value),
            );
            listViews.add(
              SizedBox(
                height: 16,
              ),
            );
          });
        }
      });
    }
    listViews.add(
      FeedBackAndShareWidget.feedBackAndShare(),
    );
    listViews.add(
      SizedBox(
        height: 16,
      ),
    );
    this.form.control('listData').value = listViews;
    await EasyLoading.dismiss();
  }
}
