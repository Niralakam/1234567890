import 'package:ProGuidance/screens/hit_to_kill_screen/hit_to_kill_screen.dart';
import 'package:ProGuidance/views/maps_view/map_view.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/utils/custom_drawer_widget/custom_drawer_widget.dart';
import 'package:ProGuidance/utils/custom_drawer_widget/home_drawer.dart';
import 'package:ProGuidance/views/application_view/application_view.dart';
import 'package:ProGuidance/views/consumables_view/consumables_view.dart';
import 'package:ProGuidance/views/device_based_sensitivity_view/device_based_sensitivity_view.dart';
import 'package:ProGuidance/views/player_based_sensitivity_view/player_based_sensitivity_view.dart';
import 'package:ProGuidance/views/privacy_policy_view/privacy_policy_view.dart';
import 'package:ProGuidance/views/screen_layouts_view/screen_layouts.dart';
import 'package:ProGuidance/views/vehicles_view/vehiclesView.dart';
import 'package:ProGuidance/views/circle_view/circle_view.dart';
import 'package:ProGuidance/views/weapons_compare_view/weapons_compare_view.dart';
import 'package:ProGuidance/views/weapons_view/weapons_view.dart';
import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';

class NavigationHomeScreen extends StatefulWidget {
  final Function(bool a) isLoading;
  NavigationHomeScreen(this.isLoading);
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  @override
  void initState() {
    //Admob.initialize(testDeviceIds: ['28100FD2AE2AFBAB03CA300B024959A2']);
    Admob.initialize();
    drawerIndex = DrawerIndex.Map;
    screenView = MapView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: CustomDrawerWidget(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) async {
              await changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  Future<void> changeIndex(DrawerIndex drawerIndexdata) async {
    drawerIndex = drawerIndexdata;
    switch (drawerIndex) {
      case DrawerIndex.DeviceBasedSensitivity:
        setState(() {
          screenView = DeviceBasedSensitivityView();
        });
        break;
      case DrawerIndex.PlayerBasedSensitivity:
        setState(() {
          screenView = PlayerBasedSensitivityView();
        });
        break;
      case DrawerIndex.Weapons:
        setState(() {
          screenView = WeaponsView();
        });
        break;
      case DrawerIndex.WeaponComparison:
        setState(() {
          screenView = WeaponsCompare();
        });
        break;
      case DrawerIndex.Map:
        setState(() {
          screenView = MapView();
        });
        break;
      case DrawerIndex.CircleShrink:
        setState(() {
          screenView = CircleView();
        });
        break;
      case DrawerIndex.HitToKill:
        setState(() {
          screenView = HitToKillScreen();
        });
        break;
      case DrawerIndex.ScreenLayouts:
        setState(() {
          screenView = ScreenLayouts();
        });
        break;
      case DrawerIndex.PrivacyPolicy:
        setState(() {
          screenView = PrivacyPolicyView();
        });
        break;
      case DrawerIndex.Vehicles:
        setState(() {
          screenView = VehiclesView();
        });
        break;
      case DrawerIndex.Consumables:
        setState(() {
          screenView = ConsumablesView();
        });
        break;
      default:
        setState(() {
          screenView = ApplicationView();
        });
        break;
    }
  }
}
