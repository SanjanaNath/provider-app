
import '../../services/database/local_database.dart';

class ApiConfig {

  ///API Configurations..

  static const domainName = 'https://xern.proapp.in'; //Development
  // static const domainName = ''; //Production
  static const String version = '/api';
  static const String baseUrl = '$domainName$version';
  static const String mapsBaseUrl = 'https://maps.googleapis.com/maps/api';

  static const String privacyPolicyUrl = '$domainName/policy';
  static const String termsAndConditionsUrl = '$domainName/term_and_condition';
  static const String aboutUsUrl = '$domainName/about';
  static const String contactUsUrl = '$domainName/contact-us';
  static const String supportUrl = '$domainName/support';

  static Map<String, String> defaultHeaders() {
    return {'Authorization': 'Bearer ${LocalDatabase().accessToken}'};
  }
}

class ApiEndpoints {
  ///API EndPoints..

  //1) Auth APIs...
  static const String sendOtp = '/send_otp';

}
