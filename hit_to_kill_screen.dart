import 'package:ProGuidance/data/damage_data.dart';
import 'package:ProGuidance/utils/common_widget/common_widget.dart';
import 'package:ProGuidance/models/damage_model.dart';
import 'package:ProGuidance/resources/constant.dart';
import 'package:ProGuidance/screens/hit_to_kill_screen/sub_widget/hit_to_kill_canvas_widget.dart';
import 'package:ProGuidance/utils/app_bar.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ProGuidance/ad_manager.dart';

class HitToKillScreen extends StatefulWidget {
  const HitToKillScreen({Key key}) : super(key: key);

  @override
  _HitToKillScreenState createState() => _HitToKillScreenState();
}

class _HitToKillScreenState extends State<HitToKillScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> topBarAnimation;
  List<Widget> listViews = <Widget>[];
  List<String> weapons = DamageData.guns;
  List<String> vestLevels = DamageData.vestLevels;
  List<String> distanceLevels = DamageData.distanceLevels;
  List<String> helmetLevels = DamageData.helmetLevels;
  var selectedWeapon = 'AKM';
  var selectedVestLevel = 'Vest Level 0';
  var selectedHelmetLevel = 'Helmet Level 0';
  var selectedPreviousWeapon = '';
  var selectedPreviousVestLevel = '';
  var selectedPreviousHelmetLevel = '';
  var selectedDistanceValue = '0m to 50m';
  var selectedPerviousDistanceValue = '';
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  var selectedCurrency;
  @override
  void initState() {
    if (AdManager.isShowAdd) {
      AdManager.loadInterstitialAd();
    }
    animationController = AnimationController(
        duration: Duration(milliseconds: AppTheme.milliseconds), vsync: this);
    init();
    super.initState();
  }

  getDistance(String level) {
    switch (level) {
      case "0m to 50m":
        return 0;
        break;
      case "50m to 75m":
        return 1;
        break;
      case "75m to 100m":
        return 2;
        break;
      case "100m to 150m":
        return 3;
        break;
      case "150m to 200m":
        return 4;
        break;
    }
  }

  getlevel(level) {
    if (level == 'Vest Level 0' || level == 'Helmet Level 0') {
      return 0;
    } else if (level == 'Vest Level 1' || level == 'Helmet Level 1') {
      return 1;
    } else if (level == 'Vest Level 2' || level == 'Helmet Level 2') {
      return 2;
    } else {
      return 3;
    }
  }

  void init() {
    if (selectedWeapon != selectedPreviousWeapon ||
        selectedVestLevel != selectedPreviousVestLevel ||
        selectedHelmetLevel != selectedPreviousHelmetLevel ||
        selectedDistanceValue != selectedPerviousDistanceValue) {
      listViews = [];
      selectedPreviousVestLevel = selectedVestLevel;
      selectedPreviousHelmetLevel = selectedHelmetLevel;
      selectedPreviousWeapon = selectedWeapon;
      selectedPerviousDistanceValue = selectedDistanceValue;
      DamageModel damage = DamageData.damageDetails.firstWhere(
          (element) =>
              element.helmetLevel == getlevel(selectedHelmetLevel) &&
              element.vestLevel == getlevel(selectedVestLevel) &&
              element.distance == getDistance(selectedDistanceValue),
          orElse: () => null);
      DamageDetailsModel damageDetails = damage.data.firstWhere(
          (element) => element.weapon == selectedWeapon,
          orElse: () => null);
      if (AdManager.isShowAdd) {
        listViews.add(AdManager.getBanner(true));
      }
      listViews.add(loadDropDownWidget());
      listViews.add(loadDropDownAndRangeWidget());
      listViews.add(
        new HitToKillCanvasWidget(
            mainScreenAnimation: AppTheme.animationOption(animationController),
            mainScreenAnimationController: animationController,
            data: damageDetails),
      );
      listViews.add(AdManager.getNativeAdmob(true));
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              CommonWidget.getMainListViewUI(
                scrollController,
                listViews,
                animationController,
                '',
              ),
              appBar(
                Constant.hitToKill,
                MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadDropDownWidget() {
    var children2 = <Widget>[
      AppTheme.sizedBoxEmpty,
      DropdownButton(
        items: vestLevels.map((element) {
          return new DropdownMenuItem<String>(
            child: Text(
              element,
              style: AppTheme.textStyleLargeWithPrimaryColor,
            ),
            value: element,
          );
        }).toList(),
        onChanged: (currencyValue) {
          setState(() {
            selectedVestLevel = currencyValue;
          });
          init();
        },
        value: selectedVestLevel,
        isExpanded: true,
      ),
    ];
    return Padding(
      padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLR,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children2,
            ),
          ),
          AppTheme.sizedBoxEmpty,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppTheme.sizedBoxEmpty,
                DropdownButton(
                  items: helmetLevels.map((element) {
                    return new DropdownMenuItem<String>(
                      child: Text(
                        element,
                        style: AppTheme.textStyleLargeWithPrimaryColor,
                      ),
                      value: element,
                    );
                  }).toList(),
                  onChanged: (currencyValue) {
                    setState(() {
                      selectedHelmetLevel = currencyValue;
                    });
                    init();
                  },
                  value: selectedHelmetLevel,
                  isExpanded: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loadDropDownAndRangeWidget() {
    weapons.sort((a, b) => a.compareTo(b));
    return Padding(
      padding: AppTheme.edgeInsetsPaddingDoubleExtraLargeLR,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppTheme.sizedBoxEmpty,
                DropdownButton(
                  items: weapons.map((element) {
                    return new DropdownMenuItem<String>(
                      child: Text(
                        element,
                        style: AppTheme.textStyleLargeWithPrimaryColor,
                      ),
                      value: element,
                    );
                  }).toList(),
                  onChanged: (currencyValue) {
                    setState(() {
                      selectedWeapon = currencyValue;
                    });
                    init();
                  },
                  value: selectedWeapon,
                  isExpanded: true,
                ),
              ],
            ),
          ),
          AppTheme.sizedBoxEmpty,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppTheme.sizedBoxEmpty,
                DropdownButton(
                  items: distanceLevels.map((element) {
                    return new DropdownMenuItem<String>(
                      child: Text(
                        element,
                        style: AppTheme.textStyleLargeWithPrimaryColor,
                      ),
                      value: element,
                    );
                  }).toList(),
                  onChanged: (currencyValue) {
                    setState(() {
                      selectedDistanceValue = currencyValue;
                    });
                    init();
                  },
                  value: selectedDistanceValue,
                  isExpanded: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
