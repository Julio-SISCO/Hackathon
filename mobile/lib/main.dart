import 'package:djepe/src/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await dotenv.load(fileName: "assets/config/.env");
  runApp(const App());
}

