import 'package:ProGuidance/models/weapon_types.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class ShotsToKillListWidget extends StatefulWidget {
  const ShotsToKillListWidget(
      {Key key,
      this.title,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.data})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  final List<ShortToKillListModel> data;
  final String title;
  @override
  _ShotsToKillListWidgetState createState() => _ShotsToKillListWidgetState();
}

class _ShotsToKillListWidgetState extends State<ShotsToKillListWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: AppTheme.milliseconds),
      vsync: this,
    );
    super.initState();
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
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: AppTheme.transform(widget.mainScreenAnimation),
            child: Container(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                itemCount: widget.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final Animation<double> animation =
                      AppTheme.animationOption(animationController);
                  animationController.forward();
                  return ShotsToKill(
                    title: widget.title,
                    data: widget.data[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
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
              title + ' Level         ',
              textAlign: TextAlign.right,
              style: AppTheme.textStyleSmallWhite,
            ),
          ),
        ),
        DataColumn(
          label: Center(
            child: Text(
              'Shots to kill                     ',
              textAlign: TextAlign.center,
              style: AppTheme.textStyleSmallWhite,
            ),
          ),
        ),
      ],
      rows: data
          .map(
            ((element) => DataRow(cells: <DataCell>[
                  DataCell(
                    dataWithIcon(element.name, element.src),
                  ),
                  DataCell(
                    Center(
                      child: Text(
                        element.value,
                        textAlign: TextAlign.center,
                        style: AppTheme.textStyleSmallWhite,
                      ),
                    ),
                  ),
                ])),
          )
          .toList(),
    ),
  );
}

getImage(url) {
  if (url != "") {
    return SizedBox(
      width: 30, height: 30,
      //  child: Image.network(url)
      child: CachedNetworkImage(
        imageUrl: url,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
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
      style: AppTheme.textStyleSmallWhite,
    ),
  );
}

class ShotsToKill extends StatelessWidget {
  const ShotsToKill(
      {Key key,
      this.title,
      this.data,
      this.animationController,
      this.animation})
      : super(key: key);

  final ShortToKillListModel data;
  final AnimationController animationController;
  final Animation<dynamic> animation;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: AppTheme.transform(animation),
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.boxBackgroud.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: AppTheme.fontPrimaryColor,
                          gradient: LinearGradient(
                              colors: [
                                AppTheme.primaryColor,
                                AppTheme.darkprimaryColor
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment(-1.0, -1.0)), //Gradient
                        ),
                        child: loadShotToKillAnalysisDetails(title, data.data),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
