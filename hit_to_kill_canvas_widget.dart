import 'package:ProGuidance/models/damage_model.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class HitToKillCanvasWidget extends StatefulWidget {
  const HitToKillCanvasWidget({
    Key key,
    this.mainScreenAnimationController,
    this.mainScreenAnimation,
    this.data,
  }) : super(key: key);

  final AnimationController mainScreenAnimationController;
  final DamageDetailsModel data;
  final Animation<dynamic> mainScreenAnimation;
  @override
  _HitToKillCanvasWidgetState createState() => _HitToKillCanvasWidgetState();
}

class _HitToKillCanvasWidgetState extends State<HitToKillCanvasWidget>
    with TickerProviderStateMixin {
  ui.Image _originalImage;
  ui.Image _displayImage;
  final double increment = pi / 18;
  final String imagePath = 'assets/weapons/maps/body.png';
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: AppTheme.milliseconds),
      vsync: this,
    );
    loadImage(imagePath);
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
            child: getTextAlignment(),
          ),
        );
      },
    );
  }

  Widget getTextAlignment() {
    var screenSize = MediaQuery.of(context).size;
    if (screenSize != null &&
        screenSize.width != null &&
        _originalImage != null &&
        _originalImage.width != null) {
      final scale = (screenSize.width - 150) / _originalImage.width;
      return Padding(
        padding: AppTheme.edgeInsetsPaddingLargeRLB,
        child: Container(
          decoration: AppTheme.decoration,
          child: Row(
            children: <Widget>[
              AppTheme.sizedBoxEmpty,
              Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      child: new CustomPaint(
                        painter: new MyPainter(
                          image: _displayImage,
                          scale: scale,
                          selectedDamageDetails: widget.data,
                        ),
                        size: Size(
                          _displayImage.width * scale,
                          _displayImage.height * scale,
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
    } else {
      return Column(
        children: <Widget>[
          AppTheme.sizedBoxEmpty,
        ],
      );
    }
  }

  void loadImage(String filePath) async {
    ui.Image image = await imageFromFilePath(filePath);
    _originalImage = image;
    setState(() {
      _displayImage = image;
    });
  }
}

class MyPainter extends CustomPainter {
  final ui.Image image;
  final double scale;
  final DamageDetailsModel selectedDamageDetails;
  MyPainter({
    this.image,
    this.scale,
    this.selectedDamageDetails,
  });

  String calculateHitToKill(String input) {
    if (input.contains('/')) {
      var splitedData = input.split('/');
      double calculatedValue =
          int.parse(splitedData[0]) / int.parse(splitedData[1]);
      return calculatedValue.toStringAsFixed(0);
    } else {
      return input;
    }
  }

  ratioCalculation(double input) {
    return (input - 52).toDouble();
  }

  @override
  void paint(Canvas canvas, Size size) async {
    canvas.scale(scale);
    canvas.drawImage(image, Offset.zero, Paint());
    appendTextIntoCanvas(
      canvas,
      ratioCalculation(130),
      10,
      size,
      calculateHitToKill(selectedDamageDetails.head),
    );
    appendTextIntoCanvas(
      canvas,
      ratioCalculation(130),
      47,
      size,
      calculateHitToKill(selectedDamageDetails.neck),
    );
    appendTextIntoCanvas(
      canvas,
      ratioCalculation(130),
      60,
      size,
      calculateHitToKill(selectedDamageDetails.clavicles),
    );
    appendTextIntoCanvas(
      canvas,
      ratioCalculation(130),
      90,
      size,
      calculateHitToKill(selectedDamageDetails.upperChest),
    );
    appendTextIntoCanvas(
      canvas,
      ratioCalculation(130),
      135,
      size,
      calculateHitToKill(selectedDamageDetails.lowerChest),
    );
    appendTextIntoCanvas(
      canvas,
      ratioCalculation(130),
      165,
      size,
      calculateHitToKill(selectedDamageDetails.stomach),
    );
    appendTextIntoCanvas(
      canvas,
      ratioCalculation(130),
      190,
      size,
      calculateHitToKill(selectedDamageDetails.pelvis),
    );
    appendTextIntoCanvas(
      canvas,
      100,
      240,
      size,
      calculateHitToKill(selectedDamageDetails.upperLimb),
    );
    appendTextIntoCanvas(
      canvas,
      110,
      330,
      size,
      calculateHitToKill(selectedDamageDetails.lowerLimb),
    );
    appendTextIntoCanvas(
      canvas,
      115,
      380,
      size,
      calculateHitToKill(selectedDamageDetails.handFoot),
    );
    appendTextIntoCanvas(
      canvas,
      118,
      110,
      size,
      calculateHitToKill(selectedDamageDetails.upperLimb),
    );
    appendTextIntoCanvas(
      canvas,
      125,
      175,
      size,
      calculateHitToKill(selectedDamageDetails.lowerLimb),
    );
    appendTextIntoCanvas(
      canvas,
      135,
      215,
      size,
      calculateHitToKill(selectedDamageDetails.handFoot),
    );

    appendTextIntoCanvas(
      canvas,
      32,
      110,
      size,
      calculateHitToKill(selectedDamageDetails.upperLimb),
    );
    appendTextIntoCanvas(
      canvas,
      20,
      175,
      size,
      calculateHitToKill(selectedDamageDetails.lowerLimb),
    );
    appendTextIntoCanvas(
      canvas,
      10,
      215,
      size,
      calculateHitToKill(selectedDamageDetails.handFoot),
    );

    appendTextIntoCanvas(
      canvas,
      50,
      240,
      size,
      calculateHitToKill(selectedDamageDetails.upperLimb),
    );
    appendTextIntoCanvas(
      canvas,
      40,
      330,
      size,
      calculateHitToKill(selectedDamageDetails.lowerLimb),
    );
    appendTextIntoCanvas(
      canvas,
      35,
      380,
      size,
      calculateHitToKill(selectedDamageDetails.handFoot),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Future<ui.Image> imageFromFilePath(String filePath) async {
  var byteData = await rootBundle.load(filePath);
  Uint8List lst = Uint8List.view(byteData.buffer);
  var codec = await ui.instantiateImageCodec(lst);
  var nextFrame = await codec.getNextFrame();
  return nextFrame.image;
}

appendTextIntoCanvas(
    Canvas canvas, double x, double y, Size size, String text) {
  final textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: AppTheme.textStyleExtraSmallWithPrimaryColor,
    ),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout(
    minWidth: 0,
    maxWidth: size.width,
  );
  final offset = Offset(x, y);
  textPainter.paint(canvas, offset);
}
