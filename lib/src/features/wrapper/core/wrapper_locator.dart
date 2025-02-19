import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../http/custom_client_http.dart';
import '../http/http_impl.dart';

wrapperDidSetup(GlobalKey<NavigatorState> navigator){
  GetIt.instance.registerLazySingleton<CustomClientHttp>(
      () => HttpImpl(httpClient: Client()));
}