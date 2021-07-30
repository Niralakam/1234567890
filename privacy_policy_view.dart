import 'package:ProGuidance/utils/app_bar.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/viewmodels/privacyPolicyViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PrivacyPolicyView extends StatefulWidget {
  @override
  _PrivacyPolicyViewState createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AnimationController animationController = AnimationController(
      duration: Duration(milliseconds: AppTheme.milliseconds),
      vsync: this,
    );
    var width = (MediaQuery.of(context).size.width) / 5;

    return BlocProvider(
      create: (context) =>
          PrivacyPolicyViewModel(null, animationController, width),
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<PrivacyPolicyViewModel>(context);
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
                          child: ReactiveFormConsumer(
                              builder: (context, form, child) {
                            List<Widget> currentControl =
                                form.control('listData').value;
                            return ListView.separated(
                              itemCount: currentControl.length,
                              itemBuilder: (BuildContext context, int index) {
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
                      ),
                    ),
                    appBar(
                      'Privacy Policy',
                      MediaQuery.of(context).size.width,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
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
