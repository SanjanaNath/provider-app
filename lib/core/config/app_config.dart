
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../services/database/local_database.dart';



class AppConfig {
  ///APP Configurations..
  static const String name = 'Provider Setup';
  static const String version = '1.0';
  static const String packageName = 'app.xern.com';

  static const String playStoreUrl = 'https://play.google.com/store/apps/details?id=$packageName';
  static const String appStoreUrl = 'https://apps.apple.com/us/app/sparkcars/id6448360361';
  static const String deeplinkUrl = 'https://xern.page.link/downlaod';

  //Hindustan Payment Keys
  // static String razorPayApiKey = 'rzp_live_aWlOkCj8Ek8IVP';
  // static String razorPayApiKey = 'rzp_test_cEfSyiGggg7hxK';

  static String razorPayApiKey = 'rzp_test_XkPxsZaRFLEJzi';

  static String apkLink() {
    String url;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      url = appStoreUrl;
    } else {
      url = playStoreUrl;
    }
    return url;
  }

  static const String fcmServerKey =
      'AAAAp_zjZs4:APA91bFz3fczJtxZwXm2Cj_VTIweBB3ld9B3Xcbn37L00C58y6shi8cZjlb_9y514DmGmef505UUbQzlV2zaSX2qz3iLhel0D3qsZiNC6j-qjJ7g_-4MW8ppKtF7kzk2CKogoqgcb6Yd';
  static const String mapAddressesApiKey = 'AIzaSyAaq-CLNOFfMMtll9c3LV2wpFTITExbud4';

  static const String countryCode = '+91';
  static const String mobileNumber = '+91 9876543210';

  static Future<String> referFriend(BuildContext context) async {
    LocalDatabase localDatabase = Provider.of<LocalDatabase>(context, listen: false);

    String message =
        "Unlock exclusive rewards! Get $name now using my referral code when you download from ${apkLink()}. Let's level up and earn together!";

    Share.share(message);
    return message;
  }

  ///Notification Channel Id...
  static const String chanelName = 'Xern';

  ///Local Database Configurations..
  static const String databaseName = 'database';

  static generateDeviceToken() async {
    try {
      // String? deviceToken = await FirebaseMessaging.instance.getToken(vapidKey: fcmServerKey);
      String? deviceToken = fcmServerKey ; // Not for use
      if (deviceToken != null) {
        LocalDatabase().setDeviceToken(deviceToken);
      }

      debugPrint('Device Token is $deviceToken');
    } catch (e, s) {
      debugPrint('Device Token Not Found Error');
      debugPrint('Error is $e & Stack is $s');
    }
  }
}
