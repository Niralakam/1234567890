// import 'dart:convert';
import 'package:ProGuidance/config/local-data-weapons.dart';
import 'package:ProGuidance/injection_locator.dart';
// import 'package:ProGuidance/config/config.dart';
import 'package:ProGuidance/config/local-data.dart';
import 'package:ProGuidance/model/card_horizontal_first_widget_model.dart';
import 'package:ProGuidance/model/card_horizontal_first_with_sub_widget_model.dart';
import 'package:ProGuidance/model/dropdown_weapons_model.dart';
import 'package:ProGuidance/services/service-wrapper/base_service.dart';
import 'package:ProGuidance/services/service-wrapper/local-storage-service.dart';
import 'package:ProGuidance/services/service-wrapper/rest_client_service.dart';
import 'package:ProGuidance/model/card_horizontal_second_widget_model.dart';
import 'package:ProGuidance/model/card_vertical_content_widget_model.dart';
import 'package:ProGuidance/model/map_details_widget_model.dart';
import 'package:ProGuidance/model/about_widget_model.dart';
import 'package:ProGuidance/model/card_with_image_only_model.dart';
import 'package:ProGuidance/model/dropdown_model.dart';

class Services extends BaseService {
  var service = locator<RestClientService>();
  var local = locator<LocalStorageService>();
  Future<List<CardHorizontalFirstWidgetModel>> getVehicles() async {
    var result = <CardHorizontalFirstWidgetModel>[];
    // var response = await service.get(
    //   Config.vehicles,
    //   headers: header,
    // );
    // if (response.isError == false) {
    //   var encodedData = jsonEncode(response.data);
    //   if (encodedData != null) {
    //     result = cardHorizontalFirstWidgetModelFromMap(encodedData);
    //     local.remove('VEHICLES');
    //     local.set('VEHICLES', encodedData);
    //   }
    // } else {
    //   var decodedData = local.getAll('VEHICLES');
    //   if (decodedData != null) {
    //     var encodedData = jsonEncode(decodedData);
    //     result = cardHorizontalFirstWidgetModelFromMap(encodedData);
    //   }
    // }
    if (result.length == 0) {
      result = cardHorizontalFirstWidgetModelFromMap(LocalData.vehicles);
    }
    return result;
  }

  Future<List<CardHorizontalFirstWidgetModel>> getConsumables() async {
    var result = <CardHorizontalFirstWidgetModel>[];
    // var response = await service.get(
    //   Config.consumables,
    //   headers: header,
    // );
    // if (response.isError == false) {
    //   var encodedData = jsonEncode(response.data);
    //   if (encodedData != null) {
    //     result = cardHorizontalFirstWidgetModelFromMap(encodedData);
    //     local.remove('CONSUMABLES');
    //     local.set('CONSUMABLES', encodedData);
    //   }
    // } else {
    //   var decodedData = local.getAll('CONSUMABLES');
    //   if (decodedData != null) {
    //     var encodedData = jsonEncode(decodedData);
    //     result = cardHorizontalFirstWidgetModelFromMap(encodedData);
    //   }
    // }
    if (result.length == 0) {
      result = cardHorizontalFirstWidgetModelFromMap(LocalData.consumables);
    }
    return result;
  }

  Future<List<CardHorizontalSecondWidgetModel>> getSensitivity(
      String url) async {
    var result = <CardHorizontalSecondWidgetModel>[];
    // var key = 'PLAYER_SENSITIVITY';
    // if (url.contains('device')) {
    //   key = 'RAM_SENSITIVITY';
    // }
    // var response = await service.get(
    //   url,
    //   headers: header,
    // );
    // if (response.isError == false) {
    //   var encodedData = jsonEncode(response.data);
    //   if (encodedData != null) {
    //     result = cardHorizontalSecondWidgetModelFromMap(encodedData);
    //     local.remove(key);
    //     local.set(key, encodedData);
    //   }
    // } else {
    //   var decodedData = local.getAll(key);
    //   if (decodedData != null) {
    //     var encodedData = jsonEncode(decodedData);
    //     result = cardHorizontalSecondWidgetModelFromMap(encodedData);
    //   }
    // }
    if (result.length == 0) {
      var localData = '';
      if (url.contains('device')) {
        localData = LocalData.ramSensitivity;
      } else {
        localData = LocalData.playerSensitivity;
      }
      result = cardHorizontalSecondWidgetModelFromMap(localData);
    }
    return result;
  }

  Future<List<CardWithImageOnlyModel>> getScreenLayouts() async {
    var result = <CardWithImageOnlyModel>[];
    // var key = 'SCREEN_LAYOUTS';
    // var response = await service.get(
    //   Config.controlLayouts,
    //   headers: header,
    // );
    // if (response.isError == false) {
    //   var encodedData = jsonEncode(response.data);
    //   if (encodedData != null) {
    //     result = cardWithImageOnlyFromMap(encodedData);
    //     local.remove(key);
    //     local.set(key, encodedData);
    //   }
    // } else {
    //   var decodedData = local.getAll(key);
    //   if (decodedData != null) {
    //     var encodedData = jsonEncode(decodedData);
    //     result = cardWithImageOnlyFromMap(encodedData);
    //   }
    // }
    if (result.length == 0) {
      result = cardWithImageOnlyFromMap(LocalData.controlLayouts);
    }
    return result;
  }

