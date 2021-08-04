import 'package:ProGuidance/model/card_horizontal_first_with_sub_widget_model.dart';
import 'package:ProGuidance/models/weapon_types.dart';
import 'package:ProGuidance/utils/best_attachment_set_list/best_attachment_set_list.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/utils/sub_header_widget/sub_header_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ComparisonRangeWidget extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final Detail firstData;
  final Detail secondData;
  const ComparisonRangeWidget(
      {Key key,
      this.animationController,
      this.animation,
      this.firstData,
      this.secondData})
      : super(key: key);

  formatVestTableDetails(List<Head> weaponsModelDetails) {
    List<ShortToKillModel> result = <ShortToKillModel>[];
    weaponsModelDetails.forEach((element) {
      var src = "";
      if (element.key.contains('1')) {
        src =
            "https://raw.githubusercontent.com/AnanthGopal/niralaakam/main/pubg/weapons/Item/Equipment/Vest/Item_Armor_E_01_Lv1_C.png";
      } else if (element.key.contains('2')) {
        src =
            "https://raw.githubusercontent.com/AnanthGopal/niralaakam/main/pubg/weapons/Item/Equipment/Vest/Item_Armor_D_01_Lv2_C.png";
      } else if (element.key.contains('3')) {
        src =
            "https://raw.githubusercontent.com/AnanthGopal/niralaakam/main/pubg/weapons/Item/Equipment/Vest/Item_Armor_C_01_Lv3_C.png";
      }
      result.add(new ShortToKillModel(
        name: element.key,
        src: src,
        value: element.value,
      ));
    });
    return result;
  }

  formatHeadTableDetails(List<Head> weaponsModelDetails) {
    List<ShortToKillModel> result = <ShortToKillModel>[];
    weaponsModelDetails.forEach((element) {
      var src = "";
      if (element.key.contains('1')) {
        src =
            "https://raw.githubusercontent.com/AnanthGopal/niralaakam/main/pubg/weapons/Item/Equipment/Headgear/Item_Head_E_01_Lv1_C.png";
      } else if (element.key.contains('2')) {
        src =
            "https://raw.githubusercontent.com/AnanthGopal/niralaakam/main/pubg/weapons/Item/Equipment/Headgear/Item_Head_F_01_Lv2_C.png";
      } else if (element.key.contains('3')) {
        src =
            "https://raw.githubusercontent.com/AnanthGopal/niralaakam/main/pubg/weapons/Item/Equipment/Headgear/Item_Head_G_01_Lv3_C.png";
      }
      result.add(new ShortToKillModel(
        name: element.key,
        src: src,
        value: element.value,
      ));
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: AppTheme.subTransform(animation),
            child: Padding(
              padding: AppTheme.edgeInsetsPaddingListView,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.boxBackgroud.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: AppTheme.paddingDoubleExtraLarge,
                    bottom: AppTheme.paddingDoubleExtraLarge,
                    left: AppTheme.paddingDoubleExtraLarge,
                    right: AppTheme.paddingDoubleExtraLarge,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: generateInfoData(firstData),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppTheme.paddingDoubleExtraLarge,
                          right: AppTheme.paddingDoubleExtraLarge,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 1,
                              height: 1300,
                              color: AppTheme.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: generateInfoData(secondData)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  generateInfoData(Detail data) {
    var result = <Widget>[];
    result.add(SubHeaderWidget(
      titleTxt: data.key.toUpperCase(),
      animation: AppTheme.animationOption(animationController),
      animationController: animationController,
    ));
    result.add(AppTheme.sizedBoxEmpty);
    result.add(Container(
      child: Column(children: rangeDetails(data.range)),
    ));
    result.add(
      Padding(
        padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLTRB,
        child: Container(
          height: 2,
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
    );
    result.add(Container(
      child: Column(children: infoDetails(data.info)),
    ));
    result.add(
      Padding(
        padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLTRB,
        child: Container(
          height: 2,
          decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
    );
    result.add(SubHeaderWidget(
      titleTxt: 'Head Shots to Kill',
      animation: AppTheme.animationOption(animationController),
      animationController: animationController,
    ));
    result.add(AppTheme.sizedBoxEmpty);

    result.add(Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppTheme.fontPrimaryColor,
        gradient: LinearGradient(
            colors: [AppTheme.primaryColor, AppTheme.darkprimaryColor],
            begin: Alignment.centerRight,
            end: Alignment(-1.0, -1.0)), //Gradient
      ),
      child: loadShotToKillAnalysisDetails(
          'Head', formatHeadTableDetails(data.head)),
    ));
    result.add(Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    ));
    result.add(SubHeaderWidget(
      titleTxt: 'Vest Shots to Kill',
      animation: AppTheme.animationOption(animationController),
      animationController: animationController,
    ));
    result.add(AppTheme.sizedBoxEmpty);
    result.add(Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppTheme.fontPrimaryColor,
        gradient: LinearGradient(
            colors: [AppTheme.primaryColor, AppTheme.darkprimaryColor],
            begin: Alignment.centerRight,
            end: Alignment(-1.0, -1.0)), //Gradient
      ),
      child: loadShotToKillAnalysisDetails(
          'Vest', formatVestTableDetails(data.vest)),
    ));
    result.add(Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    ));
    result.add(SubHeaderWidget(
      titleTxt: 'Best Attachement',
      animation: AppTheme.animationOption(animationController),
      animationController: animationController,
    ));
    result.add(AppTheme.sizedBoxEmpty);
    result.add(BestAttachmentSetList1(
      data: data.attachements,
      mainScreenAnimation: AppTheme.animationOption(animationController),
      mainScreenAnimationController: animationController,
      width: 110,
      height: 280,
    ));
    return result;
  }
}

rangeDetails(List<Head> range) {
  var result = <Widget>[];
  range.forEach((element) {
    result.add(getWeaponRange(
      element.key,
      AppTheme.intToStringConvertor(element.value),
      AppTheme.stringToIntConvertor('100'),
    ));
    result.add(SizedBox(
      height: 3,
    ));
  });
  return result;
}

infoDetails(List<Head> range) {
  var result = <Widget>[];
  range.forEach((element) {
    result.add(
      widgetForComparisonWeaponDetails(
        element.key,
        AppTheme.intToStringConvertor(element.value),
      ),
    );
    result.add(SizedBox(
      height: 3,
    ));
  });
  return result;
}

rangeInfo(List<Head> range) {
  var result = <Widget>[];
  range.forEach((element) {
    result.add(getWeaponRange(
      element.key,
      AppTheme.intToStringConvertor(element.value),
      AppTheme.stringToIntConvertor('100'),
    ));
    result.add(SizedBox(
      height: 3,
    ));
  });
  return result;
}

getImage(url) {
  if (url != "") {
    return SizedBox(
      width: 30, height: 30,
      child: CachedNetworkImage(
        imageUrl: url,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      // child:
      // Image.network(url),
    );
  } else {
    return Icon(Icons.do_not_disturb, color: new Color(0xffffffff));
  }
}

ListTile dataWithIcon(String name, String url) {
  return ListTile(
    leading: getImage(url),
    title: Text(
      name,
      style: AppTheme.textStyleExtraSmallWhite,
    ),
  );
}

SingleChildScrollView loadShotToKillAnalysisDetails(
    String title, List<ShortToKillModel> data) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: DataTable(
      columns: [
        DataColumn(
          label: Center(
            child: Text(
              "    " + title + "     " + "Shots",
              textAlign: TextAlign.right,
              style: AppTheme.textStyleSmallWhite,
            ),
          ),
        ),
      ],
      rows: data
          .map(
            (element) => DataRow(
              cells: <DataCell>[
                DataCell(
                  Center(
                    child: dataWithIcon(element.value, element.src),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    ),
  );
}

Widget widgetForComparisonWeaponDetails(firstColumnTitle, firstColumnValue) {
  return Padding(
    padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    firstColumnTitle,
                    textAlign: TextAlign.center,
                    style: AppTheme.subContentHeader,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      firstColumnValue,
                      textAlign: TextAlign.center,
                      style: AppTheme.textStyleExtraSmallWithOpacity,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget getWeaponRange(name, value, precentage) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(children: <Widget>[
        Expanded(
          child: Text(
            name,
            textAlign: TextAlign.left,
            style: AppTheme.subContentHeader,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            value,
            textAlign: TextAlign.left,
            style: AppTheme.subContentHeader,
          ),
        )
      ]),
      Padding(
        padding: const EdgeInsets.only(top: 4),
        child: StepProgressIndicator(
          totalSteps: 100,
          currentStep: precentage,
          size: 8,
          padding: 0,
          selectedColor: Colors.yellow,
          unselectedColor: Colors.cyan,
          roundedEdges: Radius.circular(10),
          selectedGradientColor: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [HexColor('#00b4ab'), HexColor('#00b4ab')],
          ),
          unselectedGradientColor: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              HexColor('#00b4ab').withOpacity(0.2),
              HexColor('#00b4ab').withOpacity(0.2)
            ],
          ),
        ),
      ),
    ],
  );
}
