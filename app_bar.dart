import 'package:cached_network_image/cached_network_image.dart';
import 'package:niralakam_widget/theme/niralakam-share-theme.dart';
import 'package:proguidancelayout/utils/app_theme.dart';
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
                        androidAppId: "com.niralaakam.proguidancelayout",
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
                          "Try this Control Layout application https://play.google.com/store/apps/details?id=com.niralaakam.proguidancelayout");
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

Widget content(String value, TextStyle style) {
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(
                left: NiralakamSharedTheme.paddingDoubleExtraLarge,
                right: NiralakamSharedTheme.paddingDoubleExtraLarge,
                bottom: NiralakamSharedTheme.paddingSmall,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      value,
                      textAlign: TextAlign.left,
                      style: style,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customImage(String value) {
  return Container(
    padding: NiralakamSharedTheme.edgeInsetsPaddingDoubleExtraLargeLTRB,
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 2,
                child: CachedNetworkImage(
                  imageUrl: value,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget paragraph(String value, TextStyle style) {
  return Padding(
    padding: NiralakamSharedTheme.edgeInsetsPaddingDoubleExtraLargeLR,
    child: Container(
      decoration: NiralakamSharedTheme.decoration,
      child: Padding(
        padding: NiralakamSharedTheme.edgeInsetsPaddingDoubleExtraLargeLTRB,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    value,
                    style: NiralakamSharedTheme.subContentHeader,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
