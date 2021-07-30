import 'package:ProGuidance/model/card_horizontal_first_with_sub_widget_model.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/utils/range_info_widget/range_info_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeaponRangeDetails extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final Detail data;
  final int divider;
  const WeaponRangeDetails(
      {Key key,
      this.animationController,
      this.animation,
      this.data,
      this.divider})
      : super(key: key);

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
              padding: AppTheme.edgeInsetsPaddingListView,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.boxBackgroud.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Column(
                  children: generateInfoDetails(data, context, divider),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  rangeInfo(List<Head> range) {
    var result = <Widget>[];
    range.forEach((element) {
      result.add(getWeaponRange(
        element.key,
        AppTheme.intToStringConvertor(element.value),
        AppTheme.stringToIntConvertor('100'),
      ));
      result.add(SizedBox(
        height: 3,
      ));
    });
    return result;
  }

  generateInfoDetails(Detail data, context, int divider) {
    var result = <Widget>[];
    result.add(Padding(
      padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLTRB,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              data.key.toUpperCase(),
              textAlign: TextAlign.left,
              style: MediaQuery.of(context).size.width >= 375
                  ? AppTheme.textStyleLarge
                  : AppTheme.textStyleMedium,
            ),
          ),
        ],
      ),
    ));
    result.add(
      Padding(
        padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLR,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: AppTheme.paddingDoubleExtraLarge,
                ),
                child: Column(children: rangeInfo(data.range)),
              ),
            ),
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppTheme.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl: data.src,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          // child: Image.network(data.src),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    result.add(
      Padding(
        padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLTRB,
        child: Container(
          height: 2,
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
    );
    if (divider == 1 && data.info != null && data.info.length > 0) {
      data.info.forEach((element) {
        result.add(
          getWeaponRange(element.key, element.value, 100),
        );
      });
    }
    if (divider == 2 && data.info != null && data.info.length > 0) {
      int index = (data.info.length ~/ divider).toInt();
      if (data.info.length == 1) {
        index = 1;
      }
      int currentData = 0;
      for (var i = 0; i < index; i++) {
        var firstElement = data.info[currentData];
        var secondElement;
        if (currentData + 1 < data.info.length) {
          secondElement = data.info[currentData + 1];
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
    return result;
  }
}

Widget widgetForWeaponDetails(
    firstColumnTitle, firstColumnValue, secondColumnTitle, secondColumnValue) {
  return Padding(
    padding: EdgeInsets.only(
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
                    padding: EdgeInsets.only(top: 6),
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
                    style: AppTheme.subContentHeader,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6),
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
