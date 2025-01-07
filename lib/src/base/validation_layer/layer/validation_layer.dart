import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fashion_mobile/src/base/validation_layer/cubit/validation_cubit.dart';
import 'package:fresh_fashion_mobile/src/common/presentation/screen/app_loading_screen.dart';
import 'package:fresh_fashion_mobile/src/common/presentation/screen/data_parsing_screen.dart';
import 'package:fresh_fashion_mobile/src/common/presentation/screen/disconnect_screen.dart';
import 'package:fresh_fashion_mobile/src/common/presentation/screen/unsupport_version_screen.dart';
import 'package:fresh_fashion_mobile/src/feature/authentication/presentation/screen/authentication_layer.dart';
import 'package:get_it/get_it.dart';

class ValidationLayer extends StatelessWidget {
  const ValidationLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      bloc: GetIt.instance.get<ValidationCubit>()..init(),
      builder: (context, state) {
        if (state is ValidatedValidationState) {
          return const AuthenticationLayer();
        }
        if (state is DisconnectedValidationState) {
          return const DisconnectScreen();
        }
        if (state is UnsupportedVersionValidationState) {
          return UnSupportVersionScreen(
            appVersion: (state).appVersion,
          );
        }
        if (state is ErrorDataParsingValidationState) {
          return const DataParsingScreen();
        }
        return const AppLoadingScreen();
      },
    );
  }
}
