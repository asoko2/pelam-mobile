import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

import '../models/models.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    var storage = const FlutterSecureStorage();
    var userStorage = await storage.read(key: 'user');
    var userData = jsonDecode(userStorage!);
    if (_user != null) return _user;
    var userDataFromJson = User.fromJson(userData);
    return userDataFromJson;
  }
}
