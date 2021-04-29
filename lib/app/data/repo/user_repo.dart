import 'package:model_classes/app/data/services/user_service.dart';
import 'package:model_classes/app/models/user_model.dart';
import 'package:model_classes/app/models/user_model_2.dart';

class UserRepository {
  Future<UserModel> getUserModel() async {
    return await userService.getUserModel();
  }

  Future<List<UserModelData>> getUserData() async {
    return await userService.getUserData();
  }

  Future<List<UserModelData2>> getUserData2() async {
    return await userService.getUserData2();
  }
}

final UserRepository userRepository = UserRepository();
