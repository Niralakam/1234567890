import 'dart:async';
import 'dart:convert';
import 'package:ProGuidance/config/config.dart';
import 'package:ProGuidance/model/response_model.dart';
import 'package:http/http.dart' as http;

class RestClientService {
  Future<bool> header(Uri url) async {
    bool result = false;
    var client = http.Client();
    try {
      var response = await client.head(url).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        result = true;
      }
    } catch (e) {
      result = false;
    } finally {
      client.close();
    }
    return result;
  }

  Future<ResponseModel> get(String url, {Map headers}) async {
    var result = new ResponseModel();
    var client = http.Client();
    try {
      var formattedUrl = Uri.parse((Config.authBaseUrl + url));
      var isValid = await this.header(formattedUrl);
      if (isValid) {
        var response = await client
            .get(formattedUrl, headers: headers)
            .timeout(const Duration(seconds: 20));
        if (response.statusCode == 200 && response.body != null) {
          var formattedData = json.decode(response.body);
          if (formattedData != null &&
              formattedData['isError'] != null &&
              formattedData['isError'] == false &&
              formattedData['data'] != null) {
            result.isError = false;
            result.data = formattedData['data'];
          } else {
            result.isError = true;
          }
        } else {
          result.isError = true;
        }
      } else {
        result.isError = true;
      }
    } catch (e) {
      result.isError = true;
    } finally {
      client.close();
    }
    return result;
  }
}