  Future<List<CardVerticalContentWidgetModel>> getCircleDetails() async {
    var result = <CardVerticalContentWidgetModel>[];
    // var key = 'CIRCLE_DETAILS';
    // local.remove(key);
    // var response = await service.get(
    //   Config.circles,
    //   headers: header,
    // );
    // if (response.isError == false) {
    //   var encodedData = jsonEncode(response.data);
    //   if (encodedData != null) {
    //     result = cardVerticalContentWidgetModelFromMap(encodedData);
    //     local.remove(key);
    //     local.set(key, encodedData);
    //   }
    // } else {
    //   var decodedData = local.getAll(key);
    //   if (decodedData != null) {
    //     var encodedData = jsonEncode(decodedData);
    //     result = cardVerticalContentWidgetModelFromMap(encodedData);
    //   }
    // }
    if (result.length == 0) {
      result = cardVerticalContentWidgetModelFromMap(LocalData.circles);
    }
    return result;
  }

  Future<List<String>> getMaps() async {
    var result = <String>[];
    var tempResult;
    // var key = 'MAPS';
    // var response = await service.get(
    //   Config.dropdownMaps,
    //   headers: header,
    // );
    // if (response.isError == false) {
    //   var encodedData = jsonEncode(response.data);
    //   if (encodedData != null) {
    //     tempResult = dropdownModelFromMap(encodedData);
    //     local.remove(key);
    //     local.set(key, encodedData);
    //   }
    // } else {
    //   var decodedData = local.getAll(key);
    //   if (decodedData != null) {
    //     var encodedData = jsonEncode(decodedData);
    //     tempResult = dropdownModelFromMap(encodedData);
    //   }
    // }
    if (tempResult == null || tempResult.length == 0) {
      tempResult = dropdownModelFromMap(LocalData.maps);
    }
    if (tempResult != null && tempResult.length > 0) {
      tempResult.forEach((element) {
        result.add(element.name);
      });
    }
    return result;
  }

  Future<List<AboutWidgetModel>> getAboutUs() async {
    var result = <AboutWidgetModel>[];
    // var key = 'ABOUT_US';
    // var response = await service.get(
    //   Config.aboutus + "?name=Battleground Pubg Mobile Guidance",
    //   headers: header,
    // );
    // if (response.isError == false) {
    //   var encodedData = jsonEncode(response.data);
    //   if (encodedData != null) {
    //     result = aboutWidgetModelFromMap(encodedData);
    //     local.remove(key);
    //     local.set(key, encodedData);
    //   }
    // } else {
    //   var decodedData = local.getAll(key);
    //   if (decodedData != null) {
    //     var encodedData = jsonEncode(decodedData);
    //     result = aboutWidgetModelFromMap(encodedData);
    //   }
    // }
    if (result.length == 0) {
      result = aboutWidgetModelFromMap(LocalData.about);
    }
    return result;
  }

  Future<List<DropdownWeaponsModel>> getDropdownWeapons() async {
    var result = <DropdownWeaponsModel>[];
    // var tempResult = <DropdownWeaponsModel>[];
    // var key = 'DROPDOWN_WEAPONS';
    // var response = await service.get(
    //   Config.dropdownWeapons,
    //   headers: header,
    // );
    // if (response.isError == false) {
    //   var encodedData = jsonEncode(response.data);
    //   if (encodedData != null) {
    //     result = dropdownWeaponsModelFromMap(encodedData);
    //     local.remove(key);
    //     local.set(key, encodedData);
    //   }
    // } else {
    //   var decodedData = local.getAll(key);
    //   if (decodedData != null) {
    //     var encodedData = jsonEncode(decodedData);
    //     result = dropdownWeaponsModelFromMap(encodedData);
    //   }
    // }
    if (result.length == 0) {
      result = dropdownWeaponsModelFromMap(LocalData.dropdownWeapons);
    }
    // if (tempResult != null && tempResult.length > 0) {
    //   tempResult.forEach((element) {
    //     result.add(element.value);
    //   });
    // }
    return result;
  }

  Future<List<MapDetailsWidgetModel>> getMapsDetails() async {
    var result = <MapDetailsWidgetModel>[];
    // var key = 'MAP_DETAILS';
    // var response = await service.get(
    //   Config.mapDetails + "?name=Battleground Pubg Mobile Guidance",
    //   headers: header,
    // );
    // if (response.isError == false) {
    //   var encodedData = jsonEncode(response.data);
    //   if (encodedData != null) {
    //     result = mapDetailsWidgetModelFromMap(encodedData);
    //     local.remove(key);
    //     local.set(key, encodedData);
    //   }
    // } else {
    //   var decodedData = local.getAll(key);
    //   if (decodedData != null) {
    //     var encodedData = jsonEncode(decodedData);
    //     result = mapDetailsWidgetModelFromMap(encodedData);
    //   }
    // }
    if (result.length == 0) {
      result = mapDetailsWidgetModelFromMap(LocalData.mapDetails);
    }
    return result;
  }

  Future<List<CardHorizontalFirstWithSubWidgetModel>>
      getWeaponsDetails() async {
    var result = <CardHorizontalFirstWithSubWidgetModel>[];
    // var key = 'WEAPONS_DETAILS';
    // var response = await service.get(
    //   Config.weapons,
    //   headers: header,
    // );
    // if (response.isError == false) {
    //   var encodedData = jsonEncode(response.data);
    //   if (encodedData != null) {
    //     result = cardHorizontalFirstWithSubWidgetModelFromMap(encodedData);
    //     local.remove(key);
    //     local.set(key, encodedData);
    //   }
    // } else {
    //   var decodedData = local.getAll(key);
    //   if (decodedData != null) {
    //     var encodedData = jsonEncode(decodedData);
    //     result = cardHorizontalFirstWithSubWidgetModelFromMap(encodedData);
    //   }
    // }
    if (result.length == 0) {
      result = cardHorizontalFirstWithSubWidgetModelFromMap(
          LocalDataWeapons.weapons);
    }
    return result;
  }
}
