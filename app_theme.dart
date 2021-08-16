import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static InlineSpan rainDropAnimationTitle = TextSpan(
    text: 'CONTORL',
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppTheme.white,
    ),
    children: [
      TextSpan(
        text: ' LAYOUT ',
        style: TextStyle(color: Colors.red, fontSize: 16),
      ),
      TextSpan(
        text: 'GUIDANCE',
        style: TextStyle(color: AppTheme.white, fontSize: 16),
      ),
    ],
  );
  static InlineSpan applicationtitle = TextSpan(
    text: 'Contol',
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppTheme.primaryColor,
    ),
    children: [
      TextSpan(
        text: ' Layout ',
        style: TextStyle(color: Colors.red, fontSize: 18),
      ),
      TextSpan(
        text: 'Guidance',
        style: TextStyle(color: AppTheme.primaryColor, fontSize: 18),
      ),
    ],
  );
  static int milliseconds = 700;
  static const double fontSizeDoubleExtraSmall = 10;
  static const double fontSizeExtraSmall = 10;
  static const double fontSizeSmall = 12;
  static const double fontSizeMedium = 14;
  static const double fontSizeLarge = 16;
  static const double fontSizeExtraLarge = 18;
  static const double fontSizeDoubleExtraLarge = 20;
  static const double fontSizeTripleExtraLarge = 22;

  static const double letterSpacing = 0.27;

  static FontWeight fontWeightDoubleExtraSmall = FontWeight.w100;
  static FontWeight fontWeightExtraSmall = FontWeight.w200;
  static FontWeight fontWeightSmall = FontWeight.w300;
  static FontWeight fontWeightMedium = FontWeight.w400;
  static FontWeight fontWeightLarge = FontWeight.w500;
  static FontWeight fontWeightExtraLarge = FontWeight.w600;
  static FontWeight fontWeightDoubleExtraLarge = FontWeight.w800;

  static const double paddingTripleExtraSmall = 8;
  static const double paddingDoubleExtraSmall = 4;
  static const double paddingExtraSmall = 6;
  static const double paddingSmall = 8;
  static const double paddingMedium = 10;
  static const double paddingLarge = 12;
  static const double paddingExtraLarge = 14;
  static const double paddingDoubleExtraLarge = 16;
  static const double paddingTripleExtraLarge = 24;

  static const double heightSpace = 4;

  static Color primaryColor = HexColor('#2E4E5D');
  static Color darkprimaryColor = HexColor('#0090b4');
  static Color fontPrimaryColor = Colors.black;
  static Color fontSecondaryColor = Colors.white;

  static Color boxBackgroud = HexColor('#e1e4e6');

  static Color boxBackgroudWithOpacity = AppTheme.boxBackgroud.withOpacity(0.6);
  static Color notWhite = Color(0xFFEDF0F2);
  static Color nearlyWhite = Color(0xFFFEFEFE);
  static Color white = Color(0xFFFFFFFF);
  static Color background = Color(0xFFF2F3F8);
  static Color nearlyDarkBlue = Color(0xFF2633C5);
  static Color grey = Color(0xFF3A5160);
  static Color greyWithOpacityLow = AppTheme.grey.withOpacity(0.2);
  static Color greyWithOpacityMedium = AppTheme.grey.withOpacity(0.5);
  static Color greyWithOpacityhigh = AppTheme.grey.withOpacity(0.4);

  static Color lightGreyWithOpacityLow = HexColor('#e1e4e6').withOpacity(0.3);
  static Color lightGreyWithOpacityMedium =
      HexColor('#e1e4e6').withOpacity(0.6);
  static Color lightGreyWithOpacityhigh = HexColor('#e1e4e6').withOpacity(0.9);

  static Color nearlyBlue = Color(0xFF00B6F0);
  static Color nearlyBlack = Color(0xFF213333);
  static Color dark_grey = Color(0xFF313A44);

  static Color darkText = Color(0xFF253840);
  static Color darkerText = Color(0xFF17262A);
  static Color lightText = Color(0xFF4A6572);
  static Color deactivatedText = Color(0xFF767676);
  static Color dismissibleBackground = Color(0xFF364A54);
  static Color spacer = Color(0xFFF2F2F2);

  static TextStyle header = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );

  static TextStyle subContentHeader = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: 13,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.lightText,
  );

  static TextStyle subContentHeaderWithPrimary = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: fontSizeSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );

  static TextStyle subContentHeaderWithRed = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: fontSizeSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: Colors.red,
  );
  static Decoration sensitivityCardDecoration = BoxDecoration(
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: AppTheme.darkprimaryColor.withOpacity(0.6),
          offset: Offset(1.1, 4.0),
          blurRadius: 8.0),
    ],
    gradient: LinearGradient(
      colors: <HexColor>[
        AppTheme.darkprimaryColor,
        AppTheme.primaryColor,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: const BorderRadius.only(
      bottomRight: Radius.circular(8.0),
      bottomLeft: Radius.circular(8.0),
      topLeft: Radius.circular(8.0),
      topRight: Radius.circular(54.0),
    ),
  );
  static TextStyle appBarTextStyle = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightExtraLarge,
    fontSize: AppTheme.fontSizeTripleExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );
  static EdgeInsets edgeInsetsPaddingDoubleExtraLargeT = EdgeInsets.only(
    top: AppTheme.paddingLarge,
  );

  static EdgeInsets edgeInsetsPaddingDoubleExtraLargeLR = EdgeInsets.only(
    top: 0,
    left: AppTheme.paddingDoubleExtraLarge,
    right: AppTheme.paddingDoubleExtraLarge,
  );
  static EdgeInsets edgeInsetsPaddingDoubleExtraLargeLRT = EdgeInsets.only(
    left: AppTheme.paddingDoubleExtraLarge,
    right: AppTheme.paddingDoubleExtraLarge,
    top: AppTheme.paddingSmall,
  );

  static EdgeInsets edgeInsetsPaddingDoubleExtraLargeLRB = EdgeInsets.only(
    left: AppTheme.paddingDoubleExtraLarge,
    right: AppTheme.paddingDoubleExtraLarge,
    bottom: AppTheme.paddingDoubleExtraLarge,
  );
  static EdgeInsets edgeInsetsPaddingDoubleExtraLargeLTRB = EdgeInsets.only(
    left: AppTheme.paddingDoubleExtraLarge,
    right: AppTheme.paddingDoubleExtraLarge,
    top: AppTheme.paddingDoubleExtraLarge,
    bottom: AppTheme.paddingDoubleExtraLarge,
  );

  static EdgeInsets edgeInsetsPaddingTripleExtraSmallLTRB = EdgeInsets.only(
    top: AppTheme.paddingTripleExtraSmall,
    bottom: AppTheme.paddingTripleExtraSmall,
    right: AppTheme.paddingTripleExtraSmall,
    left: AppTheme.paddingTripleExtraSmall,
  );

  static EdgeInsets edgeInsetsPaddingLargeLTRB = EdgeInsets.only(
    top: AppTheme.paddingLarge,
    bottom: AppTheme.paddingLarge,
    right: AppTheme.paddingLarge,
    left: AppTheme.paddingLarge,
  );
  static EdgeInsets edgeInsetsPaddingLargeRLB = EdgeInsets.only(
    right: AppTheme.paddingLarge,
    left: AppTheme.paddingLarge,
    bottom: AppTheme.paddingLarge,
  );

  static Decoration decoration = BoxDecoration(
    color: AppTheme.boxBackgroud.withOpacity(0.6),
    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
  );

  static BorderRadius borderRadiusLow = BorderRadius.all(Radius.circular(8.0));
  static BorderRadius borderRadiusMedium =
      BorderRadius.all(Radius.circular(16.0));
  static BorderRadius borderRadiusHigh =
      BorderRadius.all(Radius.circular(32.0));

  static EdgeInsets edgeInsetsPaddingListView = EdgeInsets.only(
    top: AppTheme.paddingMedium,
    bottom: AppTheme.paddingDoubleExtraLarge,
    right: AppTheme.paddingDoubleExtraLarge,
    left: AppTheme.paddingDoubleExtraLarge,
  );
  static EdgeInsets edgeInsetsPaddingListViewLRB = EdgeInsets.only(
    bottom: AppTheme.paddingDoubleExtraLarge,
    right: AppTheme.paddingDoubleExtraLarge,
    left: AppTheme.paddingDoubleExtraLarge,
  );
  static SizedBox sizedBoxEmpty = SizedBox(
    height: AppTheme.heightSpace,
  );
  static TextStyle textStyleDoubleExtraLargeWithPrimaryColor = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeDoubleExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );

  static TextStyle textStyleDoubleExtraSmallWithPrimaryColor = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeDoubleExtraSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );

  static TextStyle textStyleTripleExtraLargeWithPrimaryColor = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeTripleExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );

  static TextStyle textStyleTripleExtraLargeBlack = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeTripleExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: Colors.black,
  );
  static TextStyle textStyleExtraLargeWithPrimaryColor = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );

  static TextStyle textStyleExtraSmallWithPrimaryColor = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeExtraSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );

  static TextStyle textStyleExtraSmallWithBlackColor = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.fontPrimaryColor,
  );
  static TextStyle textStyleExtraSmallWithSecondaryColor = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeExtraSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.fontSecondaryColor,
  );
  static TextStyle textStyleSmallWithWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: Colors.white,
  );
  static TextStyle textStyleExtraSmallWithWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeExtraSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: Colors.white,
  );
  static TextStyle textStyleLargeWithPrimaryColor = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );
  static TextStyle textStyleLargeWithWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.white,
  );
  static TextStyle textStyleTripleExtraLargeWithWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeTripleExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.white,
  );

  static TextStyle textStyleMediumWithPrimaryColor = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeMedium,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );

  static TextStyle textStyleSmallWithPrimaryColor = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightSmall,
    fontSize: AppTheme.fontSizeLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.primaryColor,
  );

  static TextStyle textStyleLargeWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.fontSecondaryColor,
  );
  static TextStyle textStyleDoubleExtraLargeWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeDoubleExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.fontSecondaryColor,
  );

  static TextStyle textStyleTripleExtraLargeWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeTripleExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.fontSecondaryColor,
  );

  static TextStyle textStyleExtraLargeWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightExtraLarge,
    fontSize: AppTheme.fontSizeExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.fontSecondaryColor,
  );
  static TextStyle textStyleSmallWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.fontSecondaryColor,
  );
  static TextStyle textStyleDoubleExtraSmallWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeDoubleExtraSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.fontSecondaryColor,
  );
  static TextStyle textStyleExtraSmallWhite = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeExtraSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.fontSecondaryColor,
  );
  static TextStyle textStyleDoubleExtraLarge = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeDoubleExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.lightText,
  );

  static TextStyle textStyleDoubleExtraSmall = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeDoubleExtraSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.lightText,
  );

  static TextStyle textStyleExtraLarge = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.lightText,
  );

  static TextStyle textStyleExtraSmall = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.lightText,
  );

  static TextStyle textStyleLarge = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.lightText,
  );

  static TextStyle textStyleMedium = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightMedium,
    fontSize: AppTheme.fontSizeLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.lightText,
  );

  static TextStyle textStyleSmall = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightSmall,
    fontSize: AppTheme.fontSizeSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.lightText,
  );

  static TextStyle textStyleDoubleExtraLargeWithOpacity = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeDoubleExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.grey.withOpacity(0.5),
  );

  static TextStyle textStyleDoubleExtraSmallWithOpacity = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeDoubleExtraSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.grey.withOpacity(0.5),
  );

  static TextStyle textStyleExtraLargeWithOpacity = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeExtraLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.grey.withOpacity(0.5),
  );

  static TextStyle textStyleExtraSmallWithOpacity = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeExtraSmall,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.grey.withOpacity(0.5),
  );

  static TextStyle textStyleLargeWithOpacity = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightLarge,
    fontSize: AppTheme.fontSizeLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.grey.withOpacity(0.5),
  );

  static TextStyle textStyleMediumWithOpacity = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightMedium,
    fontSize: AppTheme.fontSizeLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.grey.withOpacity(0.5),
  );

  static TextStyle textStyleSmallWithOpacity = GoogleFonts.lato(
    fontWeight: AppTheme.fontWeightSmall,
    fontSize: AppTheme.fontSizeLarge,
    letterSpacing: AppTheme.letterSpacing,
    color: AppTheme.grey.withOpacity(0.5),
  );

  static TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static TextStyle display1 = GoogleFonts.lato(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static TextStyle headline = GoogleFonts.lato(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static TextStyle title = GoogleFonts.lato(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static TextStyle subtitle = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static TextStyle body2 = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static TextStyle body1 = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static TextStyle caption = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static Animation animationOption(AnimationController animationController) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval((1 / 10) * 3, 1.0, curve: Curves.fastOutSlowIn)));
  }

  static Matrix4 transform(Animation<dynamic> mainScreenAnimation) {
    return Matrix4.translationValues(
        0.0, 20 * (1.0 - mainScreenAnimation.value), 0.0);
  }

  static Matrix4 subTransform(Animation<dynamic> mainScreenAnimation) {
    return Matrix4.translationValues(
        60 * (1.0 - mainScreenAnimation.value), 0.0, 0.0);
  }

  static int stringToIntConvertor(input) {
    return input != null ? double.parse(input).toInt() : 0;
  }

  static String intToStringConvertor(input) {
    return (input != null ? input.toString() : 'N/A');
  }

  static double intToDoubleConvertor(input) {
    return input != null ? int.parse(input).toDouble() : 0;
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
