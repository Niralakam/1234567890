import 'package:ProGuidance/model/map_details_widget_model.dart';
import 'package:ProGuidance/utils/sub_header_widget/sub_header_widget.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';

class MapInfoWidget extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final List<Detail> mapDetails;
  const MapInfoWidget({
    Key key,
    this.animationController,
    this.animation,
    this.mapDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: AppTheme.transform(animation),
            child: Padding(
              padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLRB,
              child: Container(
                decoration: AppTheme.decoration,
                child: Padding(
                  padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLTRB,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: loadMapInfo(mapDetails),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  loadMapInfo(List<Detail> mapDetails) {
    var result = <Widget>[];
    if (mapDetails != null && mapDetails.length > 0) {
      mapDetails.forEach((element) {
        result.add(SubHeaderWidget(
          titleTxt: element.title,
          animation: AppTheme.animationOption(animationController),
          animationController: animationController,
        ));
        result.add(AppTheme.sizedBoxEmpty);
        if (element.contents != null && element.contents.length > 0) {
          int index = (element.contents.length ~/ 2).toInt();
          if (element.contents.length == 1) {
            index = 1;
          }
          int currentData = 0;
          for (var i = 0; i < index; i++) {
            var firstElement = element.contents[currentData];
            var secondElement;
            if (currentData + 1 < element.contents.length) {
              secondElement = element.contents[currentData + 1];
            }
            currentData = currentData + 2;
            result.add(
              widgetForWeaponDetails(
                firstElement.key,
                firstElement.value,
                secondElement != null ? secondElement.key : "",
                secondElement != null ? secondElement.value : "",
              ),
            );
          }
        }
      });
    }
    return result;
  }
}

Widget widgetForWeaponDetails(
    firstColumnTitle, firstColumnValue, secondColumnTitle, secondColumnValue) {
  return Padding(
    padding: const EdgeInsets.only(
      left: AppTheme.paddingDoubleExtraLarge,
      right: AppTheme.paddingDoubleExtraLarge,
      top: AppTheme.paddingDoubleExtraSmall,
      bottom: AppTheme.paddingDoubleExtraSmall,
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    firstColumnTitle,
                    textAlign: TextAlign.center,
                    style: AppTheme.subContentHeader,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      firstColumnValue,
                      textAlign: TextAlign.center,
                      style: AppTheme.textStyleExtraSmallWithOpacity,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    secondColumnTitle,
                    textAlign: TextAlign.center,
                    style: AppTheme.subContentHeader,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      secondColumnValue,
                      textAlign: TextAlign.center,
                      style: AppTheme.textStyleExtraSmallWithOpacity,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
