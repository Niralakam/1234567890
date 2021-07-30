// import 'package:ProGuidance/injection_locator.dart';
// import 'package:ProGuidance/services/service-wrapper/local-storage-service.dart';

class BaseService {
  // var userService = locator<LocalStorageService>();
  Map<String, String> header;
  String token = "";
  BaseService() {
    header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization': 'Bearer '
    };

    // var userDetails = userService.getAll("USER_DETAILS");
    // if (userDetails != null && userDetails['token'] != null) {
    //   token = userDetails['token'];
    //   header = <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'authorization': 'Bearer ' + userDetails['token']
    //   };
    // }
  }
}
