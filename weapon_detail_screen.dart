import 'package:ProGuidance/model/card_horizontal_first_with_sub_widget_model.dart';
import 'package:ProGuidance/utils/common_widget/common_widget.dart';
import 'package:ProGuidance/utils/title_widget/title_widget.dart';
import 'package:ProGuidance/models/weapon_types.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/views/weapons_view/details/sub_widget/best_attachment_set_list.dart';
import 'package:ProGuidance/views/weapons_view/details/sub_widget/shots_to_kill_list_widget.dart';
import 'package:ProGuidance/views/weapons_view/details/sub_widget/weapon_range_details.dart';
import 'package:flutter/material.dart';
import 'package:ProGuidance/ad_manager.dart';

class WeaponDetailScreen extends StatefulWidget {
  const WeaponDetailScreen({Key key, this.data}) : super(key: key);
  final Detail data;

  @override
  _WeaponDetailScreenState createState() => _WeaponDetailScreenState();
}

class _WeaponDetailScreenState extends State<WeaponDetailScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> topBarAnimation;
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  List<Widget> listRanges = <Widget>[];
  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: AppTheme.milliseconds),
      vsync: this,
    );
    addAllListData();
    super.initState();
  }

  void addAllListData() {
    List<ShortToKillListModel> shortToKillHeadList = <ShortToKillListModel>[];
    List<ShortToKillListModel> shortToKillBodyList = <ShortToKillListModel>[];
    if (widget.data != null &&
        widget.data.head != null &&
        widget.data.head.length > 0) {
      List<ShortToKillModel> tempHeadList = <ShortToKillModel>[];
      widget.data.head.forEach((element) {
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
        tempHeadList.add(new ShortToKillModel(
          name: element.key,
          src: src,
          value: element.value,
        ));
      });
      shortToKillHeadList.add(
        ShortToKillListModel(columns: ["Helmet", "Kill"], data: tempHeadList),
      );
    }
    if (widget.data != null &&
        widget.data.vest != null &&
        widget.data.vest.length > 0) {
      List<ShortToKillModel> tempBodyList = <ShortToKillModel>[];
      widget.data.vest.forEach((element) {
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
        tempBodyList.add(new ShortToKillModel(
          name: element.key,
          src: src,
          value: element.value,
        ));
      });
      shortToKillBodyList.add(
        ShortToKillListModel(columns: ["Vest", "Kill"], data: tempBodyList),
      );
    }
    listRanges.add(AdManager.getBanner(true));
    listRanges.add(
      TitleWidget(
        titleTxt: 'Weapon Range Info',
        subTxt: '',
        animation: AppTheme.animationOption(animationController),
        animationController: animationController,
      ),
    );
    if (widget.data != null) {
      listRanges.add(WeaponRangeDetails(
        animation: AppTheme.animationOption(animationController),
        animationController: animationController,
        data: widget.data,
        divider: 2,
      ));
    }
    listRanges.add(
      TitleWidget(
        titleTxt: 'Best Attachment Set',
        subTxt: '',
        animation: AppTheme.animationOption(animationController),
        animationController: animationController,
      ),
    );
    listRanges.add(
      BestAttachmentSetList(
        data: widget.data.attachements,
        mainScreenAnimation: AppTheme.animationOption(animationController),
        mainScreenAnimationController: animationController,
        width: 200,
        height: 180,
      ),
    );
    if (AdManager.isShowAdd) {
      listRanges.add(AdManager.getNativeAdmob(true));
    }
    listRanges.add(
      TitleWidget(
        titleTxt: 'Head Shot to kill Analysis',
        subTxt: '',
        animation: AppTheme.animationOption(animationController),
        animationController: animationController,
      ),
    );
    listRanges.add(
      ShotsToKillListWidget(
        data: shortToKillHeadList,
        title: "Helmet",
        mainScreenAnimation: AppTheme.animationOption(animationController),
        mainScreenAnimationController: animationController,
      ),
    );

    listRanges.add(
      TitleWidget(
        titleTxt: 'Body Shot to kill Analysis',
        subTxt: '',
        animation: AppTheme.animationOption(animationController),
        animationController: animationController,
      ),
    );
    listRanges.add(
      Padding(
        padding: const EdgeInsets.only(
          top: AppTheme.paddingTripleExtraSmall,
          left: AppTheme.paddingDoubleExtraLarge,
          right: AppTheme.paddingDoubleExtraLarge,
        ),
        child: Text(
          "View the hit to kill screen for more details because normally vest splited four part and each part have different damage",
          textAlign: TextAlign.start,
          style: AppTheme.subContentHeaderWithRed,
        ),
      ),
    );

    listRanges.add(
      ShotsToKillListWidget(
        data: shortToKillBodyList,
        title: "Vest",
        mainScreenAnimation: AppTheme.animationOption(animationController),
        mainScreenAnimationController: animationController,
      ),
    );
    if (AdManager.isShowAdd) {
      listRanges.add(AdManager.getNativeAdmob(true));
    }
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
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
                listRanges,
                animationController,
                '',
              ),
              navigationAppBarUI(widget.data.key),
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationAppBarUI(name) {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Container(
        decoration: BoxDecoration(color: AppTheme.background),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: TitleWidget(
                  titleTxt: name.toUpperCase(),
                  subTxt: '',
                  animation: AppTheme.animationOption(animationController),
                  animationController: animationController,
                ),
              ),
            ),
            Container(width: AppBar().preferredSize.height + 40)
          ],
        ),
      ),
    );
  }
}
