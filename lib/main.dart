import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fresh_fashion_mobile/core/config/dependency/dependency_config.dart';
import 'package:fresh_fashion_mobile/core/config/http/http_override_config.dart';
import 'package:fresh_fashion_mobile/core/presentation/orientation_config.dart';
import 'package:fresh_fashion_mobile/src/base/initial_layer/layer/initial_layer.dart';

Future<void> main() async {
  setOrientations();
  HttpOverrides.global = CustomHttpOverrides();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const InitialLayer();
  }
}