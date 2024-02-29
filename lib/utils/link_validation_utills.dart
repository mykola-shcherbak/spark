import 'package:spark_test/api/task_api.dart';

bool validateLink(String link) {
  bool isQuerryparams = link.startsWith('${TaskApiClient.getRequestUrl}?');
  bool isAbsolute = Uri.parse(link).isAbsolute;
  bool isInitial = link == TaskApiClient.getRequestUrl;
  bool isValid = (isQuerryparams || isInitial) && isAbsolute;
  return isValid;
}
