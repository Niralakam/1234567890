import 'package:ProGuidance/utils/common_widget/common_widget.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';

class FeedBackAndShareWidget {
  static Widget feedBackAndShare() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                  onTap: () {
                    LaunchReview.launch(
                      androidAppId: "com.niralaakam.ProGuidance",
                    );
                  },
                  child: CommonWidget.getIconWithText(
                      Icons.feedback,
                      AppTheme.primaryColor,
                      "Feedback",
                      AppTheme.textStyleMediumWithPrimaryColor)),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Share.share(
                      "Try this BATTLEGROUNDS MOBILE Guidance application https://play.google.com/store/apps/details?id=com.niralaakam.ProGuidance");
                },
                child: CommonWidget.getIconWithText(
                    Icons.share,
                    AppTheme.primaryColor,
                    "Share",
                    AppTheme.textStyleMediumWithPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
