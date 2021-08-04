import 'package:ProGuidance/utils/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class ComparisonInitialWidget extends StatefulWidget {
  const ComparisonInitialWidget(
      {Key key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.data})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  final dynamic data;
  @override
  _ComparisonInitialWidgetState createState() =>
      _ComparisonInitialWidgetState();
}

class _ComparisonInitialWidgetState extends State<ComparisonInitialWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: AppTheme.milliseconds),
      vsync: this,
    );
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: AppTheme.transform(widget.mainScreenAnimation),
            child: Container(
              height: 150,
              padding: EdgeInsets.only(
                top: AppTheme.paddingExtraSmall,
                bottom: AppTheme.paddingExtraLarge,
                right: AppTheme.paddingExtraLarge,
                left: AppTheme.paddingExtraLarge,
              ),
              child: SizedBox(
                child: Stack(
                  children: <Widget>[
                    getTextAlignment(),
                    Positioned(
                      top: AppTheme.paddingTripleExtraLarge,
                      left: AppTheme.paddingDoubleExtraLarge,
                      bottom: AppTheme.paddingTripleExtraLarge,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 16, bottom: 16, right: 16, left: 16),
                                color: AppTheme.grey.withOpacity(0.2),
                                child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: CachedNetworkImage(
                                    imageUrl: widget.data['firstImage'],
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  // child:
                                  //     Image.network(widget.data['firstImage']),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Positioned(
                      top: AppTheme.paddingTripleExtraLarge,
                      right: AppTheme.paddingDoubleExtraLarge,
                      bottom: AppTheme.paddingTripleExtraLarge,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                              child: Container(
                                padding: EdgeInsets.all(
                                    AppTheme.paddingDoubleExtraLarge),
                                color: AppTheme.greyWithOpacityLow,
                                child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: CachedNetworkImage(
                                    imageUrl: widget.data['secondImage'],
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  // child:
                                  //     Image.network(widget.data['secondImage']),
                                ),
                              ))
                        ],
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

  Widget getTextAlignment() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.boxBackgroudWithOpacity,
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              top: AppTheme.paddingDoubleExtraLarge,
                            ),
                            child: Text(
                              widget.data['firstWeapon'].toUpperCase(),
                              textAlign: TextAlign.left,
                              style: AppTheme.textStyleLargeWithPrimaryColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: AppTheme.paddingDoubleExtraLarge,
                              bottom: AppTheme.paddingDoubleExtraLarge,
                            ),
                            child: Text(
                              'Vs',
                              textAlign: TextAlign.left,
                              style: AppTheme.textStyleLargeWithPrimaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: AppTheme.paddingDoubleExtraLarge),
                            child: Text(
                              widget.data['secondWeapon'].toUpperCase(),
                              textAlign: TextAlign.left,
                              style: AppTheme.textStyleLargeWithPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
