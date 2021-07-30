import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ProGuidance/model/map_details_widget_model.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:math';
import 'package:meta/meta.dart';

@immutable
// ignore: must_be_immutable
class MapInitialWidget extends StatefulWidget {
  MapInitialWidget(
      {Key key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.maps,
      this.selected})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;
  final List<MapElement> maps;
  MapElement selected;
  @override
  _MapInitialWidgetState createState() => _MapInitialWidgetState();
}

const double min = pi * -2;
const double max = pi * 0.5;

const double minScale = 0.3;
const double defScale = 0.1;
const double maxScale = 3;

class _MapInitialWidgetState extends State<MapInitialWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;
  PhotoViewControllerBase controller;
  PhotoViewScaleStateController scaleStateController;
  int calls = 0;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: AppTheme.milliseconds),
      vsync: this,
    );
    controller = PhotoViewController()
      ..scale = defScale
      ..outputStateStream.listen(onController);

    scaleStateController = PhotoViewScaleStateController()
      ..outputScaleStateStream.listen(onScaleState);
    super.initState();
  }

  void onController(PhotoViewControllerValue value) {
    setState(() {
      calls += 1;
    });
  }

  void onScaleState(PhotoViewScaleState scaleState) {
    print(scaleState);
  }

  @override
  void dispose() {
    controller.dispose();
    scaleStateController.dispose();
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
              padding: AppTheme.edgeInsetsPaddingListViewLRB,
              child: SizedBox(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 430,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: getMapTile(widget.maps),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ClipRect(
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: PhotoView(
                                      imageProvider:
                                          NetworkImage(widget.selected.value),
                                      loadingBuilder: (context, event) {
                                        if (event == null) {
                                          return const Center(
                                            child: Text("Loading"),
                                          );
                                        }
                                        final value = event
                                                .cumulativeBytesLoaded /
                                            (event.expectedTotalBytes ??
                                                event.cumulativeBytesLoaded);

                                        final percentage =
                                            (100 * value).floor();
                                        return Center(
                                          child: Text("$percentage%"),
                                        );
                                      },
                                      controller: controller,
                                      scaleStateController:
                                          scaleStateController,
                                      enableRotation: true,
                                      initialScale: 0.4,
                                      minScale: minScale,
                                      maxScale: maxScale,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    height: 180,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      child: StreamBuilder(
                                        stream: controller.outputStateStream,
                                        initialData: controller.value,
                                        builder: _streamBuild,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
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

  getMapTile(List<MapElement> maps) {
    var result = <Widget>[];
    maps.forEach((element) {
      IconData icon = FontAwesomeIcons.mapMarkedAlt;
      if (element.key.contains("map")) {
        icon = FontAwesomeIcons.mapMarkedAlt;
      } else if (element.key.contains("boat")) {
        icon = FontAwesomeIcons.ship;
      } else if (element.key.contains("vehicles")) {
        icon = FontAwesomeIcons.car;
      } else {
        icon = FontAwesomeIcons.warehouse;
      }
      result.add(getButtonDetails(element, icon));
    });
    return result;
  }

  getIconColor(value) {
    return widget.selected.key == value
        ? AppTheme.primaryColor
        : AppTheme.fontPrimaryColor;
  }

  getTitleColor(value) {
    return widget.selected.key == value
        ? AppTheme.textStyleExtraSmallWithPrimaryColor
        : AppTheme.textStyleExtraSmallWithBlackColor;
  }

  getButtonDetails(MapElement value, icon) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        setState(() {
          widget.selected = value;
        });
      },
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: getIconColor(value.key),
          ),
          Text(
            value.key,
            style: getTitleColor(value.key),
          ),
        ],
      ),
    );
  }

  Widget _streamBuild(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError || !snapshot.hasData) {
      return Container();
    }
    final PhotoViewControllerValue value = snapshot.data;
    return Column(
      children: <Widget>[
        Row(
          children: [
            Text(
              "Rotation",
              style: AppTheme.textStyleSmallWithWhite,
            ),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppTheme.primaryColor,
                    thumbColor: AppTheme.primaryColor),
                child: Slider(
                  value: value.rotation.clamp(min, max),
                  min: min,
                  max: max,
                  onChanged: (double newRotation) {
                    controller.rotation = newRotation;
                  },
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              "Scale    ",
              style: AppTheme.textStyleSmallWithWhite,
            ),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppTheme.primaryColor,
                  thumbColor: AppTheme.primaryColor,
                ),
                child: Slider(
                  value: value.scale.clamp(minScale, maxScale),
                  min: minScale,
                  max: maxScale,
                  onChanged: (double newScale) {
                    controller.scale = newScale;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Position ",
              style: AppTheme.textStyleSmallWithWhite,
            ),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppTheme.primaryColor,
                  thumbColor: AppTheme.primaryColor,
                ),
                child: Slider(
                  value: value.position.dx,
                  min: -100.0,
                  max: 800.0,
                  onChanged: (double newPosition) {
                    controller.position =
                        Offset(newPosition, controller.position.dy);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
