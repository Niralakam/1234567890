import 'package:ProGuidance/model/card_horizontal_first_with_sub_widget_model.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class BestAttachmentSetList1 extends StatefulWidget {
  const BestAttachmentSetList1(
      {Key key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.data,
      this.width,
      this.height})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  final double width;
  final double height;
  final List<Attachement> data;
  @override
  _BestAttachmentSetListState createState() => _BestAttachmentSetListState();
}

class _BestAttachmentSetListState extends State<BestAttachmentSetList1>
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
              height: widget.height,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: widget.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final Animation<double> animation =
                      AppTheme.animationOption(animationController);
                  animationController.forward();
                  return BestAttachmentSet(
                    data: widget.data[index],
                    animation: animation,
                    animationController: animationController,
                    width: widget.width,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class BestAttachmentSet extends StatelessWidget {
  const BestAttachmentSet(
      {Key key,
      this.data,
      this.animationController,
      this.animation,
      this.width})
      : super(key: key);

  final double width;
  final Attachement data;
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
            transform: AppTheme.transform(animation),
            child: SizedBox(
              width: width,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 16, right: 8, bottom: 16),
                    child: Container(
                      width: width,
                      decoration: AppTheme.sensitivityCardDecoration,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 54, left: 16, right: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data.key.toLowerCase(),
                              textAlign: TextAlign.center,
                              style: AppTheme.textStyleSmallWhite,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              data.value.toLowerCase(),
                              textAlign: TextAlign.center,
                              style: AppTheme.textStyleExtraSmallWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CachedNetworkImage(
                        imageUrl: data.src,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
