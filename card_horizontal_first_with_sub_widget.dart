import 'package:ProGuidance/model/card_horizontal_first_with_sub_widget_model.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/utils/card_horizontal_first_with_sub_widget/card_horizontal_first_with_sub_info_widget.dart';
import 'package:flutter/material.dart';

class CardHorizontalFirstWithSubWidget extends StatefulWidget {
  const CardHorizontalFirstWithSubWidget(
      {Key key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.data})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  final List<Detail> data;
  @override
  _CardHorizontalFirstWithSubWidgetState createState() =>
      _CardHorizontalFirstWithSubWidgetState();
}

class _CardHorizontalFirstWithSubWidgetState
    extends State<CardHorizontalFirstWithSubWidget>
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

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildAnimatedBuilder(
      widget.mainScreenAnimationController,
      widget.mainScreenAnimation,
      widget.data,
      animationController,
      (a, b, c) => CardHorizontalFirstWithSubInfoWidget(
        data: a,
        animationController: b,
        animation: c,
      ),
    );
  }

  static Widget buildAnimatedBuilder(
    AnimationController mainScreenAnimationController,
    Animation mainScreenAnimation,
    List<Detail> data,
    AnimationController animationController,
    Function(Detail data, AnimationController b, Animation<dynamic> c) callBack,
  ) {
    return AnimatedBuilder(
      animation: mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: mainScreenAnimation,
          child: Transform(
            transform: AppTheme.transform(mainScreenAnimation),
            child: Container(
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                padding: AppTheme.edgeInsetsPaddingTripleExtraSmallLTRB,
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final Animation<double> animation =
                      AppTheme.animationOption(animationController);
                  animationController.forward();
                  return callBack(
                    data[index],
                    animationController,
                    animation,
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
