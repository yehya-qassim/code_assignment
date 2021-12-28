enum NetworkResponseErrorType {
  socket,
  exception,
  responseEmpty,
  didNotSucceededFromServer,
}

enum CallBackParameterName {
  all,
  results,
}

extension CallBackParameterNameExtension on CallBackParameterName {
  dynamic getJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    switch (this) {
      case CallBackParameterName.all:
        return json;
      case CallBackParameterName.results:
        return json['results'];
    }
  }
}
