import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fashion_mobile/core/config/routes/route_path.dart';
import 'package:fresh_fashion_mobile/src/base/initial_layer/cubit/language_cubit/language_cubit.dart';
import 'package:fresh_fashion_mobile/src/base/initial_layer/layer/material_app_layer.dart';
import 'package:fresh_fashion_mobile/src/common/presentation/screen/app_loading_screen.dart';
import 'package:get_it/get_it.dart';

class InitialLayer extends StatelessWidget {
  const InitialLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      bloc: GetIt.instance.get<LanguageCubit>()..setupLanguage(),
      builder: (context, state) {
        if (state is SetupSuccessLanguageState) {
          Locale? locale;
          if (state.languageCode != null) {
            locale = Locale(state.languageCode);
          } else if (state.languageCode != null) {
            locale = Locale(state.languageCode);
          }
          return MaterialAppLayer(locale: locale);
        }
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutePath.root,
          home: AppLoadingScreen(),
        );
      },
    );
  }
}
