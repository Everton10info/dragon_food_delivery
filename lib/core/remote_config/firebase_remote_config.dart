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
        minimumFetchInterval: Duration.zero,
      ));
      _firebaseRemoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> find(key) async {
    try {
      await _firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));
      _firebaseRemoteConfig.fetchAndActivate();
      return _firebaseRemoteConfig.getString(key);
    } catch (e) {
      debugPrint(e.toString());
    }
    return '';
  }
}
