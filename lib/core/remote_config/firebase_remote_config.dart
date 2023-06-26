import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class CustomRemoteConfig {
  late FirebaseRemoteConfig _firebaseRemoteConfig;
  CustomRemoteConfig._internal();
  static final CustomRemoteConfig _singleton = CustomRemoteConfig._internal();

  factory CustomRemoteConfig() => _singleton;

  Future<void> initialize() async {
    _firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    try {
      await _firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 20),
      ));
    } catch (e) {
      //TODO implements errors
      debugPrint(e.toString());
    }
  }

  Future<void> find(key) async {
    try {
      await _firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));
      var _value = _firebaseRemoteConfig.getInt(key);
      print(_value);
    } catch (e) {
      print(e.toString());
      debugPrint(e.toString());
    }
  }
}
