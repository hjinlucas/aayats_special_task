import 'package:flutter/material.dart';
import 'services/storage.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize the StorageService
    storageService = await StorageService().init();
  }
}
