import 'package:niralakam_widget/convertor/niralakam_convertor.dart';
import 'package:niralakam_widget/model/card_image_model.dart';
import 'package:proguidancelayout/config/local-data.dart';
import 'package:proguidancelayout/injection_locator.dart';
import 'package:proguidancelayout/model/about_widget_model.dart';
import 'package:proguidancelayout/model/settings_model.dart';
import 'package:proguidancelayout/services/service-wrapper/base_service.dart';
import 'package:proguidancelayout/services/service-wrapper/local-storage-service.dart';
import 'package:proguidancelayout/services/service-wrapper/rest_client_service.dart';

class Services extends BaseService {
  var service = locator<RestClientService>();
  var local = locator<LocalStorageService>();

  Future<List<CardImageModel>> getScreenLayouts(String index) async {
    var result = <CardImageModel>[];
    if (index == '1') {
      result =
          NiralakamConvertor.cardWithImageOnlyFromMap(LocalData.controlLayouts);
    } else if (index == '2') {
      result = NiralakamConvertor.cardWithImageOnlyFromMap(
          LocalData.controlLayouts2);
    } else {
      result = NiralakamConvertor.cardWithImageOnlyFromMap(
          LocalData.controlLayouts3);
    }
    return result;
  }

  Future<List<AboutWidgetModel>> getAboutUs() async {
    var result = <AboutWidgetModel>[];

    if (result.length == 0) {
      result = aboutWidgetModelFromMap(LocalData.about);
    }
    return result;
  }

  Future<List<SettingsModel>> getSettings() async {
    var result = <SettingsModel>[];

    if (result.length == 0) {
      result = settingsModelFromMap(LocalData.controlSettings);
    }
    return result;
  }
}
