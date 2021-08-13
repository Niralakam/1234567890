import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
