import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ProGuidance/model/card_horizontal_first_widget_model.dart';
import 'package:ProGuidance/utils/card_horizontal_first_widget/card_horizontal_first_sub_widget.dart';
import 'package:ProGuidance/utils/common_widget/common_widget.dart';

class CardHorizontalFirstWidget extends StatefulWidget {
  const CardHorizontalFirstWidget(
      {Key key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.data})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  final List<CardHorizontalFirstWidgetModelDetail> data;
  @override
  _CardHorizontalFirstWidgetState createState() =>
      _CardHorizontalFirstWidgetState();
}

class _CardHorizontalFirstWidgetState extends State<CardHorizontalFirstWidget>
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
    return CommonWidget.buildAnimatedBuilder(
      widget.mainScreenAnimationController,
      widget.mainScreenAnimation,
      widget.data,
      animationController,
      (a, b, c) => CardHorizontalFirstSubWidget(
        data: a,
        animationController: b,
        animation: c,
      ),
    );
  }
}
