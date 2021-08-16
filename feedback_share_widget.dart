import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:niralakam_widget/widget/common_widget/common_widget.dart';
import 'package:proguidancelayout/utils/app_theme.dart';
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
                      androidAppId: "com.niralaakam.proguidancelayout",
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
                      "Try this Control Layout Guidance - BGMI application https://play.google.com/store/apps/details?id=com.niralaakam.proguidancelayout");
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
