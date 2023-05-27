import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mybookstore/core/utils/constants.dart';
import 'package:mybookstore/core/utils/failures.dart';
import 'package:mybookstore/domain/entities/auth_response.dart';
import 'package:path_provider/path_provider.dart';

abstract class AuthLocalDataSource {
  Future<AuthResponse?> cacheUserData(AuthResponse user);
  Future<AuthResponse> getLoggedInUser();
  Future<void> logout();
}

class AppAuthLocalDataSource extends AuthLocalDataSource {
  final HiveInterface hive;

  AppAuthLocalDataSource({required this.hive});

  Future<Box?> _initDatabase(String boxName) async {
    try {
      if (!kIsWeb && !hive.isBoxOpen(boxName)) {
        final directory = await getApplicationDocumentsDirectory();
        hive.init(directory.path);
        hive.initFlutter();
      }

      log("Hive db initialized!");

      return await hive.openBox(boxName);
    } catch (e) {
      throw GeneralFailure("Hive db exception! $e");
    }
  }

  @override
  Future<AuthResponse?> cacheUserData(AuthResponse user) async {
    final userBox = await _initDatabase(ConstantValues.loggedInUserBox);

    if (userBox != null) {
      await userBox.put(
        ConstantValues.loggedInUserBox,
        json.encode(user.toJson()),
      );

      return user;
    }

    return null;
  }

  @override
  Future<AuthResponse> getLoggedInUser() async {
    final userBox = await _initDatabase(ConstantValues.loggedInUserBox);

    if (userBox != null) {
      final userString = await userBox.get(ConstantValues.loggedInUserBox);

      if (userString != null) {
        final userJson = json.decode(userString);

        return AuthResponse.fromJson(userJson);
      }
    }

    throw GeneralFailure(ConstantValues.noLoggedInUserMsg);
  }

  @override
  Future<void> logout() async {
    final userBox = await _initDatabase(ConstantValues.loggedInUserBox);

    if (userBox != null) {
      await userBox.deleteFromDisk();
    }
  }
}
