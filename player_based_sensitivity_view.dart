import 'package:ProGuidance/ad_manager.dart';
import 'package:ProGuidance/config/config.dart';
import 'package:ProGuidance/utils/app_bar.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/viewmodels/sensitivityViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PlayerBasedSensitivityView extends StatefulWidget {
  @override
  _PlayerBasedSensitivityViewState createState() =>
      _PlayerBasedSensitivityViewState();
}

class _PlayerBasedSensitivityViewState extends State<PlayerBasedSensitivityView>
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
      create: (context) => SensitivityViewModel(
        null,
        animationController,
        Config.playerSensitivity,
      ),
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<SensitivityViewModel>(context);
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
                                'Player Based Sensitivity',
                                MediaQuery.of(context).size.width,
                              ),
                              AdManager.getBanner(true),
                              LimitedBox(
                                maxHeight:
                                    (MediaQuery.of(context).size.height - 150),
                                child: ReactiveFormConsumer(
                                    builder: (context, form, child) {
                                  List<Widget> currentControl =
                                      form.control('listData').value;
                                  return ListView.separated(
                                    cacheExtent: 30,
                                    itemCount: currentControl.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      animationController.forward();
                                      return currentControl[index];
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: 0,
                                      );
                                    },
                                  );
                                }),
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
