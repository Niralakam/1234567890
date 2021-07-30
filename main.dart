import 'package:ProGuidance/home.dart';
import 'package:ProGuidance/injection_locator.dart';
import 'package:ProGuidance/utils/common_widget/common_widget.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:ProGuidance/utils/custom_flutter_easyloading/custom_flutter_easyloading.dart';
import 'dart:io';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjectionLocator();
  // CatcherOptions debugOptions =
  //     CatcherOptions(DialogReportMode(), [ConsoleHandler()]);

  // CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
  //   EmailManualHandler([Constant.mailId])
  // ]);

  // Catcher(
  //     rootWidget: MyApp(),
  //     debugConfig: debugOptions,
  //     releaseConfig: releaseOptions);
  runApp(MyApp());
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = AppTheme.primaryColor
    ..indicatorColor = Colors.black
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomFlutterEasyLoading();
}

Widget buildError(BuildContext context, FlutterErrorDetails error) {
  return Scaffold(
    body: Center(
      child: Text(
        "Error appeared.",
        style: AppTheme.appBarTextStyle,
      ),
    ),
  );
}

// ignore: must_be_immutable
class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  updateLoading(bool a) {
    setState(() {
      _isLoading = a;
    });
  }

  Widget buildLoadingOverlay(isHideLoading) {
    if (isHideLoading) {
      return NavigationHomeScreen((bool a) => updateLoading(a));
    } else {
      return LoadingOverlay(
        child: NavigationHomeScreen((bool a) => updateLoading(a)),
        isLoading: _isLoading,
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.cyanAccent,
          valueColor: new AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
          strokeWidth: 5,
        ),
        color: AppTheme.primaryColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          buildLoadingOverlay(false),
          CommonWidget.rainDropAnimation(true),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      navigatorKey: Catcher.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      builder: EasyLoading.init(),
    );
  }
}
