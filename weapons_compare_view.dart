import 'package:ProGuidance/ad_manager.dart';
import 'package:ProGuidance/model/dropdown_weapons_model.dart';
import 'package:ProGuidance/utils/app_bar.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/viewmodels/weapon_compare_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class WeaponsCompare extends StatefulWidget {
  @override
  _WeaponsCompareState createState() => _WeaponsCompareState();
}

class _WeaponsCompareState extends State<WeaponsCompare>
    with TickerProviderStateMixin {
  @override
  void initState() {
    if (AdManager.isShowAdd) {
      AdManager.loadInterstitialAd();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AnimationController animationController = AnimationController(
      duration: Duration(milliseconds: AppTheme.milliseconds),
      vsync: this,
    );
    return BlocProvider(
      create: (context) => WeaponCompareViewModel(null, animationController),
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<WeaponCompareViewModel>(context);
          return Container(
            color: AppTheme.background,
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: <Widget>[
                    ReactiveForm(
                      formGroup: viewModel.form,
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: new Container(
                          height: (MediaQuery.of(context).size.height),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              appBar(
                                'Weapons Compare',
                                MediaQuery.of(context).size.width,
                              ),
                              AdManager.getBanner(true),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          AppTheme.sizedBoxEmpty,
                                          Container(
                                            child: ReactiveFormConsumer(builder:
                                                (context, form, child) {
                                              List<DropdownWeaponsModel>
                                                  mapData = form
                                                      .control(
                                                          'firstDropdownData')
                                                      .value;
                                              return ReactiveDropdownField<
                                                  DropdownWeaponsModel>(
                                                formControlName:
                                                    'firstSelectedValue',
                                                items: mapData
                                                    .map(
                                                      (x) => DropdownMenuItem(
                                                        child: Text(x.value),
                                                        value: x,
                                                      ),
                                                    )
                                                    .toList(),
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          AppTheme.sizedBoxEmpty,
                                          Container(
                                            child: ReactiveFormConsumer(builder:
                                                (context, form, child) {
                                              List<DropdownWeaponsModel>
                                                  mapData = form
                                                      .control(
                                                          'secondDropdownData')
                                                      .value;
                                              return ReactiveDropdownField<
                                                  DropdownWeaponsModel>(
                                                formControlName:
                                                    'secondSelectedValue',
                                                items: mapData
                                                    .map(
                                                      (x) => DropdownMenuItem(
                                                        child: Text(x.value),
                                                        value: x,
                                                      ),
                                                    )
                                                    .toList(),
                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              LimitedBox(
                                maxHeight:
                                    (MediaQuery.of(context).size.height - 200),
                                child: ReactiveFormConsumer(
                                  builder: (context, form, child) {
                                    var data = viewModel.updateListData(
                                      form.control('firstSelectedValue').value,
                                      form.control('secondSelectedValue').value,
                                    );
                                    return ListView.separated(
                                      itemCount: data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        animationController.forward();
                                        return data[index];
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 0,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:ProGuidance/ad_manager.dart';
// import 'package:ProGuidance/model/dropdown_weapons_model.dart';
// import 'package:ProGuidance/utils/app_bar.dart';
// import 'package:ProGuidance/utils/app_theme.dart';
// import 'package:ProGuidance/viewmodels/weapon_compare_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// class WeaponsCompare extends StatefulWidget {
//   @override
//   _WeaponsCompareState createState() => _WeaponsCompareState();
// }

// class _WeaponsCompareState extends State<WeaponsCompare>
//     with TickerProviderStateMixin {
//   @override
//   void initState() {
//     if (AdManager.isShowAdd) {
//       AdManager.loadInterstitialAd();
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     AnimationController animationController = AnimationController(
//       duration: Duration(milliseconds: AppTheme.milliseconds),
//       vsync: this,
//     );
//     return BlocProvider(
//       create: (context) => WeaponCompareViewModel(null, animationController),
//       child: Builder(
//         builder: (context) {
//           final viewModel = Provider.of<WeaponCompareViewModel>(context);
//           return Container(
//             color: AppTheme.background,
//             child: Padding(
//               padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//               child: Scaffold(
//                 backgroundColor: Colors.transparent,
//                 body: Stack(
//                   children: <Widget>[
//                     ReactiveForm(
//                       formGroup: viewModel.form,
//                       child: SingleChildScrollView(
//                         physics: ClampingScrollPhysics(),
//                         child: new Container(
//                           height: (MediaQuery.of(context).size.height),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               appBar(
//                                 'Weapon Comparision',
//                                 MediaQuery.of(context).size.width,
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   left: AppTheme.paddingDoubleExtraLarge,
//                                   right: AppTheme.paddingDoubleExtraLarge,
//                                 ),
//                                 child: Row(
//                                   children: <Widget>[
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           AppTheme.sizedBoxEmpty,
//                                           Container(
//                                             child: ReactiveFormConsumer(builder:
//                                                 (context, form, child) {
//                                               List<DropdownWeaponsModel>
//                                                   mapData = form
//                                                       .control(
//                                                           'firstDropdownData')
//                                                       .value;
//                                               return ReactiveDropdownField<
//                                                   DropdownWeaponsModel>(
//                                                 formControlName:
//                                                     'firstSelectedValue',
//                                                 items: mapData
//                                                     .map(
//                                                       (x) => DropdownMenuItem(
//                                                         child: Text(x.value),
//                                                         value: x,
//                                                       ),
//                                                     )
//                                                     .toList(),
//                                               );
//                                             }),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           AppTheme.sizedBoxEmpty,
//                                           Container(
//                                             child: ReactiveFormConsumer(builder:
//                                                 (context, form, child) {
//                                               List<DropdownWeaponsModel>
//                                                   mapData = form
//                                                       .control(
//                                                           'secondDropdownData')
//                                                       .value;
//                                               return ReactiveDropdownField<
//                                                   DropdownWeaponsModel>(
//                                                 formControlName:
//                                                     'secondSelectedValue',
//                                                 items: mapData
//                                                     .map(
//                                                       (x) => DropdownMenuItem(
//                                                         child: Text(x.value),
//                                                         value: x,
//                                                       ),
//                                                     )
//                                                     .toList(),
//                                               );
//                                             }),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
