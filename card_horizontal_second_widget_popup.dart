import 'package:ProGuidance/model/card_horizontal_second_widget_model.dart';
import 'package:ProGuidance/utils/alert_widget/alert_widget.dart';
import 'package:ProGuidance/utils/alert_widget/alert_style.dart';
import 'package:ProGuidance/utils/alert_widget/constants.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

cardHorizontalSecondWidgetPopup(
    context, String title, List<DetailDetail> details, animation, startColor) {
  final List<Widget> listViews = <Widget>[];
  details.forEach((element) {
    listViews.add(
      new Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 48,
                          width: 4,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 4, bottom: 2),
                                child: Text(
                                  element.key,
                                  textAlign: TextAlign.center,
                                  style: AppTheme.subContentHeader,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                    width: 28,
                                    height: 28,
                                    child: Icon(
                                      Icons.queue_play_next,
                                      color: AppTheme.primaryColor
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, bottom: 3),
                                    child: Text(
                                      '${(element.value)}',
                                      textAlign: TextAlign.center,
                                      style: AppTheme.textStyleExtraLarge,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
  final alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: true,
    descStyle: AppTheme.textStyleDoubleExtraLargeWithPrimaryColor,
    animationDuration: Duration(milliseconds: 400),
  );
  Alert(
    context: context,
    style: alertStyle,
    title: title,
    content: Column(
      children: listViews,
    ),
    buttons: [],
  ).show();
}
