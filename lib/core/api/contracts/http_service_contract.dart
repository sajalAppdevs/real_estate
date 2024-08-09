import 'package:dio/dio.dart';


abstract class HttpServiceContract {
  Dio get dio;

  Dio get tokenDio;

  lock();

  unlock();

  setCurrentUser(String authToken, [String refreshToken, DateTime expiresIn]);

  removeCurrentUser();

  // setCurrentDevice(DeviceModel activeDevice);

  setActiveProfile(String profileID);

  clearActiveProfile();
}
