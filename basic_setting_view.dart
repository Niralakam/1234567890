import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:niralakam_widget/widget/title_widget/title_widget.dart';
import 'package:proguidancelayout/ad_manager.dart';
import 'package:proguidancelayout/utils/app_bar.dart';
import 'package:proguidancelayout/utils/app_theme.dart';
import 'package:proguidancelayout/utils/h2_title_widget/h2_title_widget.dart';
import 'package:proguidancelayout/utils/p_widget/p_widget.dart';
import 'package:proguidancelayout/viewmodels/basic_setting_view_model.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BasicSettingView extends StatefulWidget {
  @override
  _BasicSettingViewState createState() => _BasicSettingViewState();
}

class _BasicSettingViewState extends State<BasicSettingView>
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
      create: (context) => BasicSettingViewModel(null),
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<BasicSettingViewModel>(context);
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
                                'Basic Settings',
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
                                  if (currentControl.length > 0) {
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
                                  } else {
                                    return SizedBox(
                                      height: 0,
                                    );
                                  }
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
