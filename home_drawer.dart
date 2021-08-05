import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer(
      {Key key,
      this.screenIndex,
      this.iconAnimationController,
      this.callBackIndex})
      : super(key: key);

  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callBackIndex;

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<DrawerList> drawerList;
  @override
  void initState() {
    setdDrawerListArray();
    super.initState();
  }

  void setdDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.Map,
        labelName: 'Map Details',
        icon: Icon(
          FontAwesomeIcons.mapMarkedAlt,
        ),
      ),
      DrawerList(
        index: DrawerIndex.CircleShrink,
        labelName: 'Circle Shrink',
        icon: Icon(
          FontAwesomeIcons.circleNotch,
        ),
      ),
      DrawerList(
        index: DrawerIndex.Weapons,
        labelName: 'Weapons',
        icon: Icon(Icons.track_changes),
      ),
      DrawerList(
        index: DrawerIndex.WeaponComparison,
        labelName: 'Weapon Comparison',
        icon: Icon(Icons.compare),
      ),
      DrawerList(
        index: DrawerIndex.HitToKill,
        labelName: 'Hit To Kill',
        icon: Icon(Icons.transfer_within_a_station),
      ),
      DrawerList(
        index: DrawerIndex.Consumables,
        labelName: 'Consumables',
        icon: Icon(FontAwesomeIcons.car),
      ),
      DrawerList(
        index: DrawerIndex.Vehicles,
        labelName: 'Vehicles',
        icon: Icon(FontAwesomeIcons.car),
      ),
      DrawerList(
        index: DrawerIndex.ScreenLayouts,
        labelName: 'Control Layouts',
        icon: Icon(Icons.screen_lock_landscape),
      ),
      DrawerList(
        index: DrawerIndex.DeviceBasedSensitivity,
        labelName: 'RAM Sensitivity',
        icon: Icon(FontAwesomeIcons.memory),
      ),
      DrawerList(
        index: DrawerIndex.PlayerBasedSensitivity,
        labelName: 'Player Sensitivity',
        icon: Icon(FontAwesomeIcons.userCog),
      ),
      DrawerList(
        index: DrawerIndex.Application,
        labelName: 'About',
        icon: Icon(Icons.apps),
      ),
      DrawerList(
        index: DrawerIndex.PrivacyPolicy,
        labelName: 'Privacy Policy',
        icon: Icon(Icons.privacy_tip),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.notWhite.withOpacity(0.5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: AppBar().preferredSize.height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          left: 8,
                        ),
                        child: Container(
                          width: 30,
                          height: AppBar().preferredSize.height - 8,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(
                                AppBar().preferredSize.height),
                            child: Icon(
                              Icons.touch_app,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: AppTheme.applicationtitle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: AppTheme.primaryColor.withOpacity(0.6),
          ),
          AppTheme.sizedBoxEmpty,
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: drawerList.length,
              itemBuilder: (BuildContext context, int index) {
                return inkwell(drawerList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: AppTheme.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationtoScreen(listData.index);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 40.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Icon(
                    listData.icon.icon,
                    color: AppTheme.primaryColor,
                    size: 18,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    listData.labelName,
                    style: MediaQuery.of(context).size.width >= 375
                        ? AppTheme.textStyleLargeWithPrimaryColor
                        : AppTheme.textStyleMediumWithPrimaryColor,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            widget.screenIndex == listData.index
                ? AnimatedBuilder(
                    animation: widget.iconAnimationController,
                    builder: (BuildContext context, Widget child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            (MediaQuery.of(context).size.width * 0.75 - 64) *
                                (1.0 -
                                    widget.iconAnimationController.value -
                                    1.0),
                            0.0,
                            0.0),
                        child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * 0.75 - 64,
                            height: 46,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(28),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
    widget.callBackIndex(indexScreen);
  }
}

enum DrawerIndex {
  DeviceBasedSensitivity,
  PlayerBasedSensitivity,
  ScreenLayouts,
  Weapons,
  WeaponComparison,
  FeedBack,
  Help,
  Share,
  About,
  Map,
  CircleShrink,
  HitToKill,
  Invite,
  Testing,
  PrivacyPolicy,
  Application,
  Vehicles,
  Consumables
}

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.imageName = '',
  });

  String labelName;
  Icon icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex index;
}
