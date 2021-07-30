import 'package:ProGuidance/utils/app_bar.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:ProGuidance/viewmodels/applicationViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ApplicationView extends StatefulWidget {
  @override
  _ApplicationViewState createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView>
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
          ApplicationViewModel(null, animationController, width),
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<ApplicationViewModel>(context);
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
                      'About',
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
