import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ApplicationDetailsWidget extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final String description;
  const ApplicationDetailsWidget({
    Key key,
    this.animationController,
    this.animation,
    this.description,
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
              padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLR,
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
                          children: <Widget>[
                            Text(
                              description,
                              style: AppTheme.subContentHeader,
                            ),
                          ],
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
}
