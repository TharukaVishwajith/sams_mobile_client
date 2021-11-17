import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sams/model/staff_model.dart';

import '../secure_store.dart';

class UserService {

  FlutterSecureStorage secureStorage = SecureStore().flutterSecureStorage;

  updateLoggedUser(StaffResponse user){
    secureStorage.write(key: "LoggedUser_name", value: user.name);
    secureStorage.write(key: "LoggedUser_staffNo", value: user.staffNo);
    secureStorage.write(key: "LoggedUser_nicNo", value: user.nicNo);
    secureStorage.write(key: "LoggedUser_uniEmail", value: user.uniEmail);
    secureStorage.write(key: "LoggedUser_imageUrl", value: user.imageUrl);
    secureStorage.write(key: "LoggedUser_imageDataBase64", value: user.imageDataBase64);
  }

  removeLoggedUser(){
    secureStorage.delete(key: "LoggedUser_name");
    secureStorage.delete(key: "LoggedUser_staffNo");
    secureStorage.delete(key: "LoggedUser_nicNo");
    secureStorage.delete(key: "LoggedUser_uniEmail");
    secureStorage.delete(key: "LoggedUser_imageUrl");
    secureStorage.delete(key: "LoggedUser_imageDataBase64");
  }
}
