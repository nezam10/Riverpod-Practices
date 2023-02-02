import 'app_config.dart';

class ApiURL {
  ApiURL._();

  static final String getCurrencyListUrl =
      '${AppConfig.baseUrl}cumin_api_test/api/common-data/currency-list';
  static final String getCompanyInfoUrl =
      '${AppConfig.baseUrl}cumin_api_test/api/setting/company-info';
  static final String getSingleUserInfoUrl =
      '${AppConfig.baseUrl}cumin_api_test/api/get-user-info';
}
