import 'package:ProGuidance/ad_manager.dart';
import 'package:ProGuidance/viewmodels/map_details_view_model.dart';
import 'package:ProGuidance/utils/app_bar.dart';
import 'package:ProGuidance/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with TickerProviderStateMixin {
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
      create: (context) => MapDetailsViewModel(null, animationController),
      child: Builder(
        builder: (context) {
          final viewModel = Provider.of<MapDetailsViewModel>(context);
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
                                'Map Details',
                                MediaQuery.of(context).size.width,
                              ),
                              AdManager.getBanner(true),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 0,
                                ),
                                child: ReactiveFormConsumer(
                                    builder: (context, form, child) {
                                  List<String> mapData =
                                      form.control('mapData').value;
                                  return ReactiveDropdownField<String>(
                                    formControlName: 'selectedMap',
                                    items: mapData
                                        .map(
                                          (x) => DropdownMenuItem(
                                            child: Text(x),
                                            value: x,
                                          ),
                                        )
                                        .toList(),
                                  );
                                }),
                              ),
                              LimitedBox(
                                maxHeight:
                                    (MediaQuery.of(context).size.height - 185),
                                child: ReactiveValueListenableBuilder<String>(
                                  formControlName: 'selectedMap',
                                  builder: (context, value, child) {
                                    var selectedData =
                                        viewModel.updateListData(value.value);
                                    return ListView.separated(
                                      itemCount: selectedData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        animationController.forward();
                                        return selectedData[index];
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
