import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:niralakam_widget/widget/common_widget/common_widget.dart';
import 'package:niralakam_widget/widget/title_widget/title_widget.dart';
import 'package:proguidancelayout/resources/constant.dart';
import 'package:proguidancelayout/utils/app_theme.dart';
import 'package:proguidancelayout/utils/feedback_share_widget/feedback_share_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PrivacyPolicyViewModel extends Cubit {
  PrivacyPolicyViewModel(state, AnimationController animationController, width)
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
    List<Widget> listViews = CommonWidget.getCommonApplicationPrivacyData(
      width,
      AppTheme.applicationtitle,
    );
    listViews.add(
      Container(
        padding: EdgeInsets.only(
          bottom: 10,
        ),
        child: TitleWidget(
          titleTxt: "Privacy Policy",
          subTxt: '',
          animation: AppTheme.animationOption(this._animationController),
          animationController: this._animationController,
        ),
      ),
    );
    listViews.add(
      Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: Html(
          data: Constant.htmlData,
          onLinkTap: (url) {
            CommonWidget.launchURL(url);
          },
          style: {
            "var": Style(
              color: AppTheme.primaryColor,
              fontSize: FontSize(AppTheme.fontSizeMedium),
            ),
            "strong": Style(
              color: AppTheme.primaryColor,
              fontSize: FontSize(AppTheme.fontSizeLarge),
            ),
            "html": Style(
              backgroundColor: Colors.transparent,
            ),
          },
        ),
      ),
    );

    listViews.add(FeedBackAndShareWidget.feedBackAndShare());
    listViews.add(
      SizedBox(
        height: 16,
      ),
    );
    this.form.control('listData').value = listViews;
  }
}
