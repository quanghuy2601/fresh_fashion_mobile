import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fashion_mobile/core/config/dependency/dependency_config.dart';
import 'package:fresh_fashion_mobile/core/config/http/http_override_config.dart';
import 'package:fresh_fashion_mobile/core/config/supabase/supabase_connection.dart';
import 'package:fresh_fashion_mobile/core/presentation/orientation_config.dart';
import 'package:fresh_fashion_mobile/src/base/initial_layer/layer/initial_layer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/bloc/navigation_bloc/navigation_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setOrientations();
  HttpOverrides.global = CustomHttpOverrides();
  await configureDependencies();
  await dotenv.load(fileName: ".env");
  supabaseConnection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<NavigationBloc>()),
      ],
      child: const InitialLayer(),
    );
  }
}
