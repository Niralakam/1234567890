import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';

Widget appBar(String title, double size) {
  return SizedBox(
    height: AppBar().preferredSize.height,
    child: Container(
      decoration: BoxDecoration(color: AppTheme.background),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4, left: 60),
                child: Text(
                  title,
                  style: size >= 375
                      ? AppTheme.textStyleDoubleExtraLargeWithPrimaryColor
                      : AppTheme.textStyleExtraLargeWithPrimaryColor,
                ),
              ),
            ),
          ),
          Container(
            width: AppBar().preferredSize.height + 40,
            height: AppBar().preferredSize.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {
                      LaunchReview.launch(
                        androidAppId: "com.niralaakam.ProGuidance",
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.rate_review,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {
                      Share.share(
                          "Try this BATTLEGROUNDS MOBILE Guidance application https://play.google.com/store/apps/details?id=com.niralaakam.ProGuidance");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.share,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
