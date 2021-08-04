import 'package:ProGuidance/utils/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ProGuidance/utils/sub_header_widget/sub_header_widget.dart';
import 'package:ProGuidance/model/card_horizontal_first_widget_model.dart';

class CardHorizontalFirstSubWidget extends StatelessWidget {
  const CardHorizontalFirstSubWidget({
    Key key,
    this.data,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final CardHorizontalFirstWidgetModelDetail data;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: AppTheme.subTransform(animation),
            child: InkWell(
              splashColor: Colors.transparent,
              child: SizedBox(
                width: 280,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 48,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.lightGreyWithOpacityMedium,
                                borderRadius: AppTheme.borderRadiusMedium,
                              ),
                              child: Row(
                                children: <Widget>[
                                  const SizedBox(
                                    width: 48 + 24.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: getCardHorizontalContent(
                                          data.details,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 16, bottom: 16, right: 16, left: 16),
                                color: AppTheme.grey.withOpacity(0.2),
                                child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: CachedNetworkImage(
                                    imageUrl: data.src,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  // Image.network(data.src),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> getCardHorizontalContent(List<DetailDetail> details) {
    List<Widget> result = <Widget>[];
    result.add(Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SubHeaderWidget(
        titleTxt: data.key,
        animation: AppTheme.animationOption(animationController),
        animationController: animationController,
      ),
    ));
    result.add(SizedBox(
      height: 20,
    ));
    details.forEach((element) {
      if (element.key != null && element.value != null) {
        result.add(Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  element.key + " : " + element.value,
                  textAlign: TextAlign.left,
                  style: AppTheme.textStyleSmall,
                ),
              )
            ],
          ),
        ));
      }
    });
    return result;
  }
}
