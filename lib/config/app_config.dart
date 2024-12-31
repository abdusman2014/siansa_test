import 'dev/dev_keys.dart'; // DEV
import 'prod/prod_keys.dart'; // PROD

bool isDevelopmentMode = true;

class AppConfig {
  // APP VERSION

  String appVersion = "1.0.0";

  // URLS

  String privacyPolicyUrl = "";

  // GCP - APP ENGINE

  var appEngineFunctionsURL = isDevelopmentMode
      ? DevKeys.appEngineFunctionsURL
      : ProdKeys.appEngineFunctionsURL;

  // STRIPE

  var stripeDataCollectionDocID = isDevelopmentMode
      ? DevKeys.stripeDataCollectionDocID
      : ProdKeys.stripeDataCollectionDocID;

  // REVENUE CAT - API KEY

  var revenueCatAppApiKey = isDevelopmentMode
      ? DevKeys.revenueCatAppApiKey
      : ProdKeys.revenueCatAppApiKey;
}
