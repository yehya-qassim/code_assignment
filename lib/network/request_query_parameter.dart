import 'package:new_york_times_articles/statics/static_values.dart';

class RequestQP {
  const RequestQP._();

  static Map<String, String> getAPIKey() =>
      {'api-key': StaticValues.apiKey};
}