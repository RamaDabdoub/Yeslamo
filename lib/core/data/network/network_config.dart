
import 'package:empty_code/core/enums/request_type.dart';
import 'package:empty_code/ui/shared/utils.dart';

class NetworkConfig {
  static Map<String, String> getHeaders(
      {bool? needAuth = false,
      required RequestType type,
      Map<String, String>? extraHeaders}) {
    return {
      // if (needAuth!) "Authorization": "Bearer ${storage.getTokenInfo().token}",
      if (type != RequestType.get) "Content-Type": "application/json",
      if (extraHeaders != null) ...extraHeaders,
      "Accept-Language": storage.getAppLanguage()
    };
  }
}
