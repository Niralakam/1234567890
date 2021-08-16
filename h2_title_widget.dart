import 'package:flutter/material.dart';
import 'package:niralakam_widget/theme/niralakam-share-theme.dart';

class H2TitleWidget {
  final String titleTxt;
  final AnimationController animationController;
  final Animation animation;
  final MaterialColor color;
  const H2TitleWidget(
      {this.titleTxt: "", this.animationController, this.animation, this.color})
      : super();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: NiralakamSharedTheme.transform(animation),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: NiralakamSharedTheme.paddingDoubleExtraLarge,
                  right: NiralakamSharedTheme.paddingDoubleExtraLarge,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        titleTxt,
                        textAlign: TextAlign.left,
                        style: MediaQuery.of(context).size.width >= 375
                            ? NiralakamSharedTheme
                                .textStyleMediumWithPrimaryColor
                            : NiralakamSharedTheme
                                .textStyleMediumWithPrimaryColor,
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
}
