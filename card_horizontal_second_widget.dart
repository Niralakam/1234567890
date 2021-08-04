import 'package:ProGuidance/model/card_horizontal_second_widget_model.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ProGuidance/utils/card_horizontal_second_widget/card_horizontal_second_widget_popup.dart';

class CardHorizontalSecondWidget extends StatefulWidget {
  const CardHorizontalSecondWidget(
      {Key key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.data})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  final List<CardHorizontalSecondWidgetModelDetail> data;
  @override
  _CardHorizontalSecondWidgetState createState() =>
      _CardHorizontalSecondWidgetState();
}

class _CardHorizontalSecondWidgetState extends State<CardHorizontalSecondWidget>
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
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: AppTheme.transform(widget.mainScreenAnimation),
            child: Container(
              height: 216,
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
                  return CardHorizontalSecondSubWidget(
                    data: widget.data[index],
                    animation: animation,
                    animationController: animationController,
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

class CardHorizontalSecondSubWidget extends StatelessWidget {
  const CardHorizontalSecondSubWidget(
      {Key key, this.data, this.animationController, this.animation})
      : super(key: key);

  final CardHorizontalSecondWidgetModelDetail data;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  List<String> getSubCategory(String name) {
    if (name == "Camera Sensitivity") {
      return ['3rd Person Camera,', 'Camera,', '1rd Person Camera,'];
    } else if (name == "Camera") {
      return [
        'Red Dot,',
        'Holographic,',
        'Aim Assist',
      ];
    } else if (name == "Gyroscope Sensitivity") {
      return [
        'Red Dot,',
        'Holographic,',
        'Aim Assist',
      ];
    } else {
      return ['No Scope', 'Red Dot,', 'Holographic,', 'Aim Assist'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: AppTheme.subTransform(animation),
            child: SizedBox(
              width: 230,
              child: Stack(children: [
                GestureDetector(
                  onTap: () {
                    cardHorizontalSecondWidgetPopup(
                      context,
                      data.key,
                      data.details,
                      animation,
                      AppTheme.primaryColor,
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 32, left: 8, right: 8, bottom: 16),
                        child: Container(
                          decoration: AppTheme.sensitivityCardDecoration,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 54, left: 16, right: 16, bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data.key,
                                  textAlign: TextAlign.center,
                                  style: AppTheme.textStyleLargeWhite,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          getSubCategory(data.value).join('\n'),
                                          style: AppTheme
                                              .textStyleExtraSmallWithWhite,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.nearlyWhite,
                                        shape: BoxShape.circle,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: AppTheme.nearlyBlack
                                                  .withOpacity(0.4),
                                              offset: Offset(8.0, 8.0),
                                              blurRadius: 8.0),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Icon(
                                          Icons.add,
                                          color: AppTheme.primaryColor,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 3),
                                      child: Text(
                                        'more',
                                        style: AppTheme
                                            .textStyleExtraSmallWithWhite,
                                      ),
                                    ),
                                  ],
                                )
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
                        top: 0,
                        left: 8,
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset('assets/weapons/Master.png'),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
