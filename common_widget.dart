import 'package:ProGuidance/utils/animated_drop_loading_widget/animated_drop_loading_widget.dart';
import 'package:ProGuidance/resources/constant.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ProGuidance/model/card_horizontal_first_widget_model.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonWidget {
  static getIconWithText(icon, iconColor, text, textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
        ),
        Padding(
          padding: EdgeInsets.only(top: 3, left: 3),
          child: Text(
            text,
            style: textColor,
          ),
        )
      ],
    );
  }

  static Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  static Widget getMainListViewUI(
      scrollController, listViews, animationController, name) {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return AppTheme.sizedBoxEmpty;
        } else if (listViews.length != 0) {
          return ListView.builder(
            controller: scrollController,
            padding: edgeInsetsHideAppBar(context, name),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              animationController.forward();
              return listViews[index];
            },
          );
        } else {
          return AppTheme.sizedBoxEmpty;
        }
      },
    );
  }

  static IgnorePointer rainDropAnimation(isShowAvatar) {
    return IgnorePointer(
      child: AnimatedDropLoadingWidget(
        color: AppTheme.primaryColor,
        title: Constant.title,
        isShowAvatar: isShowAvatar,
      ),
    );
  }

  static CircleAvatar buildAvatar({double radius = 80}) {
    return CircleAvatar(
      radius: radius - 2,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage('assets/images/ic_launcher.png'),
    );
  }

  static EdgeInsets edgeInsetsHideAppBar(BuildContext context, name) {
    switch (name) {
      case 'Privacy Policy':
        return EdgeInsets.only(top: 0);
        break;
      case 'About':
        return EdgeInsets.only(top: 0);
        break;
      default:
        return EdgeInsets.only(top: AppBar().preferredSize.height);
        break;
    }
  }

  static getNameBasedBuildContainerChild(context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.bottom,
    );
  }

  static launchURL(String url) async {
    if (await canLaunch(url)) {
      if (url == 'mailto:niralakam@gmail.com') {
        await launch(
          url,
          forceWebView: false,
        );
      } else {
        await launch(
          url,
          forceWebView: true,
        );
      }
    }
  }

  static getCommonApplicationPrivacyData(width) {
    List<Widget> listViews = <Widget>[];
    listViews.add(
      Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 380,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
              ),
            ),
          ),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/weapons/Master.png'),
                ),
              ),
              foregroundDecoration:
                  BoxDecoration(color: AppTheme.primaryColor.withOpacity(0.5)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 90),
                CommonWidget.buildAvatar(
                  radius: width,
                ),
                const SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'P',
                        style: AppTheme.textStyleTripleExtraLargeWhite,
                        children: [
                          TextSpan(
                            text: 'UB',
                            style: AppTheme.textStyleTripleExtraLargeBlack,
                          ),
                          TextSpan(
                            text: 'G',
                            style: AppTheme.textStyleTripleExtraLargeWhite,
                          ),
                          TextSpan(
                            text: ' MOBILE Guidance',
                            style: AppTheme.textStyleTripleExtraLargeWhite,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: new EdgeInsets.only(right: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: Constant.version,
                            style: TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
    listViews.add(
      SizedBox(
        height: 16,
      ),
    );
    return listViews;
  }

  static Widget buildAnimatedBuilder(
    AnimationController mainScreenAnimationController,
    Animation mainScreenAnimation,
    List<CardHorizontalFirstWidgetModelDetail> data,
    AnimationController animationController,
    Function(CardHorizontalFirstWidgetModelDetail data, AnimationController b,
            Animation<dynamic> c)
        callBack,
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
