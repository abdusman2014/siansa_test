import 'dart:convert';
import 'package:http/http.dart' as http;

const String MY_KEY = "AIzaSyDtfIM_Wwk39wRATD3hyyFxPpDZ-d8fT2M";
const String API_URL =
    "https://addressvalidation.googleapis.com/v1:validateAddress?key=$MY_KEY";

Future<Map<String, dynamic>> validateAddressFromSelection(String address,
    [bool enableUspsCass = true]) async {
  const String apiKey = MY_KEY;

  if (apiKey.isEmpty) {
    return {
      'isAddressValid': false,
      'formattedAddress': {'street': address},
    };
  }

  const String url = API_URL;

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final Map<String, dynamic> addressData = {
    "address": {
      "addressLines": [address]
    },
    // "enableUspsCass": enableUspsCass,
  };

  try {
    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(addressData));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final formattedAddress = result['result']['address']['postalAddress'];
      final isAddressValid =
          result['result']['verdict']['addressComplete'] ?? false;

      return {
        'isAddressValid': isAddressValid,
        'formattedAddress': {
          "street": formattedAddress['addressLines'][0],
          "city": formattedAddress['locality'],
          "state": formattedAddress['administrativeArea'],
          "postalCode": formattedAddress['postalCode'],
          "country": formattedAddress['regionCode'],
        },
      };
    }
  } catch (e) {
    // Handle exception here...
  }

  return {
    'isAddressValid': false,
    'formattedAddress': {'street': address},
  };
}

validateAddress(street, city, state, postalCode, country) async {
  // String address = '$street, $city, $state, $postalCode, $country';
  // final places = FlutterGooglePlacesSdk(MY_KEY);
  // final predictions = await places.findAutocompletePredictions('address');
  // print('Result: $predictions');
}
