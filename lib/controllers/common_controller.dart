import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/company_info_model.dart';
import '../data/model/currency.dart';
import '../data/model/user_model.dart';
import '../data/providers/app_provider.dart';
import '../data/services/api_service.dart';

final currencyListProvider =
    FutureProvider.autoDispose<List<CurrencyModel>>((ref) async {
  print('currencyListProvider initialized');
  var result = ref.watch(appProvider);
  return result.getCurrencys();
});

final getCompanyInfo = FutureProvider<CompanyInfoModel?>((ref) async {
  var result = ref.watch(appProvider);
  return result.getCompanyInfo();
});

final getSingleUserInfoProvider = FutureProvider<UserModel?>((ref) async {
  print('=======get single user info common controller===>>>>>>>>');
  var result = ref.watch(apiServicesProvider);
  return result
      .getSingleUserInfo("preferences.getString(AppKeys.token).toString()");
});
