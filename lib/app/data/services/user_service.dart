import 'dart:convert';
import 'dart:io';
import 'package:model_classes/app/helpers/http_helper.dart';
import 'package:model_classes/app/models/user_model.dart';
import 'package:model_classes/app/models/user_model_2.dart';

class UserService {
  Future<UserModel> getUserModel() async {
    try {
      final _response = await httpHelper.getClient('users');
      final _userModel = userModelFromJson(_response.body);
      return _userModel;
    } catch (e) {
      throw HttpException(e);
    }
  }

  Future<List<UserModelData>> getUserData() async {
    try {
      final _response = await httpHelper.getClient('users');
      final _userModel = userModelFromJson(_response.body);
      return _userModel.data;
    } catch (e) {
      throw HttpException(e);
    }
  }

  Future<List<UserModelData2>> getUserData2() async {
    try {
      final _response = await httpHelper.getClient('users');
      final _responseBody = json.decode(_response.body);
      final _responseBodyData = _responseBody['data'];

      print("_responseBodyData: $_responseBodyData");
      print("_responseBodyData.length: ${_responseBodyData.length}");

      List<UserModelData2> _userList = [];
      for (var data in _responseBodyData) {
        UserModelData2 _data = UserModelData2.fromJson(data);
        _userList.add(_data);
      }

      return _userList;
    } catch (e) {
      throw HttpException(e);
    }
  }
}

final UserService userService = UserService();
