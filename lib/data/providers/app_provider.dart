import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/values/api_url.dart';
import '../../common/values/app_constants.dart';
import '../model/company_info_model.dart';
import '../model/currency.dart';
import 'package:http/http.dart' as http;

final appProvider = Provider<AppProvider>((ref) {
  return AppProvider();
});

class AppProvider {
  AppProvider() {
    print('call app provider');
  }

  // List
  Future<List<CurrencyModel>> getCurrencys() async {
    final String apiUrl = ApiURL.getCurrencyListUrl;
    print('get currency  list $apiUrl');
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      //"Authorization": "Bearer ${preferences.getString(AppKeys.token)}"
    };
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: header);
      print(jsonDecode(response.body));
      final result = jsonDecode(response.body);
      if (response.statusCode == 200 && result[AppConst.success] == true) {
        return currencyModelFromJson(result[AppConst.data]);
      } else {
        return [];
      }
    } catch (error) {
      print('get currency list error :  $error ');
      (error);
      return [];
    }
  }

  // CompanyInfoModel

  Future<CompanyInfoModel?> getCompanyInfo() async {
    final String apiUrl = ApiURL.getCompanyInfoUrl;
    print(apiUrl);

    Map<String, String> headerData = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final result = jsonDecode(response.body);
      print('result==response $result');

      print('resutll = getCompanyInfo = ${response.statusCode}');
      if (response.statusCode == 200) {
        return CompanyInfoModel.fromMap(result[AppConst.data]);
      }
    } catch (error) {
      print('get Company Info failed $error');
    }
  }
}
